# Sauron::Util.pm
#
# Copyright (c) Timo Kokkonen <tjko@iki.fi>  2000-2003,2005.
# $Id: Util.pm,v 1.25 2009/02/05 09:28:30 tjko Exp $
#
package Sauron::Util;
require Exporter;
use Time::Local 'timelocal_nocheck';
use Digest::MD5;
use Net::Netmask;
use POSIX qw(strftime);
use Net::IP qw(:PROC);
use strict;
use vars qw($VERSION @ISA @EXPORT);
use Sys::Syslog qw(:DEFAULT setlogsock);
Sys::Syslog::setlogsock('unix');
use Data::Dumper;


sub write2log{
  my $msg       = shift;
  my $filename  = File::Basename::basename($0);
   
  Sys::Syslog::openlog($filename, "cons,pid", "debug");
  Sys::Syslog::syslog("info", "$msg");
  Sys::Syslog::closelog();
} # End of write2log
   

$VERSION = '$Id: Util.pm,v 1.25 2009/02/05 09:28:30 tjko Exp $ ';

@ISA = qw(Exporter); # Inherit from Exporter
@EXPORT = qw(
	     valid_domainname_check
	     valid_domainname
	     valid_texthandle
	     is_cidr
	     is_ip
	     decode_cidr
	     is_cidr_within_cidr
	     arpa2cidr
	     cidr2arpa
	     ip2int
	     int2ip
	     adjust_ip
	     is_ip6_prefix
	     is_ip6
	     normalize_ip6
	     ip6_to_ip6int
	     net_ip_list
	     remove_origin
	     add_origin
	     pwd_crypt_md5
	     pwd_crypt_unix
	     pwd_make
	     pwd_check
	     pwd_external_check
	     fatal
	     error
	     show_hash
	     check_ipmask
	     dhcpether
	     run_command
	     run_command_quiet
	     print_csv
	     parse_csv
	     join_strings
	     new_serial
	     decode_daterange_str
	     utimefmt
         is_iaid
         trim
	    );



# returns nonzero in case given domainname is valid
sub valid_domainname_check($$) {
  my($domain,$mode)= @_;
  my($dom);

  $dom="\L$domain";

  if ($dom =~ 
      /^(\d{1,3}\.)?(\d{1,3}\.)?(\d{1,3}\.)?\d{1,3}\.in-addr\.arpa\.?$/)  {
    return 1;
  }

  if ($mode == 1) {
    # test for valid zone name
    if ($dom =~ /([^a-z0-9\-\._])/) {
      #warn("invalid character '$1' in domainname: '$domain'");
      return 0;
    }

    unless ($dom =~ /^[a-z0-9_]/) {
      #warn("domainname starts with invalid character: '$domain'");
      return 0;
    }
  }
  elsif ($mode == 2) {
    # test for valid SRV record domain name
    if ($dom =~ /([^a-z0-9\-\.\*_])/) {
      warn("invalid character '$1' in domainname: '$domain'");
      return 0;
    }

    unless ($dom =~ /^[a-z_\*]/) {
      warn("domainname starts with invalid character: '$domain'");
      return 0;
    }
    return 1;
  }
  else {
    if ($main::SAURON_DNSNAME_CHECK_MODE == 1) {
      if ($dom =~ /([^a-z0-9\-\._])/) {
        #warn("invalid character '$1' in domainname: '$domain'");
        return 0;
      }

      unless ($dom =~ /^[a-z_]/) {
        #warn("domainname starts with invalid character: '$domain'");
        return 0;
      }
    } else {
      if ($dom =~ /([^a-z0-9\-\.])/) {
        #warn("invalid character '$1' in domainname: '$domain'");
        return 0;
      }

      unless ($dom =~ /^[a-z]/) {
        #warn("domainname starts with invalid character: '$domain'");
        return 0;
      }
    }
  }


  if ($main::SAURON_DNSNAME_CHECK_MODE == 1) {
    if ($dom =~ /([^a-z0-9_])\./) {
      #warn("invalid character '$1' before dot in domainname: '$domain'");
      return 0;
    }
  } else {
    if ($dom =~ /([^a-z0-9])\./) {
      #warn("invalid character '$1' before dot in domainname: '$domain'");
      return 0;
    }
  }

  return 1;
}

