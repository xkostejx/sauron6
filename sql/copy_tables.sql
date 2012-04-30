/* copy_tables.sql
 *
 * $Id: copy_tables.sql,v 1.1 2001/04/18 08:57:54 tjko Exp $
 */


/* make copy of hosts table; for deleted records */

SELECT * INTO TABLE deleted_hosts FROM hosts WHERE id < 0;

/* eof */
