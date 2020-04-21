#!/usr/bin/env bash
# author : François Capon

# define the URLs
ADMINER=https://www.adminer.org/latest.php
PLUGIN=https://raw.github.com/vrana/adminer/master/plugins/plugin.php
MYPLUGIN=https://github.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/raw/master/fc-sqlite-connection-without-credentials.php
# load and concatenate into one file
wget -O adminer-4-sqlite3.php $ADMINER $PLUGIN $MYPLUGIN

# add myplugin to Adminer
# http://tldp.org/LDP/abs/html/here-docs.html#EX71C
cat << "EOPHP" >> adminer-4-sqlite3.php

function adminer_object() {
    $plugins = array(new FCSqliteConnectionWithoutCredentials());
    return new AdminerPlugin($plugins);
}
EOPHP
# remove all the <?php except the first
# http://www.theunixschool.com/2011/02/sed-replace-or-substitute-file-contents.html 
sed -i '2,$s/<?php$//' adminer-4-sqlite3.php