sub valid_domainname($) {
  my($domain) = @_;

  return valid_domainname_check($domain,0);
}

sub valid_texthandle($) {
  my($str) = @_;

  return ($str =~ /^[a-zA-Z0-9_\-]+$/ ? 1 : 0);
}


# check if parameter contains a valid CIDR...returns 0 if not.
sub is_cidr($) {
  my($cidr) = @_;
  
  return (new Net::IP($cidr) ? 1 : 0);
}

sub is_ip($) {
  my($ip) = @_;

  return 1 if (is_cidr($ip) && $ip !~ /\/\d{1,3}$/);
  return 0;
}

# decode CIDR into base/mask...
sub decode_cidr($$$) {
    my($cidr,$baseref,$maskref) = @_;

    my @base;

    return -1 unless (is_cidr($cidr));
    return -2 unless ( ( @base = ($cidr =~ /^\s*(\d{1,3})(\.(\d{1,3}))?(\.(\d{1,3}))?(\.(\d{1,3}))?(\/(\d{1,2}))?\s*$/)[0,2,4,6,8] ) );

    $$baseref = (($base[0] & 0xff) << 24) + (($base[1] & 0xff) << 16) +
 	        (($base[2] & 0xff) << 8) + ($base[3] & 0xff);
    $$maskref = unpack("N",
		       pack("B32", substr("1" x ($base[4]) . "0" x 32, 0,32))
		       );

    return 0;
}


# test whether a CIDR block falls within another CIDR block...
sub is_cidr_within_cidr($$) {
    my($a,$b) = @_;

    #return 1 unless $b;
    
    my $net_a = new Net::IP($a) or return -1;
    my $net_b = new Net::IP($b) or return -2;

    return 0 unless (hex($net_a->hexmask()) > hex($net_b->hexmask()));
    return ($net_a->overlaps($net_b) == $IP_A_IN_B_OVERLAP ? 1 : 0);
}



# convert in-addr.arpa format address into CIDR format address
sub arpa2cidr($) {
  my($arpa) = @_;
  my($i,$s,$cidr,@m);
  my($r_begin,$r_end,$range);

  # support for smaller than class-C delegations
  if ($arpa =~ /^(\d+)\-(\d+)(\..*)$/) {
      $r_begin=$1;
      $r_end=$2;
      $range=$r_end - $r_begin + 1;
      $arpa=$1 . $3;
      return '0.0.0.0/0' 
	  unless ($range==2 || $range==4 || $range==8 || $range==16 ||
		  $range==32 || $range==64 || $range==128);
      $range=int(log($range)/log(2));
  }

  if($arpa =~ /^(\d{1,3}\.)?(\d{1,3}\.)?(\d{1,3}\.)?(\d{1,3}\.)in-addr\.arpa/){
    @m = (0,$1,$2,$3,$4);

      $s=4;
      for($i=4;$i>0;$i--) {
        next if ($m[$i] eq '');
        $cidr.=$m[$i];
        $s--;
      }
      for($i=$s;$i>0;$i--) {
        $cidr.='0.';
      }
      $cidr =~ s/\.$//g;
      #print $s;
      if ($range) { 
        $s=32-$range; 
      } else { 
        $s=(32-($s*8)); 
      }

      return $cidr . "/" . $s;
  }
  elsif($arpa =~ /^(([a-fA-F0-9]\.){1,32})ip6\.(arpa|int)/){
    my @nums  = split /\./, $1;
    my $mask  = scalar @nums;
    my $mask_b = $mask * 4;
    my $index = 0;
    my $cidr  = "";

    foreach my $num (reverse @nums) {
        $cidr .= $num;

        if(++$index == 4) {
            $cidr .= ":";
            $index = 0;
        }

    }

    $cidr .= "::" if ($mask < 32 and $mask % 4 != 0);
    $cidr .= ":" if ($mask < 32 and $mask % 4 == 0);
    chop($cidr) if $mask == 32;

    return $cidr . "/" . $mask_b;
  }
  
  return '0.0.0.0/0';
}


