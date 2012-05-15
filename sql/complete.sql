--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

DROP INDEX public.wks_entries_ref_index;
DROP INDEX public.user_rights_ref_index;
DROP INDEX public.txt_entries_ref_index;
DROP INDEX public.srv_entries_ref_index;
DROP INDEX public.ns_entries_ref_index;
DROP INDEX public.mx_entries_ref_index;
DROP INDEX public.leases_mac_index;
DROP INDEX public.leases_ip_index;
DROP INDEX public.leases_host_index;
DROP INDEX public.history_uid_index;
DROP INDEX public.history_sid_index;
DROP INDEX public.group_entries_host_index;
DROP INDEX public.dhcp_entries_ref_index;
DROP INDEX public.dhcp_entries6_ref_index;
DROP INDEX public.cidr_entries_ref_index;
DROP INDEX public.cidr_entries_ip_index;
DROP INDEX public.arec_entries_host_index;
DROP INDEX public.a_entries_ip_index;
DROP INDEX public.a_entries_host_index;
ALTER TABLE ONLY public.zones DROP CONSTRAINT zones_pkey;
ALTER TABLE ONLY public.zones DROP CONSTRAINT zones_key;
ALTER TABLE ONLY public.wks_templates DROP CONSTRAINT wks_templates_pkey;
ALTER TABLE ONLY public.wks_entries DROP CONSTRAINT wks_entries_pkey;
ALTER TABLE ONLY public.vmps DROP CONSTRAINT vmps_pkey;
ALTER TABLE ONLY public.vmps DROP CONSTRAINT vmps_key;
ALTER TABLE ONLY public.vlans DROP CONSTRAINT vlans_pkey;
ALTER TABLE ONLY public.vlans DROP CONSTRAINT vlans_key;
ALTER TABLE ONLY public.utmp DROP CONSTRAINT utmp_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT username_key;
ALTER TABLE ONLY public.user_rights DROP CONSTRAINT user_rights_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_pkey;
ALTER TABLE ONLY public.user_groups DROP CONSTRAINT user_groups_name_key;
ALTER TABLE ONLY public.txt_entries DROP CONSTRAINT txt_entries_pkey;
ALTER TABLE ONLY public.srv_entries DROP CONSTRAINT srv_entries_pkey;
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_pkey;
ALTER TABLE ONLY public.servers DROP CONSTRAINT servers_name_key;
ALTER TABLE ONLY public.root_servers DROP CONSTRAINT root_servers_pkey;
ALTER TABLE ONLY public.printer_entries DROP CONSTRAINT printer_entries_pkey;
ALTER TABLE ONLY public.printer_classes DROP CONSTRAINT printer_classes_pkey;
ALTER TABLE ONLY public.printer_classes DROP CONSTRAINT printer_classes_name_key;
ALTER TABLE ONLY public.ns_entries DROP CONSTRAINT ns_entries_pkey;
ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
ALTER TABLE ONLY public.nets DROP CONSTRAINT nets_pkey;
ALTER TABLE ONLY public.nets DROP CONSTRAINT nets_key;
ALTER TABLE ONLY public.mx_templates DROP CONSTRAINT mx_templates_pkey;
ALTER TABLE ONLY public.mx_entries DROP CONSTRAINT mx_entries_pkey;
ALTER TABLE ONLY public.leases DROP CONSTRAINT leases_pkey;
ALTER TABLE ONLY public.lastlog DROP CONSTRAINT lastlog_pkey;
ALTER TABLE ONLY public.keys DROP CONSTRAINT keys_pkey;
ALTER TABLE ONLY public.keys DROP CONSTRAINT keyname_key;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT hosts_pkey;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT hostname_key;
ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
ALTER TABLE ONLY public.hinfo_templates DROP CONSTRAINT hinfo_templates_pkey;
ALTER TABLE ONLY public.hinfo_templates DROP CONSTRAINT hinfo_templates_hinfo_key;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_key;
ALTER TABLE ONLY public.group_entries DROP CONSTRAINT group_entries_pkey;
ALTER TABLE ONLY public.settings DROP CONSTRAINT global_key;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT ether_key;
ALTER TABLE ONLY public.ether_info DROP CONSTRAINT ether_info_pkey;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT duid_key;
ALTER TABLE ONLY public.dhcp_entries DROP CONSTRAINT dhcp_entries_pkey;
ALTER TABLE ONLY public.dhcp_entries6 DROP CONSTRAINT dhcp_entries6_pkey;
ALTER TABLE ONLY public.cidr_entries DROP CONSTRAINT cidr_entries_pkey;
ALTER TABLE ONLY public.hosts DROP CONSTRAINT asset_key;
ALTER TABLE ONLY public.arec_entries DROP CONSTRAINT arec_entries_pkey;
ALTER TABLE ONLY public.acls DROP CONSTRAINT acls_pkey;
ALTER TABLE ONLY public.acls DROP CONSTRAINT acls_key;
ALTER TABLE ONLY public.a_entries DROP CONSTRAINT a_entries_pkey;
ALTER TABLE public.zones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.zones ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.zones ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.wks_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wks_templates ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.wks_templates ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.wks_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vmps ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vmps ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.vmps ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.vlans ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.vlans ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.vlans ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.user_rights ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.txt_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.srv_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.servers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.servers ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.servers ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.root_servers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.printer_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.printer_classes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.printer_classes ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.printer_classes ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.ns_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.news ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.news ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.nets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.nets ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.nets ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.mx_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.mx_templates ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.mx_templates ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.mx_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.leases ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.lastlog ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.keys ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.keys ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.hosts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.hosts ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.hosts ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.hinfo_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.hinfo_templates ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.hinfo_templates ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.groups ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.groups ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.group_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dhcp_entries6 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dhcp_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.cidr_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.arec_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.acls ALTER COLUMN muser DROP DEFAULT;
ALTER TABLE public.acls ALTER COLUMN cuser DROP DEFAULT;
ALTER TABLE public.a_entries ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.zones_id_seq;
DROP TABLE public.zones;
DROP SEQUENCE public.wks_templates_id_seq;
DROP TABLE public.wks_templates;
DROP SEQUENCE public.wks_entries_id_seq;
DROP TABLE public.wks_entries;
DROP SEQUENCE public.vmps_id_seq;
DROP TABLE public.vmps;
DROP SEQUENCE public.vlans_id_seq;
DROP TABLE public.vlans;
DROP TABLE public.utmp;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.user_rights_id_seq;
DROP TABLE public.user_rights;
DROP SEQUENCE public.user_groups_id_seq;
DROP TABLE public.user_groups;
DROP SEQUENCE public.txt_entries_id_seq;
DROP TABLE public.txt_entries;
DROP SEQUENCE public.srv_entries_id_seq;
DROP TABLE public.srv_entries;
DROP SEQUENCE public.sid_seq;
DROP TABLE public.settings;
DROP SEQUENCE public.servers_id_seq;
DROP TABLE public.servers;
DROP SEQUENCE public.root_servers_id_seq;
DROP TABLE public.root_servers;
DROP SEQUENCE public.printer_entries_id_seq;
DROP TABLE public.printer_entries;
DROP SEQUENCE public.printer_classes_id_seq;
DROP TABLE public.printer_classes;
DROP SEQUENCE public.ns_entries_id_seq;
DROP TABLE public.ns_entries;
DROP SEQUENCE public.news_id_seq;
DROP TABLE public.news;
DROP SEQUENCE public.nets_id_seq;
DROP TABLE public.nets;
DROP SEQUENCE public.mx_templates_id_seq;
DROP TABLE public.mx_templates;
DROP SEQUENCE public.mx_entries_id_seq;
DROP TABLE public.mx_entries;
DROP SEQUENCE public.leases_id_seq;
DROP TABLE public.leases;
DROP SEQUENCE public.lastlog_id_seq;
DROP TABLE public.lastlog;
DROP SEQUENCE public.keys_id_seq;
DROP TABLE public.keys;
DROP SEQUENCE public.hosts_id_seq;
DROP TABLE public.hosts;
DROP SEQUENCE public.history_id_seq;
DROP TABLE public.history;
DROP SEQUENCE public.hinfo_templates_id_seq;
DROP TABLE public.hinfo_templates;
DROP SEQUENCE public.groups_id_seq;
DROP TABLE public.groups;
DROP SEQUENCE public.group_entries_id_seq;
DROP TABLE public.group_entries;
DROP TABLE public.ether_info;
DROP SEQUENCE public.dhcp_entries_id_seq;
DROP SEQUENCE public.dhcp_entries6_id_seq;
DROP TABLE public.dhcp_entries6;
DROP TABLE public.dhcp_entries;
DROP TABLE public.deleted_hosts;
DROP SEQUENCE public.cidr_entries_id_seq;
DROP TABLE public.cidr_entries;
DROP SEQUENCE public.arec_entries_id_seq;
DROP TABLE public.arec_entries;
DROP SEQUENCE public.acls_id_seq;
DROP TABLE public.acls;
DROP TABLE public.common_fields;
DROP SEQUENCE public.a_entries_id_seq;
DROP TABLE public.a_entries;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: a_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE a_entries (
    id integer NOT NULL,
    host integer NOT NULL,
    ip inet,
    ipv6 text,
    type integer DEFAULT 0,
    reverse boolean DEFAULT true,
    forward boolean DEFAULT true,
    comment character(20)
);


