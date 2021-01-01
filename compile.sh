if [ $# -lt 1 ]
then
	echo 'usage: ./compile.sh languagecode [design]'
	exit 1
fi

LANGUAGES_DIR="adminer/adminer/lang"
TRANSLATIONS_FILE="warning-translations.csv" 
CSS_FILE="adminer/adminer/static/default.css"
DESIGNS_DIR="adminer/designs"
COMPILE_CMD="php adminer/compile.php sqlite "

step=1
if [ ! -d "adminer" ]
then
echo -e "\n$step. Load adminer's sources:\n"
((step+=1))

git clone --recurse-submodules https://github.com/vrana/adminer.git
echo -e "\n$step. Load plugin code:\n"
((step+=1))
wget -P adminer/plugins/ https://raw.githubusercontent.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/master/fc-sqlite-connection-without-credentials.php
echo -e "\n$step. Adding the plugin to the sources\n"
((step+=1))
cat << "EOPHP" >> adminer/adminer/include/bootstrap.inc.php
include "../plugins/plugin.php";
include "../plugins/fc-sqlite-connection-without-credentials.php";
function adminer_object() {
	$plugins = array(new FCSqliteConnectionWithoutCredentials()); 
	return new AdminerPlugin($plugins);
 }
EOPHP
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