# convert CIDR format address into in-addr.arpa format address
sub cidr2arpa($) {
  my($cidr) = @_;
  #my($i,@a,$e,$arpa);

  #@a=4; $e=0;
  #$arpa='';

  #if ($cidr =~ /^\s*(\d{1,3})(\.(\d{1,3}))?(\.(\d{1,3}))?(\.(\d{1,3}))?(\/(\d{1,2}))?\s*$/) {
  #  #print "1=$1 3=$3 5=$5 7=$7 9=$9\n";
  #  $a[0]=$1; $e=8;
  #  if (defined $3) { $a[1]=$3; $e=16; } else { $a[1]=0; }
  #  if (defined $5) { $a[2]=$5; $e=24; } else { $a[2]=0; }
  #  if (defined $7) { $a[3]=$7; $e=32; } else { $a[3]=0; }
  #  if ($9) { $e=$9; }
  #}
  #else {
  #  $a[0]=0; $a[1]=0; $a[2]=0; $a[3]=0; $e=0;
  #}

  #$e=0 if ($e < 0);
  #$e=32 if ($e > 32);
  #$e=$e >> 3;

  #for($i=$e-1;$i >= 0;$i--) {
  #  $arpa.="$a[$i].";
  #}
  #$arpa.='0.' if ($e == 0);
  #$arpa.="in-addr.arpa";
  return new Net::IP($cidr)->reverse_ip();
}


sub ip2int($) {
  my($ip)=@_;
  my($a,$b,$c,$d);

  return -1 unless ($ip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)(\/\d+)?/);
  $a=($1) & 0xFF;
  $b=($2) & 0xFF;
  $c=($3) & 0xFF;
  $d=($4) & 0xFF;
  return ($a<<24)+($b<<16)+($c<<8)+$d;
}

sub int2ip($) {
  my($i)=@_;
  my($a,$b,$c,$d);

  return '0.0.0.0' if ($i < 0);
  $a=($i>>24) & 0xFF;
  $b=($i>>16) & 0xFF;
  $c=($i>>8) & 0xFF;
  $d=($i) & 0xFF;
  return "$a.$b.$c.$d";
}

sub adjust_ip($$) {
  my($ip,$step)=@_;
  my($i);

  $i = ip2int($ip);
  return '' if ($i < 0);
  $i += $step;
  return int2ip($i);
}

sub normalize_ip6($) {
  my($ip6) = @_;
  my($a,$b,$i,$j,@tmp);

  $ip6 = lc($ip6);
  return '' unless (($a,$b) = ($ip6 =~ /^([a-f0-9:\.]+)(\/(\d{1,3}))?$/)[0,2]);

  # check prefix length
  return '' if ($b && not ($b >= 0 && $b <= 128));
  # check for unspecified address
  return '0000:0000:0000:0000:0000:0000:0000:0000' if ($a eq '::');

  my @list;
  my @l = split(/:/,$a,-1);
  my $l1 = 'x';
  my $l2 = 'x';
  my $count = 0;

  for $i (0..$#l) {
    if ($l[$i] eq '') {
      return '' if ($l1 eq '' && $l2 eq ''); # more than two ":"'s in a row...
      if ($l1 ne '') {
	$count++;
	push @list, '';
      }
    }
    elsif ($l[$i] =~ /^[0-9a-f]{1,4}$/) {
      push @list, substr("0000".$l[$i],-4);
    }
    elsif (@tmp = ($l[$i] =~ /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/)) {
      for $j (0..3) { return '' unless ($tmp[$j] >= 0 && $tmp[$j] <= 255); }
      push @list, sprintf("%02x%02x",$tmp[0],$tmp[1]),
	          sprintf("%02x%02x",$tmp[2],$tmp[3]);
    } else {
      return '';
    }

    $l2 = $l1;
    $l1 = $l[$i];
  }

  return '' if ($count > 1); # more than one occurence of "::" ...
  return '' if (@list > 8);

  # expand "::" if necessary...
  for $i (0..$#list) {
    if ($list[$i] eq '') {
      $list[$i]='0000';
      if (@list < 8) {
	for $j (1..(8 - @list)) { splice(@list,$i,0,'0000'); }
      }
      last;
    }
  }

  return join(":",@list)."".($b ? "/$b":"");
}

