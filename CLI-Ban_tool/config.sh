#! /bin/bash
# ----------------------------------- #
# Configuration file for CLI-Ban_tool #
# Use full paths for file locations   #
# and enter the name of your screen   #
# session. Be sure the screen session #
# in which you start the server is    #
# always named exactly the same!      #
#                                     #
# -- Written by tobi-the-fraggel --   #
# ----------------------------------- #


#######################################
# REQUIREMENTS FOR THIS TOOL:		  #
#								      #
# --Debian based operating system     #
# --Linux 'Screen' is installed.      #
#   (# apt-get install screen)        #
# --Project Reality runs in a Screen. #
# --The screen session should be      #
#   called the same everytime the     #
#   server starts. Otherwise you would#
#   need to adjust the screen name in #
#   this configuration file everytime #
#   the server starts.                #
#######################################


# Full path to the location of your PR servers banlist
BANLIST="/path/to/mods/pr/settings/banlist.con"

# Full path to temporary bans file.
# The file can be named and placed anywhere you like.
# It's purpose is to store scheduled bans.
# The below is just an example
TEMPBAN="/path/to/your/banlist.txt"

# Enter the name of you screen session
SCREEN="NameOfYourScreenSession"