ALTER TABLE public.a_entries OWNER TO sauron;

--
-- Name: a_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE a_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.a_entries_id_seq OWNER TO sauron;

--
-- Name: a_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE a_entries_id_seq OWNED BY a_entries.id;


--
-- Name: common_fields; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE common_fields (
    cdate integer,
    cuser character(8) DEFAULT 'unknown'::bpchar,
    mdate integer,
    muser character(8) DEFAULT 'unknown'::bpchar,
    expiration integer
);


ALTER TABLE public.common_fields OWNER TO sauron;

--
-- Name: acls; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE acls (
    id integer NOT NULL,
    server integer NOT NULL,
    name text NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    comment text,
    CONSTRAINT acls_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.acls OWNER TO sauron;

--
-- Name: acls_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE acls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acls_id_seq OWNER TO sauron;

--
-- Name: acls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE acls_id_seq OWNED BY acls.id;


--
-- Name: arec_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE arec_entries (
    id integer NOT NULL,
    host integer NOT NULL,
    arec integer NOT NULL
);


ALTER TABLE public.arec_entries OWNER TO sauron;

--
-- Name: arec_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE arec_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.arec_entries_id_seq OWNER TO sauron;

--
-- Name: arec_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE arec_entries_id_seq OWNED BY arec_entries.id;


--
-- Name: cidr_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE cidr_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    mode integer DEFAULT 0,
    ip cidr,
    acl integer DEFAULT (-1),
    tkey integer DEFAULT (-1),
    op integer DEFAULT 0,
    port integer,
    comment text
);