sub is_ip6_prefix($) {
  my($ip6) = @_;

  return 0 unless ($ip6 =~ /\/\d+$/);
  return 0 unless (normalize_ip6($ip6));
  return 1;
}

sub is_ip6($) {
  my($ip6) = @_;

  #return 0 if ($ip6 =~ /\/\d+$/);
  #return 0 unless (normalize_ip6($ip6));
  #return 1;
  return ip_is_ipv6($ip6);
}

# converts IPv6 with prefix into IP6.INT domain name
sub ip6_to_ip6int($) {
  my($ip6) = @_;
  my($a,$b,$i,$prefix,$len);

  return '' unless ($ip6 = normalize_ip6($ip6));
  ($a,$prefix) = $ip6 =~ /^(.*?)(\/\d+)?$/;
  $a =~ s/://g;
  $prefix =~ s/\///;
  $prefix = 128 unless ($prefix > 0);
  return '' if ($prefix % 4);
  $len = $prefix/4;

  for $i (1..$len) {
    $b .= "." if (defined($b));
    $b .= substr($a,$len-$i,1);
  }

  return $b.".ip6.int.";
}

sub net_ip_list($) {
  my ($cidr) = @_;
  my (@l,$i);

  if (is_cidr($cidr)) {
    my $net = new Net::Netmask($cidr);
    if ($net) {
      for $i (1..$net->size()-1) {
	push @l, $net->nth($i);
      }
    }
  }
  return @l;
}

# remove_origin($domain,$origin) - strip origin from domain
sub remove_origin($$) {
  my($domain,$origin) = @_;

  $domain="\L$domain" unless ($domain eq "\$DOMAIN");
  $origin="\L$origin";
  $origin =~ s/\./\\\./g;
  #print "before: $domain $origin\n";
  $domain =~ s/\.$origin$//g;
  #print "after: $domain\n";

  return $domain;
}


# add_origin($domain,$origin) - add origin into domain
sub add_origin($$) {
  my($domain,$origin) = @_;

  $domain="\L$domain" unless ($domain eq "\$DOMAIN");
  $origin="\L$origin";
  if ($domain eq '@') {  $domain=$origin; }
  elsif (! ($domain =~ /\.$/)) {
    $origin='' if ($origin eq '.');
    $domain.=".$origin";
  }
  return $domain;
}


# encrypts given pasword using salt... (MD5 based)
sub pwd_crypt_md5($$) {
  my($password,$salt) = @_;
  my($ctx);

  $ctx=new Digest::MD5;
  $ctx->add("$salt$password\n");
  return "MD5:" . $salt . ":" . $ctx->hexdigest;
}

sub pwd_crypt_unix($$) {
  my($password,$salt) = @_;

  return "CRYPT:" . crypt($password,$salt);
}


# encrypts given password
sub pwd_make_md5($) {
  my($password) = @_;
  my($salt);

  $salt=int(rand(9000000)+1000000);
  return pwd_crypt_md5($password,$salt);
}

# encrypts given password
sub pwd_make_unix($) {
  my($password) = @_;
  my($salt,$smap,$sl,$i);

  $smap = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789./';
  $sl = length($smap);

  $salt='';
  for $i (1..2) { $salt .= substr($smap,int(rand($sl)),1); }
  return pwd_crypt_unix($password,$salt);
}

