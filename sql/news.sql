/* news table creation
 *
 * $Id: news.sql,v 1.1 2001/05/28 22:44:35 tjko Exp $
 */

/** This table contains motd/news to be displayed when user logs in...  **/

CREATE TABLE news (
	id		SERIAL PRIMARY KEY, /* unique ID */

	server		INT DEFAULT -1, /* ptr to server or -1 for global
					   news messages */
       	info		TEXT NOT NULL /* news/motd message */
) INHERITS(common_fields);


