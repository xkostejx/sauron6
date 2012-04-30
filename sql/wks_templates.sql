/* wks_templates table creation
 *
 * $Id: wks_templates.sql,v 1.6 2001/11/18 19:25:16 tjko Exp $
 */

/** WKS entry templates, hosts may link to one entry
    in this table. Entries are server specific. **/

CREATE TABLE wks_templates (
	id		SERIAL PRIMARY KEY, /* unique ID */
	server		INT4 NOT NULL, /* ptr to a server table record
					  -->servers.id */
        alevel	        INT4 DEFAULT 0, /* required authorization level */
	name		TEXT, /* template name */
	comment		TEXT
) INHERITS(common_fields);