ALTER TABLE public.cidr_entries OWNER TO sauron;

--
-- Name: cidr_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE cidr_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cidr_entries_id_seq OWNER TO sauron;

--
-- Name: cidr_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE cidr_entries_id_seq OWNED BY cidr_entries.id;


--
-- Name: deleted_hosts; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE deleted_hosts (
    cdate integer,
    cuser character(8),
    mdate integer,
    muser character(8),
    expiration integer,
    id integer,
    zone integer,
    type integer,
    domain text,
    ttl integer,
    class character(2),
    grp integer,
    alias integer,
    cname_txt text,
    hinfo_hw text,
    hinfo_sw text,
    loc text,
    wks integer,
    mx integer,
    rp_mbox text,
    rp_txt text,
    router integer,
    prn boolean,
    flags integer,
    ether character(12),
    ether_alias integer,
    dhcp_date integer,
    dhcp_last integer,
    dhcp_info text,
    info text,
    location text,
    dept text,
    huser text,
    email text,
    model text,
    serial text,
    misc text,
    asset_id text,
    vmps integer,
    comment text,
    duid character varying(40)
);


ALTER TABLE public.deleted_hosts OWNER TO sauron;

--
-- Name: dhcp_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE dhcp_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    dhcp text,
    comment text
);


ALTER TABLE public.dhcp_entries OWNER TO sauron;

SET default_with_oids = false;

--
-- Name: dhcp_entries6; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE dhcp_entries6 (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    dhcp text,
    comment text
);


ALTER TABLE public.dhcp_entries6 OWNER TO sauron;

--
-- Name: dhcp_entries6_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE dhcp_entries6_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dhcp_entries6_id_seq OWNER TO sauron;

--
-- Name: dhcp_entries6_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE dhcp_entries6_id_seq OWNED BY dhcp_entries6.id;


--
-- Name: dhcp_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE dhcp_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dhcp_entries_id_seq OWNER TO sauron;

--
-- Name: dhcp_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE dhcp_entries_id_seq OWNED BY dhcp_entries.id;


SET default_with_oids = true;

--
-- Name: ether_info; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE ether_info (
    ea character(6) NOT NULL,
    info text
);


ALTER TABLE public.ether_info OWNER TO sauron;

--
-- Name: group_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE group_entries (
    id integer NOT NULL,
    host integer NOT NULL,
    grp integer NOT NULL
);


ALTER TABLE public.group_entries OWNER TO sauron;

--
-- Name: group_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE group_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.group_entries_id_seq OWNER TO sauron;

