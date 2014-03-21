# Sauron::UtilDhcp.pm - ISC DHCPD config file reading/parsing routines
#
# Copyright (c) Timo Kokkonen <tjko@iki.fi> 2002.
# $Id: UtilDhcp.pm,v 1.5 2003/03/05 08:14:22 tjko Exp $
#
package Sauron::UtilDhcp;
require Exporter;
use IO::File;
use Sauron::Util;
use Data::Dumper;
use strict;
use vars qw($VERSION @ISA @EXPORT);

$VERSION = '$Id: UtilDhcp.pm,v 1.5 2003/03/05 08:14:22 tjko Exp $ ';

@ISA = qw(Exporter); # Inherit from Exporter
@EXPORT = qw(process_dhcpdconf);


my $debug = 0;

# parse dhcpd.conf file, build hash of all entries in the file
#
sub process_dhcpdconf($$) {
  my ($filename,$data)=@_;

  my $fh = IO::File->new();
  my ($i,$c,$tmp,$quote,$lend,$fline,$prev,%state);

  print "process_dhcpdconf($filename,DATA)\n" if ($debug);

  fatal("cannot read conf file: $filename") unless (-r $filename);
  open($fh,$filename) || fatal("cannot open conf file: $filename");
  $$data{'shared-network'}->{'"#nonshared"'}=[];

  $tmp='';
  while (<$fh>) {
    chomp;
    next if (/^\s*$/);
    next if (/^\s*#/);

    $quote=0;
#    print "line '$_'\n";
    s/\s+/\ /g; s/\s+$//; # s/^\s+//;

    for $i (0..length($_)-1) {
      $prev=($i > 0 ? substr($_,$i-1,1) : ' ');
      $c=substr($_,$i,1);
      $quote=($quote ? 0 : 1)	if (($c eq '"') && ($prev ne '\\'));
      unless ($quote) {
	last if ($c eq '#');
	$lend = ($c =~ /^[;{}]$/ ? 1 : 0);
      }
      $tmp .= $c;
      if ($lend) {
	process_line($tmp,$data,\%state);
	$tmp='';
      }
    }

    fatal("$filename($.): unterminated quoted string!\n") if ($quote);
  }
  process_line($tmp,$data,\%state);

  close($fh);

  return 0;
}

sub process_line($$$) {
  my($line,$data,$state) = @_;

  my($tmp,$block,$rest,$ref);

  return if ($line =~ /^\s*$/);
  $line =~ s/(^\s+|\s+$)//g;


  if ($line =~ /^(\S+)\s+(\S.*)?{$/) {
    $block=lc($1);
    #print "BLOCK: $block\n";
    ($rest=$2) =~ s/^\s+|\s+$//g;
    #print "REST: $rest\n";
    if ($block =~ /^group/) {
      # generate name for groups
      $$state{groupcounter}++;
      $rest="group-" . $$state{groupcounter};
    }
    elsif ($block =~ /^pool/) {
      $tmp=$$state{'shared-network'}->[0];
      if ($tmp) {
	unshift @{$$data{POOLS}->{$tmp}}, [];
      } else {
	unshift @{$$data{POOLS}->{'#nonshared'}}, [] unless $$data{POOLS}->{'#nonshared'};
#warn("pools not under shared-network aren't currently supported");
      }
    }
    print "begin '$block:$rest'\n";
    unshift @{$$state{BLOCKS}}, $block;
    #print "BLOCKS: " . Dumper($$state{BLOCKS});
    unshift @{$$state{$block}}, $rest;
    #print "BLOCK-RESTS: " . Dumper($$state{$block});
    $$data{$block}->{$rest}=[] if ($rest);
    $$state{rest}=$2;

    if ($block =~ /^host/) {
      push @{$$data{$block}->{$rest}}, "GROUP $$state{group}->[0]" if ($$state{group}->[0]);
    }
    if ($block =~ /^subnet/) {
      if ($$state{'shared-network'}->[0]) {
         push @{$$data{$block}->{$rest}}, "VLAN $$state{'shared-network'}->[0]";
      }
      else {
         push @{$$data{$block}->{$rest}}, "VLAN #nonshared";
      }
      $$state{lastsubnet} = $rest;
    }
    if ($block =~ /^pool/) {
      if($$state{lastsubnet}) {
        if($$state{'shared-network'}->[0]) {
            push @{$$data{POOLS}->{$$state{'shared-network'}->[0]}->[0]}, "SUBNET $$state{lastsubnet}";
        }
        else {
            push @{$$data{POOLS}->{'#nonshared'}->[0]}, "SUBNET $$state{lastsubnet}"; 
        } 
      }
      else {
           warn("Pool isn't in subnet section!\n");
      }
    }

    return 0;
  }

  $block=$$state{BLOCKS}->[0];
  $rest=$$state{$block}->[0];

  if ($line =~ /^\s*}\s*$/) {
    print "end '$block:$rest'\n";
    unless (@{$$state{BLOCKS}} > 0) {
      warn("mismatched parenthesis");
      return -1;
    }
    shift @{$$state{BLOCKS}};
    shift @{$$state{$block}};
    return 0;
  }

  $block='GLOBAL' unless ($block);
  print "line($block:$rest) '$line'\n";

  if ($block eq 'GLOBAL') {
    if($line =~ /subclass\s+\"(.*)\"\s+(.*)/) {
        push @{$$data{'subclass'}->{$1}}, $2; 
    }
    else {
        push @{$$data{GLOBAL}}, $line;
    }
  }
  elsif ($block =~ /^(subnet|shared-network|group|class)$/) {
    push @{$$data{$block}->{$rest}}, $line;
  }
  elsif ($block =~ /^pool/) {
    $tmp=$$state{'shared-network'}->[0];
    if($tmp) {
        push @{$$data{POOLS}->{$tmp}->[0]}, $line;
    }
    else {
        push @{$$data{POOLS}->{'#nonshared'}->[0]}, $line;
    }
  }
  elsif ($block =~ /^host/) {
    push @{$$data{$block}->{$rest}}, $line;
  }


  return 0;
}

1;
# eof