# encrypt given password using configured method
sub pwd_make($$) {
  my($password,$mode) = @_;

  return pwd_make_unix($password) if ($mode == 1);
  return pwd_make_md5($password)
}


# check if passwords match (currently supports standard Unix crypt
# passwords and our own simple md5 based passwords)
sub pwd_check($$) {
  my($password,$pwd) = @_;
  my($salt);

  if ($pwd =~ /^CRYPT:(\S{2})(\S{11})$/) {
    $salt=$1;
    return -1 if (pwd_crypt_unix($password,$salt) ne $pwd);
    return 0;
  }

  $salt=$1;
  if ($pwd =~ /^MD5:(\S+):(\S+)$/) {
    $salt=$1;
    return -1 if (pwd_crypt_md5($password,$salt) ne $pwd);
    return 0;
  }

  return -2;
}

sub pwd_external_check($$$) {
  my($cmd,$user,$password) = @_;

  my($res);

  return 1 unless ($cmd && -x $cmd);
  return 2 unless ($user);
  return 3 unless (defined $password);

  open(OLDOUT,">&STDOUT");
  open(OLDERR,">&STDERR");
  open(STDOUT,"> /dev/null");
  open(STDERR,">&STDOUT");

  $res=-1;
  if (open(PIPE,"| $cmd")) {
    print PIPE "$user $password\n";
    close(PIPE);
    $res = $?;
  }

  close(STDOUT);
  close(STDERR);

  open(STDOUT,">&OLDOUT");
  open(STDERR,">&OLDERR");
  close(OLDOUT);
  close(OLDERR);

  return ($res >> 8);
}

# print error message and exit program
sub fatal($) {
  my($msg) = @_;
  my($prog) = $0;
  $prog=$1 if ($prog =~ /^.*\/(.*)$/);
  print STDERR "$prog: $msg\n";
  exit(1);
}

# print error message
sub error($) {
  my($msg) = @_;
  my($prog) = $0;
  $prog=$1 if ($prog =~ /^.*\/(.*)$/);
  print STDERR "$prog: $msg\n";
}

# show hash in HTML format
sub show_hash($) {
  my($rec) = @_;
  my($key);

  unless (ref($rec) eq 'HASH') {
    print "<P>Parameter is not a HASH!\n";
    return;
  }

  print "<TABLE border=\"3\"><TR><TH>key</TH><TH>value</TH></TR>";
  foreach $key (keys %{$rec}) {
    print "<TR><TD>$key</TD><TD>" . $$rec{$key} . "</TD></TR>";
  }
  print "</TABLE>";
}


# checks for valid IP-mask and also can test if given IP is within the mask

