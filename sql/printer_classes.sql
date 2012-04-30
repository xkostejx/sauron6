/* printer_classes table creation
 *
 * $Id: printer_classes.sql,v 1.3 2001/04/18 08:57:56 tjko Exp $
 */

/** Global table to store printer classes (printcap stuff)
    these classess maybe referred to in PRINTER fields in other tables. **/

CREATE TABLE printer_classes (
       id           SERIAL PRIMARY KEY, /* unique ID */
       name	    TEXT UNIQUE NOT NULL CHECK(name <> ''), /* class name */

       comment	    TEXT 
) INHERITS(common_fields);

