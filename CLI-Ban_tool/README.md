## Project Reality CLI tool to add/remove/schedule bans 

These scripts are meant to be a workaround for the
annoying banlist-lost-key bug. When editing the banlist
file a newly added key gets lost if an admin **!b** or
**!tb** a player. The scripts avoid this from happening
by injecting the ban command directly into the running
PR console.

#### Requirements
* Unix like OS 
* Program *screen* is installed
* PR runs in a *screen* session
* *screen* session name is always the same.

#### Features
* Safely adds hashes to PR banlist.con
* Safely removes hashes from PR banlist.con
* ability to apply scheduled bans

#### Installation / Usage
* **Install:**
	* Log in to the user which runs PR on your box
	* Put the files into '~/bin'
	* Add '~/bin' to $PATH variable
      If you don't know how to do that
      Check this out >> http://askubuntu.com/questions/60218/how-to-add-a-directory-to-my-path 
* **Usage:**
	* To perm ban do *ban <hashKey>*
	* To unban do *unban <hashKey>*
	* To schedule a ban do *ban <hashKey> <time in days>*
* **Example:**
	* _**ban fffe41e8bebbc676846d440f0cde8a32**_ (bans the player with this hash permanently)
	* _**unban fffe41e8bebbc676846d440f0cde8a32**_ (removes player with this hash from banlist)
	* _**ban fffe41e8bebbc676846d440f0cde8a32 44**_ (bans the player with this hash for 32 days)

--- tobi-the-fraggel, 04th February 2016