sub check_ipmask($$)
{
	my ($mask, $ip) = @_;	
	my ($s, $e);
	
	return 0 unless ($mask =~ /^(((([a-fA-F0-9]{1,4})(\-[a-fA-F0-9]{1,4})?|\*[a-fA-F0-9]{0,3}|[a-fA-F0-9]\*[a-fA-F0-9]{0,2}|[a-fA-F0-9]{0,2}\*[a-fA-F0-9]|[a-fA-F0-9]{0,3}\*)\:){1,7}(([a-fA-F0-9]{1,4})(\-[a-fA-F0-9]{1,4})?|\*[a-fA-F0-9]{0,3}|[a-fA-F0-9]\*[a-fA-F0-9]{0,2}|[a-fA-F0-9]{0,2}\*[a-fA-F0-9]|[a-fA-F0-9]{0,3})|((([a-fA-F0-9]{1,4})(\-[a-fA-F0-9]{1,4})?|\*[a-fA-F0-9]{0,3}|[a-fA-F0-9]\*[a-fA-F0-9]{0,2}|[a-fA-F0-9]{0,2}\*[a-fA-F0-9]|[a-fA-F0-9]{0,3}\*)\:){0,7}\*)$/ or $mask =~ /^((\*|(\d{1,3})(\-\d{1,3})?)\.){3}(\*|(\d{1,3})(\-\d{1,3})?)$/);

	return 1 if $ip eq '';

	my $net = new Net::IP($ip) or return 0;
	my $eip = $net->ip(); 
	
	if($net->version() == 4 and $mask =~ /\./) {
	    my @parts  = split /\./, $mask;
	    my @tIP = split /\./, $eip;

	    for(my $block = 0; $block < @parts; $block++) {
            my $p = $parts[$block];
			$s = $e = $p;

			if($p =~ /\*/) {
				$s =~ s/\*/0/;
				$e =~ s/\*/255/;
			}
			elsif($p =~ /\-/) {
				($s, $e) = split "\-", $p;
			}

            return 0 unless (($tIP[$block] >= $s) and ($tIP[$block] <= $e));
		}
	    
	    return 1;
	}
	elsif($net->version() == 6 and $mask =~ /\:/)	{
	    my @parts  = split /\:/, $mask;
	    my @tIP = split /\:/, $eip;

	    for(my $block = 0; $block < @parts; $block++) {
			my $p = $parts[$block];
			$s = $e = $p;

			if($p =~ /\*/) {
				my $len  = length($p);
				$s =~ s/\*/0/ if $len == 4;
				$s =~ s/\*/00/ if $len == 3;
				$s =~ s/\*/000/ if $len == 2;
				$s =~ s/\*/0000/ if $len == 1;
				
				$e =~ s/\*/f/ if $len == 4;
				$e =~ s/\*/ff/ if $len == 3;
				$e =~ s/\*/fff/ if $len == 2;
				$e =~ s/\*/ffff/ if $len == 1;

				return 1 if ($block + 1  == @parts and @parts < 8);
				
			}
			elsif($p =~ /\-/) {
				($s, $e) = split "\-", $p;
			}

			return 0 unless(hex($tIP[$block]) >= hex($s) and hex($tIP[$block]) <= hex($e));
		}
	    
	    return 1;
	}
	else {
		return 0;
	}
}


# convert ethernet address to format suitable for dhcpd.conf
sub dhcpether($) {
  my ($e) = @_;

  $e="\L$e";
  if ($e =~ /(..)(..)(..)(..)(..)(..)/) {
    return "$1:$2:$3:$4:$5:$6";
  }

  return "00:00:00:00:00:00";
}


# custom "system" command with timeout option
sub run_command_internal($$$$)
{
  my ($cmd,$args,$timeout,$quiet) = @_;
  my ($err,$pid);
  my $stat = 0;

  return -1 unless ($cmd && -x $cmd);
  return -2 unless ($timeout > 0);

  if ($quiet) {
    open(OLDOUT,">&STDOUT");
    open(OLDERR,">&STDERR");
    open(STDOUT,"> /dev/null");
    open(STDERR,">&STDOUT");
  }

  if ($pid = fork()) {
    # parent...
    local $SIG{ALRM} = sub { $stat=1; kill(15,$pid); };
    alarm($timeout);
    waitpid($pid,0);
    $err = $?;
    alarm(0);
  } else {
    # child...
    exec($cmd,@{$args});
  }

  if ($quiet) {
    close(STDOUT);
    close(STDERR);
    open(STDOUT,">&OLDOUT");
    open(STDERR,">&OLDERR");
    close(OLDOUT);
    close(OLDERR);
  }

  $err = 14 if ($stat);
  return $err;
}

sub run_command($$$)
{
  my ($cmd,$args,$timeout) = @_;
  return run_command_internal($cmd,$args,$timeout,0);
}

sub run_command_quiet($$$)
{
  my ($cmd,$args,$timeout) = @_;
  return run_command_internal($cmd,$args,$timeout,1);
}


