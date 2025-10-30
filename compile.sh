if [ $# -lt 1 ]
then
	echo 'usage: ./compile.sh languagecode [design]'
	exit 1
fi

DESIGNS_DIR="adminer/designs"
INCLUDES_DIR="adminer/adminer/include/"
LANGUAGES_DIR="adminer/adminer/lang"
PLUGINS_DIR="adminer/plugins"

TRANSLATIONS_FILE="warning-translations.csv" 
CSS_FILE="adminer/adminer/static/default.css"
COMPILE_CMD="php adminer/compile.php sqlite"
# COMMIT_VERSION="v4.17.1"
# COMMIT_VERSION="v5.3.0"
COMMIT_VERSION="v5.4.1"

step=1
if [ ! -d "adminer" ]
then

echo -e "\n$step. Load adminer's sources:\n"
((step+=1))

git clone --depth 1 --branch $COMMIT_VERSION --recurse-submodules -c advice.detachedHead=false https://github.com/vrana/adminer.git 

echo -e "\n$step. Add plugin to source and \"bootstrap\" it\n"
((step+=1))

cp fc-sqlite-connection-without-credentials.php $PLUGINS_DIR/fc-sqlite-connection-without-credentials.php
cat << "EOPHP" >> $PLUGINS_DIR/fc-sqlite-connection-without-credentials.php
function adminer_object() {
    $plugins = array(new AdminerFCSqliteConnectionWithoutCredentials()); 
    return new Plugins($plugins);
}
EOPHP
cp $INCLUDES_DIR/bootstrap.inc.php $INCLUDES_DIR/vrana-bootstrap.inc.php
cat << "EOPHP" >> $INCLUDES_DIR/fc-bootstrap.inc.php
<?php
require "../plugins/fc-sqlite-connection-without-credentials.php";
EOPHP
cat $INCLUDES_DIR/fc-bootstrap.inc.php $INCLUDES_DIR/vrana-bootstrap.inc.php > $INCLUDES_DIR/bootstrap.inc.php
sed -i '2,$s/<?php$//' adminer/adminer/include/bootstrap.inc.php
# fix: function_exists('adminer_object') to function_exists('Adminer\adminer_object')
sed -i "s/(function_exists('adminer_object') ? adminer_object()/(function_exists('Adminer\\\adminer_object') ? adminer_object()/" $INCLUDES_DIR/bootstrap.inc.php

fi

echo -e "\n$step. Search warning translation\n"
((step+=1))

language=$1
translation=$(grep ^$language, $TRANSLATIONS_FILE | cut -d',' -f2 | tr -d '\n')
if [ "$translation" != "" ]
then 
	echo $translation
	cp $LANGUAGES_DIR/$language.inc.php $LANGUAGES_DIR/$language.inc.php.backup
	sed -i 's/);//' $LANGUAGES_DIR/$language.inc.php
	cat << EOPHP >> $LANGUAGES_DIR/$language.inc.php
	'Warning: don\'t use it in a production environment!' => '$translation',
);
EOPHP
fi

if [ $# -eq 2 ]
then
design=$2

echo -e "\n$step. Set the design: $design\n"
((step+=1))

	cp $CSS_FILE $CSS_FILE.backup
	cat $CSS_FILE.backup $DESIGNS_DIR/$design/adminer.css > $CSS_FILE
fi

echo -e "\n$step. Compile in language: $language\n"
((step+=1))

$COMPILE_CMD $language 2> /dev/null

echo -e "\n$step. Clean the sources\n"
((step+=1))

if [ "$translation" != "" ]
then
	cp $LANGUAGES_DIR/$language.inc.php.backup $LANGUAGES_DIR/$language.inc.php
fi

if [ $# -eq 2 ]
then
	cp $CSS_FILE.backup $CSS_FILE
fi

echo -e "\n$step. Voilà!\n"
