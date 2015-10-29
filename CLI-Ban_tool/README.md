## Project Reality CLI tool to add/remove/schedule bans 

These scripts are meant to be a workaround for the
annoying banlist-lost-key bug. When editing the banlist
file a newly added key gets lost if an admin **!b** or
**!tb** a player. The scripts avoid this from happening
by injecting the ban command directly into the running
PR console.

#### Requirements
**- Unix like OS 
- Program *screen* is installed
- PR runs in a *screen* session
- *screen* session name is always the same.**

#### Recommendation
Log in on your box with the user account the pr server
is running on.
If you don't already have the folder do **mkdir ~/bin**
Add the folder to $PATH variable.
http://askubuntu.com/questions/60218/how-to-add-a-directory-to-my-path
Why would you like to do that?
You can then run the scripts form anywhere in your directory tree
like any other program.


--- tobi-the-fraggel, 15th October 2015
