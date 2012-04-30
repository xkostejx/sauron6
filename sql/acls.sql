/* ACLs table creation
 *
 * $Id: acls.sql,v 1.1 2005/01/25 04:49:05 tjko Exp $
 */

/** ACLs (access control lists) definitions. ACLs can contain
    IP, CIDR, and TSIG key entries. **/

CREATE TABLE acls (
       id	    SERIAL PRIMARY KEY, /* unique ID */
       server	    INT4 NOT NULL, /* ptr to a servers table record
					-->servers.id */

       name	    TEXT NOT NULL CHECK(name <> ''), /* ACL name */
       type	    INT4 NOT NULL DEFAULT 0,  /* reserved */
       comment	    TEXT,

       CONSTRAINT   acls_key UNIQUE(name,server)
) INHERITS(common_fields);

