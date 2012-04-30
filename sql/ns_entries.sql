/* ns_entries table creation
 *
 * $Id: ns_entries.sql,v 1.4 2005/05/13 05:31:54 tjko Exp $
 */

/** This table contains NS resource record definitions. **/

CREATE TABLE ns_entries (
	id	    SERIAL PRIMARY KEY, /* unique ID */
	type        INT4 NOT NULL, /* type:
					1=zone (not used anymore!),
					2=host */
        ref         INT4 NOT NULL, /* ptr to table speciefied by type field
					-->zones.id
					-->hosts.id */
	ns	    TEXT, /* value of NS record (FQDN) */
        comment     TEXT
);

CREATE INDEX ns_entries_ref_index ON ns_entries (type,ref);

