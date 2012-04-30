/* user_groups table creation
 *
 * $Id: user_groups.sql,v 1.1 2001/04/18 06:00:58 tjko Exp $
 */

/** This table contains records defining user groups.  **/

CREATE TABLE user_groups (
       id           SERIAL PRIMARY KEY,                /* unique ID */
       name	    TEXT NOT NULL CHECK (name <> ''),  /* group name */     
       comment	    TEXT,                              /* comments */

       CONSTRAINT   user_groups_name_key UNIQUE(name)
);


