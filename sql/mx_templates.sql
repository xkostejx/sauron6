/* mx_templates table creation
 *
 * $Id: mx_templates.sql,v 1.6 2001/11/18 19:25:15 tjko Exp $
 */

/** MX entry templates, hosts may link to one entry in this table.
    Entries are zone specific. **/

CREATE TABLE mx_templates (
	id		SERIAL PRIMARY KEY, /* unique ID */
	zone		INT4 NOT NULL, /* ptr to a zone table record
					  -->zones.id */
        alevel	        INT4 DEFAULT 0, /* required authorization level */
	name		TEXT, /* template name */
	comment		TEXT 
) INHERITS(common_fields);

