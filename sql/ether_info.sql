/* ether_info table creation
 *
 * $Id: ether_info.sql,v 1.2 2001/03/16 20:32:26 tjko Exp $
 */

/** This table contains Ethernet adapter manufacturer codes.  **/

CREATE TABLE ether_info (
       	ea		CHAR(6) PRIMARY KEY, /* manufacturer code 
					      (6 bytes in hex) */
       	info		TEXT /* manufacturer name & info */
);