--
-- Name: group_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE group_entries_id_seq OWNED BY group_entries.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    server integer NOT NULL,
    name text NOT NULL,
    type integer NOT NULL,
    alevel integer DEFAULT 0,
    vmps integer DEFAULT (-1),
    comment text,
    CONSTRAINT groups_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.groups OWNER TO sauron;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO sauron;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: hinfo_templates; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE hinfo_templates (
    id integer NOT NULL,
    hinfo text NOT NULL,
    type integer DEFAULT 0,
    pri integer DEFAULT 100,
    CONSTRAINT hinfo_templates_hinfo_check CHECK ((hinfo <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.hinfo_templates OWNER TO sauron;

--
-- Name: hinfo_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE hinfo_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hinfo_templates_id_seq OWNER TO sauron;

--
-- Name: hinfo_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE hinfo_templates_id_seq OWNED BY hinfo_templates.id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE history (
    id integer NOT NULL,
    sid integer NOT NULL,
    uid integer NOT NULL,
    date integer NOT NULL,
    type integer NOT NULL,
    ref integer,
    action character(25),
    info character(80)
);


ALTER TABLE public.history OWNER TO sauron;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO sauron;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- Name: hosts; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE hosts (
    id integer NOT NULL,
    zone integer NOT NULL,
    type integer DEFAULT 0,
    domain text NOT NULL,
    ttl integer,
    class character(2) DEFAULT 'IN'::bpchar,
    grp integer DEFAULT (-1),
    alias integer DEFAULT (-1),
    cname_txt text,
    hinfo_hw text,
    hinfo_sw text,
    loc text,
    wks integer DEFAULT (-1),
    mx integer DEFAULT (-1),
    rp_mbox text DEFAULT '.'::text,
    rp_txt text DEFAULT '.'::text,
    router integer DEFAULT 0,
    prn boolean DEFAULT false,
    flags integer DEFAULT 0,
    ether character(12),
    ether_alias integer DEFAULT (-1),
    dhcp_date integer,
    dhcp_last integer,
    dhcp_info text,
    info text,
    location text,
    dept text,
    huser text,
    email text,
    model text,
    serial text,
    misc text,
    asset_id text,
    vmps integer DEFAULT (-1),
    comment text,
    duid character varying(40),
    CONSTRAINT hosts_domain_check CHECK ((domain <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.hosts OWNER TO sauron;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE hosts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO sauron;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE hosts_id_seq OWNED BY hosts.id;


--
-- Name: keys; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE keys (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    name text NOT NULL,
    keytype integer DEFAULT 0,
    nametype integer DEFAULT 0,
    protocol integer NOT NULL,
    algorithm integer NOT NULL,
    mode integer DEFAULT 0,
    keysize integer DEFAULT (-1),
    strength integer DEFAULT 0,
    publickey text,
    secretkey text,
    comment text
)
INHERITS (common_fields);


ALTER TABLE public.keys OWNER TO sauron;

--
-- Name: keys_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.keys_id_seq OWNER TO sauron;

--
-- Name: keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE keys_id_seq OWNED BY keys.id;


--
-- Name: lastlog; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE lastlog (
    id integer NOT NULL,
    sid integer NOT NULL,
    uid integer NOT NULL,
    date integer NOT NULL,
    state integer NOT NULL,
    ldate integer DEFAULT (-1),
    ip inet,
    host text
);


ALTER TABLE public.lastlog OWNER TO sauron;

--
-- Name: lastlog_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE lastlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lastlog_id_seq OWNER TO sauron;

--
-- Name: lastlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE lastlog_id_seq OWNED BY lastlog.id;


--
-- Name: leases; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE leases (
    id integer NOT NULL,
    server integer NOT NULL,
    host integer NOT NULL,
    ip inet,
    ipv6 text,
    lstart integer,
    lend integer,
    mac character(12),
    state integer DEFAULT 0,
    uid text,
    hostname text,
    info text,
    duid character varying(40)
);


ALTER TABLE public.leases OWNER TO sauron;

--
-- Name: leases_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE leases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.leases_id_seq OWNER TO sauron;

--
-- Name: leases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE leases_id_seq OWNED BY leases.id;


--
-- Name: mx_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE mx_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    pri integer NOT NULL,
    mx text,
    comment text,
    CONSTRAINT mx_entries_pri_check CHECK ((pri >= 0))
);


ALTER TABLE public.mx_entries OWNER TO sauron;

--
-- Name: mx_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE mx_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mx_entries_id_seq OWNER TO sauron;

--
-- Name: mx_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE mx_entries_id_seq OWNED BY mx_entries.id;


--
-- Name: mx_templates; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE mx_templates (
    id integer NOT NULL,
    zone integer NOT NULL,
    alevel integer DEFAULT 0,
    name text,
    comment text
)
INHERITS (common_fields);


ALTER TABLE public.mx_templates OWNER TO sauron;

--
-- Name: mx_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE mx_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mx_templates_id_seq OWNER TO sauron;

--
-- Name: mx_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE mx_templates_id_seq OWNED BY mx_templates.id;


--
-- Name: nets; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE nets (
    id integer NOT NULL,
    server integer NOT NULL,
    netname text,
    name text,
    net cidr NOT NULL,
    subnet boolean DEFAULT true,
    dummy boolean DEFAULT false,
    vlan integer DEFAULT (-1),
    alevel integer DEFAULT 0,
    type integer DEFAULT 0,
    ipv6 text,
    rp_mbox text DEFAULT '.'::text,
    rp_txt text DEFAULT '.'::text,
    no_dhcp boolean DEFAULT false,
    range_start inet,
    range_end inet,
    comment text
)
INHERITS (common_fields);


ALTER TABLE public.nets OWNER TO sauron;

--
-- Name: nets_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE nets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nets_id_seq OWNER TO sauron;

--
-- Name: nets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE nets_id_seq OWNED BY nets.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    server integer DEFAULT (-1),
    info text NOT NULL
)
INHERITS (common_fields);


ALTER TABLE public.news OWNER TO sauron;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO sauron;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: ns_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE ns_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    ns text,
    comment text
);


ALTER TABLE public.ns_entries OWNER TO sauron;

--
-- Name: ns_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE ns_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ns_entries_id_seq OWNER TO sauron;

--
-- Name: ns_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE ns_entries_id_seq OWNED BY ns_entries.id;


--
-- Name: printer_classes; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE printer_classes (
    id integer NOT NULL,
    name text NOT NULL,
    comment text,
    CONSTRAINT printer_classes_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.printer_classes OWNER TO sauron;

--
-- Name: printer_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE printer_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.printer_classes_id_seq OWNER TO sauron;

--
-- Name: printer_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE printer_classes_id_seq OWNED BY printer_classes.id;


--
-- Name: printer_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE printer_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    printer text,
    comment text
);


ALTER TABLE public.printer_entries OWNER TO sauron;

--
-- Name: printer_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE printer_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.printer_entries_id_seq OWNER TO sauron;

--
-- Name: printer_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE printer_entries_id_seq OWNED BY printer_entries.id;


--
-- Name: root_servers; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE root_servers (
    id integer NOT NULL,
    server integer NOT NULL,
    ttl integer DEFAULT 3600000,
    domain text NOT NULL,
    type text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.root_servers OWNER TO sauron;

--
-- Name: root_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE root_servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.root_servers_id_seq OWNER TO sauron;

--
-- Name: root_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE root_servers_id_seq OWNED BY root_servers.id;


--
-- Name: servers; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE servers (
    id integer NOT NULL,
    name text NOT NULL,
    lastrun integer DEFAULT (-1),
    zones_only boolean DEFAULT false,
    no_roots boolean DEFAULT false,
    dhcp_mode integer DEFAULT 1,
    dhcp_flags integer DEFAULT 0,
    named_flags integer DEFAULT 0,
    masterserver integer DEFAULT (-1),
    version text,
    directory text,
    pid_file text,
    dump_file text,
    named_xfer text,
    stats_file text,
    memstats_file text,
    named_ca text DEFAULT 'named.ca'::text,
    pzone_path text DEFAULT ''::text,
    szone_path text DEFAULT 'NS2/'::text,
    query_src_ip text,
    query_src_port text,
    listen_on_port text,
    transfer_source inet,
    forward character(1) DEFAULT 'D'::bpchar,
    checknames_m character(1) DEFAULT 'D'::bpchar,
    checknames_s character(1) DEFAULT 'D'::bpchar,
    checknames_r character(1) DEFAULT 'D'::bpchar,
    nnotify character(1) DEFAULT 'D'::bpchar,
    recursion character(1) DEFAULT 'D'::bpchar,
    authnxdomain character(1) DEFAULT 'D'::bpchar,
    dialup character(1) DEFAULT 'D'::bpchar,
    multiple_cnames character(1) DEFAULT 'D'::bpchar,
    rfc2308_type1 character(1) DEFAULT 'D'::bpchar,
    ttl integer DEFAULT 86400,
    refresh integer DEFAULT 43200,
    retry integer DEFAULT 3600,
    expire integer DEFAULT 2419200,
    minimum integer DEFAULT 86400,
    ipv6 text,
    df_port integer DEFAULT 519,
    df_max_delay integer DEFAULT 60,
    df_max_uupdates integer DEFAULT 10,
    df_mclt integer DEFAULT 3600,
    df_split integer DEFAULT 128,
    df_loadbalmax integer DEFAULT 3,
    hostname text,
    hostaddr inet,
    hostmaster text,
    comment text,
    df_port6 integer DEFAULT 520,
    df_max_delay6 integer DEFAULT 60,
    df_max_uupdates6 integer DEFAULT 10,
    df_mclt6 integer DEFAULT 3600,
    df_split6 integer DEFAULT 128,
    df_loadbalmax6 integer DEFAULT 3,
    dhcp_flags6 integer DEFAULT 0,
    CONSTRAINT servers_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.servers OWNER TO sauron;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.servers_id_seq OWNER TO sauron;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE servers_id_seq OWNED BY servers.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE settings (
    setting text NOT NULL,
    value text,
    ivalue integer,
    CONSTRAINT settings_setting_check CHECK ((setting <> ''::text))
);


ALTER TABLE public.settings OWNER TO sauron;

--
-- Name: sid_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sid_seq OWNER TO sauron;

--
-- Name: srv_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE srv_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    pri integer NOT NULL,
    weight integer NOT NULL,
    port integer NOT NULL,
    target text DEFAULT '.'::text NOT NULL,
    comment text,
    CONSTRAINT srv_entries_port_check CHECK ((port >= 0)),
    CONSTRAINT srv_entries_pri_check CHECK ((pri >= 0)),
    CONSTRAINT srv_entries_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.srv_entries OWNER TO sauron;

--
-- Name: srv_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE srv_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.srv_entries_id_seq OWNER TO sauron;

--
-- Name: srv_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE srv_entries_id_seq OWNED BY srv_entries.id;


--
-- Name: txt_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE txt_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    txt text,
    comment text
);


ALTER TABLE public.txt_entries OWNER TO sauron;

--
-- Name: txt_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE txt_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.txt_entries_id_seq OWNER TO sauron;

--
-- Name: txt_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE txt_entries_id_seq OWNED BY txt_entries.id;


--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE user_groups (
    id integer NOT NULL,
    name text NOT NULL,
    comment text,
    CONSTRAINT user_groups_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.user_groups OWNER TO sauron;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_groups_id_seq OWNER TO sauron;

--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE user_groups_id_seq OWNED BY user_groups.id;


--
-- Name: user_rights; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE user_rights (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    rtype integer NOT NULL,
    rref integer NOT NULL,
    rule character(80)
);


ALTER TABLE public.user_rights OWNER TO sauron;

--
-- Name: user_rights_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE user_rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_rights_id_seq OWNER TO sauron;

--
-- Name: user_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE user_rights_id_seq OWNED BY user_rights.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    gid integer DEFAULT (-1),
    person integer DEFAULT (-1),
    username text NOT NULL,
    password text,
    name text,
    email text,
    superuser boolean DEFAULT false,
    server integer DEFAULT (-1),
    zone integer DEFAULT (-1),
    last integer DEFAULT 0,
    last_pwd integer DEFAULT 0,
    last_from text,
    search_opts text,
    flags integer DEFAULT 0,
    comment text,
    CONSTRAINT users_username_check CHECK ((username <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.users OWNER TO sauron;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO sauron;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: utmp; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE utmp (
    cookie character(32) NOT NULL,
    uid integer,
    sid integer,
    uname text,
    addr cidr,
    superuser boolean DEFAULT false,
    auth boolean DEFAULT false,
    mode integer,
    w text,
    serverid integer DEFAULT (-1),
    server text,
    zoneid integer DEFAULT (-1),
    zone text,
    login integer DEFAULT 0,
    last integer DEFAULT 0,
    searchopts text,
    searchdomain text,
    searchpattern text
);


ALTER TABLE public.utmp OWNER TO sauron;

--
-- Name: vlans; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE vlans (
    id integer NOT NULL,
    server integer NOT NULL,
    name text NOT NULL,
    vlanno integer,
    description text,
    comment text,
    CONSTRAINT vlans_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.vlans OWNER TO sauron;

--
-- Name: vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vlans_id_seq OWNER TO sauron;

--
-- Name: vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE vlans_id_seq OWNED BY vlans.id;


--
-- Name: vmps; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE vmps (
    id integer NOT NULL,
    server integer NOT NULL,
    name text NOT NULL,
    description text,
    mode integer DEFAULT 0,
    nodomainreq integer DEFAULT 0,
    fallback integer DEFAULT (-1),
    comment text,
    CONSTRAINT vmps_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.vmps OWNER TO sauron;

--
-- Name: vmps_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE vmps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vmps_id_seq OWNER TO sauron;

--
-- Name: vmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE vmps_id_seq OWNED BY vmps.id;


--
-- Name: wks_entries; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE wks_entries (
    id integer NOT NULL,
    type integer NOT NULL,
    ref integer NOT NULL,
    proto character(10),
    services text,
    comment text
);


ALTER TABLE public.wks_entries OWNER TO sauron;

--
-- Name: wks_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE wks_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wks_entries_id_seq OWNER TO sauron;

--
-- Name: wks_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE wks_entries_id_seq OWNED BY wks_entries.id;


--
-- Name: wks_templates; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE wks_templates (
    id integer NOT NULL,
    server integer NOT NULL,
    alevel integer DEFAULT 0,
    name text,
    comment text
)
INHERITS (common_fields);


ALTER TABLE public.wks_templates OWNER TO sauron;

--
-- Name: wks_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE wks_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wks_templates_id_seq OWNER TO sauron;

--
-- Name: wks_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE wks_templates_id_seq OWNED BY wks_templates.id;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: sauron; Tablespace: 
--

CREATE TABLE zones (
    id integer NOT NULL,
    server integer NOT NULL,
    active boolean DEFAULT true,
    dummy boolean DEFAULT false,
    type character(1) NOT NULL,
    reverse boolean DEFAULT false,
    noreverse boolean DEFAULT false,
    flags integer DEFAULT 0,
    forward character(1) DEFAULT 'D'::bpchar,
    nnotify character(1) DEFAULT 'D'::bpchar,
    chknames character(1) DEFAULT 'D'::bpchar,
    class character(2) DEFAULT 'in'::bpchar,
    name text NOT NULL,
    hostmaster text,
    serial character(10) DEFAULT '1999123001'::bpchar,
    serial_date integer DEFAULT 0,
    refresh integer,
    retry integer,
    expire integer,
    minimum integer,
    ttl integer,
    zone_ttl integer,
    comment text,
    reversenet cidr,
    parent integer DEFAULT (-1),
    rdate integer DEFAULT 0,
    transfer_source inet,
    CONSTRAINT zones_name_check CHECK ((name <> ''::text))
)
INHERITS (common_fields);


ALTER TABLE public.zones OWNER TO sauron;

--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: sauron
--

CREATE SEQUENCE zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zones_id_seq OWNER TO sauron;

--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sauron
--

ALTER SEQUENCE zones_id_seq OWNED BY zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY a_entries ALTER COLUMN id SET DEFAULT nextval('a_entries_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY acls ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY acls ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY acls ALTER COLUMN id SET DEFAULT nextval('acls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY arec_entries ALTER COLUMN id SET DEFAULT nextval('arec_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY cidr_entries ALTER COLUMN id SET DEFAULT nextval('cidr_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY dhcp_entries ALTER COLUMN id SET DEFAULT nextval('dhcp_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY dhcp_entries6 ALTER COLUMN id SET DEFAULT nextval('dhcp_entries6_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY group_entries ALTER COLUMN id SET DEFAULT nextval('group_entries_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY groups ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY groups ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hinfo_templates ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hinfo_templates ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hinfo_templates ALTER COLUMN id SET DEFAULT nextval('hinfo_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hosts ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hosts ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY hosts ALTER COLUMN id SET DEFAULT nextval('hosts_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY keys ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY keys ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY keys ALTER COLUMN id SET DEFAULT nextval('keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY lastlog ALTER COLUMN id SET DEFAULT nextval('lastlog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY leases ALTER COLUMN id SET DEFAULT nextval('leases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY mx_entries ALTER COLUMN id SET DEFAULT nextval('mx_entries_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY mx_templates ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY mx_templates ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY mx_templates ALTER COLUMN id SET DEFAULT nextval('mx_templates_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY nets ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY nets ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY nets ALTER COLUMN id SET DEFAULT nextval('nets_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY news ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY news ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY ns_entries ALTER COLUMN id SET DEFAULT nextval('ns_entries_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY printer_classes ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY printer_classes ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY printer_classes ALTER COLUMN id SET DEFAULT nextval('printer_classes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY printer_entries ALTER COLUMN id SET DEFAULT nextval('printer_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY root_servers ALTER COLUMN id SET DEFAULT nextval('root_servers_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY servers ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY servers ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY servers ALTER COLUMN id SET DEFAULT nextval('servers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY srv_entries ALTER COLUMN id SET DEFAULT nextval('srv_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY txt_entries ALTER COLUMN id SET DEFAULT nextval('txt_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY user_groups ALTER COLUMN id SET DEFAULT nextval('user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY user_rights ALTER COLUMN id SET DEFAULT nextval('user_rights_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY users ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY users ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vlans ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vlans ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vlans ALTER COLUMN id SET DEFAULT nextval('vlans_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vmps ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vmps ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY vmps ALTER COLUMN id SET DEFAULT nextval('vmps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY wks_entries ALTER COLUMN id SET DEFAULT nextval('wks_entries_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY wks_templates ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY wks_templates ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY wks_templates ALTER COLUMN id SET DEFAULT nextval('wks_templates_id_seq'::regclass);


--
-- Name: cuser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY zones ALTER COLUMN cuser SET DEFAULT 'unknown'::bpchar;


--
-- Name: muser; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY zones ALTER COLUMN muser SET DEFAULT 'unknown'::bpchar;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sauron
--

ALTER TABLE ONLY zones ALTER COLUMN id SET DEFAULT nextval('zones_id_seq'::regclass);


--
-- Name: a_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY a_entries
    ADD CONSTRAINT a_entries_pkey PRIMARY KEY (id);


--
-- Name: acls_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY acls
    ADD CONSTRAINT acls_key UNIQUE (name, server);


--
-- Name: acls_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY acls
    ADD CONSTRAINT acls_pkey PRIMARY KEY (id);


--
-- Name: arec_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY arec_entries
    ADD CONSTRAINT arec_entries_pkey PRIMARY KEY (id);


--
-- Name: asset_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT asset_key UNIQUE (asset_id, zone);


--
-- Name: cidr_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY cidr_entries
    ADD CONSTRAINT cidr_entries_pkey PRIMARY KEY (id);


--
-- Name: dhcp_entries6_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY dhcp_entries6
    ADD CONSTRAINT dhcp_entries6_pkey PRIMARY KEY (id);


--
-- Name: dhcp_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY dhcp_entries
    ADD CONSTRAINT dhcp_entries_pkey PRIMARY KEY (id);


--
-- Name: duid_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT duid_key UNIQUE (duid, zone);


--
-- Name: ether_info_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY ether_info
    ADD CONSTRAINT ether_info_pkey PRIMARY KEY (ea);


--
-- Name: ether_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT ether_key UNIQUE (ether, zone);


--
-- Name: global_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT global_key PRIMARY KEY (setting);


--
-- Name: group_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY group_entries
    ADD CONSTRAINT group_entries_pkey PRIMARY KEY (id);


--
-- Name: groups_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_key UNIQUE (name, server);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hinfo_templates_hinfo_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hinfo_templates
    ADD CONSTRAINT hinfo_templates_hinfo_key UNIQUE (hinfo);


--
-- Name: hinfo_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hinfo_templates
    ADD CONSTRAINT hinfo_templates_pkey PRIMARY KEY (id);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: hostname_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT hostname_key UNIQUE (domain, zone);


--
-- Name: hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: keyname_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY keys
    ADD CONSTRAINT keyname_key UNIQUE (name, ref, type);


--
-- Name: keys_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: lastlog_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY lastlog
    ADD CONSTRAINT lastlog_pkey PRIMARY KEY (id);


--
-- Name: leases_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY leases
    ADD CONSTRAINT leases_pkey PRIMARY KEY (id);


--
-- Name: mx_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY mx_entries
    ADD CONSTRAINT mx_entries_pkey PRIMARY KEY (id);


--
-- Name: mx_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY mx_templates
    ADD CONSTRAINT mx_templates_pkey PRIMARY KEY (id);


--
-- Name: nets_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY nets
    ADD CONSTRAINT nets_key UNIQUE (net, server);


--
-- Name: nets_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY nets
    ADD CONSTRAINT nets_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: ns_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY ns_entries
    ADD CONSTRAINT ns_entries_pkey PRIMARY KEY (id);


--
-- Name: printer_classes_name_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY printer_classes
    ADD CONSTRAINT printer_classes_name_key UNIQUE (name);


--
-- Name: printer_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY printer_classes
    ADD CONSTRAINT printer_classes_pkey PRIMARY KEY (id);


--
-- Name: printer_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY printer_entries
    ADD CONSTRAINT printer_entries_pkey PRIMARY KEY (id);


--
-- Name: root_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY root_servers
    ADD CONSTRAINT root_servers_pkey PRIMARY KEY (id);


--
-- Name: servers_name_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_name_key UNIQUE (name);


--
-- Name: servers_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: srv_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY srv_entries
    ADD CONSTRAINT srv_entries_pkey PRIMARY KEY (id);


--
-- Name: txt_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY txt_entries
    ADD CONSTRAINT txt_entries_pkey PRIMARY KEY (id);


--
-- Name: user_groups_name_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_name_key UNIQUE (name);


--
-- Name: user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY user_rights
    ADD CONSTRAINT user_rights_pkey PRIMARY KEY (id);


--
-- Name: username_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT username_key UNIQUE (username);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: utmp_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY utmp
    ADD CONSTRAINT utmp_pkey PRIMARY KEY (cookie);


--
-- Name: vlans_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY vlans
    ADD CONSTRAINT vlans_key UNIQUE (name, server);


--
-- Name: vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY vlans
    ADD CONSTRAINT vlans_pkey PRIMARY KEY (id);


--
-- Name: vmps_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY vmps
    ADD CONSTRAINT vmps_key UNIQUE (name, server);


--
-- Name: vmps_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY vmps
    ADD CONSTRAINT vmps_pkey PRIMARY KEY (id);


--
-- Name: wks_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY wks_entries
    ADD CONSTRAINT wks_entries_pkey PRIMARY KEY (id);


--
-- Name: wks_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY wks_templates
    ADD CONSTRAINT wks_templates_pkey PRIMARY KEY (id);


--
-- Name: zones_key; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_key UNIQUE (name, server);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: sauron; Tablespace: 
--

ALTER TABLE ONLY zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: a_entries_host_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX a_entries_host_index ON a_entries USING btree (host);


--
-- Name: a_entries_ip_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX a_entries_ip_index ON a_entries USING btree (ip);


--
-- Name: arec_entries_host_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX arec_entries_host_index ON arec_entries USING btree (host);


--
-- Name: cidr_entries_ip_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX cidr_entries_ip_index ON cidr_entries USING btree (ip);


--
-- Name: cidr_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX cidr_entries_ref_index ON cidr_entries USING btree (type, ref);


--
-- Name: dhcp_entries6_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX dhcp_entries6_ref_index ON dhcp_entries6 USING btree (type, ref);


--
-- Name: dhcp_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX dhcp_entries_ref_index ON dhcp_entries USING btree (type, ref);


--
-- Name: group_entries_host_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX group_entries_host_index ON group_entries USING btree (host);


--
-- Name: history_sid_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX history_sid_index ON history USING btree (sid);


--
-- Name: history_uid_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX history_uid_index ON history USING btree (uid);


--
-- Name: leases_host_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX leases_host_index ON leases USING btree (host);


--
-- Name: leases_ip_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX leases_ip_index ON leases USING btree (ip);


--
-- Name: leases_mac_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX leases_mac_index ON leases USING btree (mac);


--
-- Name: mx_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX mx_entries_ref_index ON mx_entries USING btree (type, ref);


--
-- Name: ns_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX ns_entries_ref_index ON ns_entries USING btree (type, ref);


--
-- Name: srv_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX srv_entries_ref_index ON srv_entries USING btree (type, ref);


--
-- Name: txt_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX txt_entries_ref_index ON txt_entries USING btree (type, ref);


--
-- Name: user_rights_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX user_rights_ref_index ON user_rights USING btree (type, ref);


--
-- Name: wks_entries_ref_index; Type: INDEX; Schema: public; Owner: sauron; Tablespace: 
--

CREATE INDEX wks_entries_ref_index ON wks_entries USING btree (type, ref);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