sub print_csv($$)
{
  my($lst,$mode) = @_;
  my($i,$val,$line,$quote);

  for $i (0..$#{$lst}) {
    $val = $$lst[$i];
    $quote = 0;

    if ($mode==1) {
      $quote=1;
    } else {
      $quote = 1 unless ($val =~ /^[\+\-]{0,1}\d+(\.\d*)?$/);
    }

    if ($quote) {
      $val =~ s/\"/""/g;
      $val = "\"$val\"";
    }
    $line .= "," if ($line);
    $line .= $val;
  }

  return $line;
}


sub parse_csv($) {  # code based on the Perl cookbook example...
    my($str) = @_;
    my @new = ();

    push (@new,$+) while $str =~ m{
        "([^\"\\]*(?:\\.[^\"\\]*)*)",?
#       | ([^,]+(\\,[^,\\]*)*?),?
        | ([^,]+),?
        | ,
    }gx;
    push(@new,undef) if (substr($str,-1,1) eq ',');
    return @new;
}


sub join_strings {
  my($sep,@list) = @_;
  my($i,$s);

  $s = '';

  for $i (0..$#list) {
    next unless ($list[$i]);
    $s.=$sep if ($s);
    $s.=$list[$i];
  }

  return $s;
}


sub new_serial($) {
  my ($serial) = @_;
  my ($sec,$min,$hour,$day,$mon,$year,$s);

  if (! $serial) {
    error("no serial number passed to new_serial() !");
    return "0";
  }

  ($sec,$min,$hour,$day,$mon,$year) = localtime(time);

  $s=sprintf("%04d%02d%02d%02d",1900+$year,1+$mon,$day,$hour);
  $s=$serial + 1 if ($s <= $serial);

  fatal("new_serial($serial) failed! return value='$s'") if ($s <= $serial);

  return $s;
}

sub decode_daterange_str($) {
  my($str) = @_;

  my $start = -1;
  my $end = -1;

  if ($str =~ /^\s*((\d\d\d\d)(\d\d)(\d\d))?-((\d\d\d\d)(\d\d)(\d\d))?\s*$/) {
    my $y1=$2;
    my $m1=$3;
    my $d1=$4;
    my $y2=$6;
    my $m2=$7;
    my $d2=$8;

    $start=timelocal_nocheck(0,0,0,$d1,$m1-1,$y1)
      if ($y1 > 1900 && $m1 >= 1 && $m1 <= 12 && $d1 >= 1 && $d1 <= 31);
    $end=timelocal_nocheck(0,0,0,$d2,$m2-1,$y2)
      if ($y2 > 1900 && $m2 >= 1 && $m2 <= 12 && $d2 >= 1 && $d2 <= 31);
  }

  return [$start,$end];
}

# convert time_t type epoch timestamp to more readable ...
sub utimefmt($$) {
    my ($utime,$fmt) = @_; 
    my %utime_df=('epoch' => sub { shift @_ },
		  'us-std'=> sub { scalar localtime(shift @_) },
		  'excel' => sub { 
		      strftime("%m/%d/%Y %H:%M",localtime(shift @_))
		      },
		  'iso8601:2004' => sub { 
		      strftime("%FT%T%z",localtime(shift @_))
		      },
		  'rfc822date'=> sub { 
		      strftime("%a, %d %b %Y %H:%M:%S %z",localtime(shift @_))
		      }
		  );

    return (defined($utime_df{$fmt}) ? $utime_df{$fmt}($utime) : $utime);
}

sub is_iaid($) {
    my ($iaid) = @_;
    $iaid =~ s/[^0-9A-F]//g;

    if($iaid !~ /^\d+$/) {
        $iaid = hex($iaid) if ($iaid !~ /^\d+$/ and $iaid ne "");
    }

    return ((($iaid > 0) and ($iaid < (2**32))) ? $iaid : 0); 
}

sub trim($) {

    my ($s) = @_;
    $s =~ s/^\s+//g;
    $s =~ s/\s+$//g;

    return $s;
}


1;
# eof
