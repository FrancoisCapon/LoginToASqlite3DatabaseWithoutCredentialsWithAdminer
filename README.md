## :us: Adminer plugin to login to a SQLite3 database without credentials
This plugin for the Web application [Adminer](https://www.adminer.org/en/) allows you to "connect to a database server [SQLite3](https://www.sqlite.org/index.html)" without the need to provide credentials.
> :warning: This plugin should not be used in a production environment:
> * it gives access to all the SQLite3 databases accessible by the PHP script instance
> * it allows you to create a SQLite3 database anywhere in the file system tree that can be accessed by the PHP script instance

:medal_sports: This plugin is now in the official list of [User Contributed Plugins for Adminer](https://www.adminer.org/en/plugins/#user).

### :gear: Installing the plugin
The plugin is used like any other [Adminer plugins](https://www.adminer.org/en/plugins/), that is to say that it requires the following files:

Folder | Script | Description
:--|:--|:--
```./plugins```|```plugin.php```|the plugin base file
```./plugins```|```fc-sqlite-connection-without-credentials.php```|the plugin itself
```./```|```adminer-current.php```|the current version of adminer
```./```|```adminer-4-sqlite3.php```|an "Adminer" loading the plugin

![UML component diagram : SQLite3 plugin for Adminer](./doc/adminer-sqlite3-plugin-uml-component-diagram.png)

```php
<?php 

// ./adminer-4-sqlite3.php

function adminer_object() {

   require "./plugins/fc-sqlite-connection-without-credentials.php";
   require "./plugins/plugin.php";
  
   $plugins = array(new FCSqliteConnectionWithoutCredentials());
    
   return new AdminerPlugin($plugins);

}

require "./adminer-current.php";
```
### :gear: or Build single file version of adminer-4-sqlite3
This script is used to build a SQLite3 "dedicated" Adminer file:
* easy installation (a file to copy)
* respect the philosophy of Adminer
> Adminer consist of a single file ready to deploy to the target server. 
```bash
#!/usr/bin/env bash

# define the URLs
ADMINER=https://www.adminer.org/latest.php
PLUGIN=https://raw.github.com/vrana/adminer/master/plugins/plugin.php
MYPLUGIN=https://github.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/raw/master/fc-sqlite-connection-without-credentials.php
# load and concatenate into one file
wget -O adminer-4-sqilte3.php $ADMINER $PLUGIN $MYPLUGIN

# add myplugin to Adminer
# http://tldp.org/LDP/abs/html/here-docs.html#EX71C
cat << "EOPHP" >> adminer-4-sqilte3.php

function adminer_object() {
    $plugins = array(new FCSqliteConnectionWithoutCredentials());
    return new AdminerPlugin($plugins);
}
EOPHP
# remove all the <?php except the first
# http://www.theunixschool.com/2011/02/sed-replace-or-substitute-file-contents.html
sed -i '2,$s/<?php$//' adminer-4-sqlite3.php
```
### :desktop_computer: Using Adminer with SQLite3 databases
Simply "authenticate" by clicking on the Authentication button by indicating (or not) the path of an existing database.

#### :arrow_forward: Authenfication to create a new SQLite3 database
* The connection is made without indicating a database.
* It is then possible to create a new database.

![adminer for sqlite3 witout credentials new database](./doc/adminer-sqlite3-new-database.gif)
#### :arrow_forward: Authentication on an existing SQLite3 database
* The connection is made by specifying the "server file system" path of an existing database.

![adminer for sqlite3 witout credentials existing database](./doc/adminer-sqlite3-existing-database.gif)
## :fr: Plug-in Adminer pour se connecter à une base de données SQLite3 sans informations d'identification
Ce plug-in pour l'application Web [Adminer](https://www.adminer.org/en/) permet de se « connecter à un serveur de bases de données [SQLite3](https://www.sqlite.org/index.html) » sans avoir besoin de fournir d'informations d'identification (*credentials*).

> :warning: Ce plug-in ne doit pas être utilisé dans un environnement de production : 
> * il donne accès à toutes les bases de données SQLite3 accessibles par l'instance du script PHP
> * il permet de créer une base de données SQLite3 n'importe où dans l'arborescence du système de fichiers qui accessible par l'instance du script PHP

:medal_sports: Ce plugin est maintenant référencé dans la liste des [User Contributed Plugins for Adminer](https://www.adminer.org/en/plugins/#user).

### :gear: Installation du plug-in
Le plug-in s'utilise comme n'importe quels autres [plug-ins de Adminer](https://www.adminer.org/en/plugins/), c'est-à-dire qu'il nécessite les fichiers suivants :

Dossier | Script | Description
:--|:--|:--
```./plugins```|```plugin.php```|le fichier de base des plug-ins
```./plugins```|```fc-sqlite-connection-without-credentials.php```|le plug-in lui-même
```./```|```adminer-current.php```|la version courante d'adminer
```./```|```adminer-4-sqlite3.php```|un « adminer » chargeant le plug-in

![diagramme de composants UML : plugin SQLite3 pour Adminer](./doc/adminer-sqlite3-plugin-uml-component-diagram.png)

```php
<?php 

// ./adminer-4-sqlite3.php

function adminer_object() {

   require "./plugins/fc-sqlite-connection-without-credentials.php";
   require "./plugins/plugin.php";
  
   $plugins = array(new FCSqliteConnectionWithoutCredentials());
    
   return new AdminerPlugin($plugins);

}

require "./adminer-current.php";
```
### :gear: ou Construire une version adminer-4-sqlite3 monofichier
Ce script permet de construire un Adminer monofichier "dédié" SQLite3 :
* installation facile (un fichier à copier)
* respect la philosophie de Adminer
> Adminer consist of a single file ready to deploy to the target server. 
```bash
#!/usr/bin/env bash

# define the URLs
ADMINER=https://www.adminer.org/latest.php
PLUGIN=https://raw.github.com/vrana/adminer/master/plugins/plugin.php
MYPLUGIN=https://github.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/raw/master/fc-sqlite-connection-without-credentials.php
# load and concatenate into one file
wget -O adminer-4-sqilte3.php $ADMINER $PLUGIN $MYPLUGIN

# add myplugin to Adminer
# http://tldp.org/LDP/abs/html/here-docs.html#EX71C
cat << "EOPHP" >> adminer-4-sqilte3.php

function adminer_object() {
    $plugins = array(new FCSqliteConnectionWithoutCredentials());
    return new AdminerPlugin($plugins);
}
EOPHP
# remove all the <?php except the first
# http://www.theunixschool.com/2011/02/sed-replace-or-substitute-file-contents.html
sed -i '2,$s/<?php$//' adminer-4-sqlite3.php
```
### :desktop_computer: Utilisation d'Adminer avec des bases SQLite3
Il suffit de « s'authentifier » en cliquant sur le bouton Authentification en indiquant (ou non) le chemin d'une base de donnée existante.
#### :arrow_forward: Authenfication pour créer une nouvelle base SQLite3
* La connexion s'effectue sans indiquer de base de données.
* Il est alors possible de créer une nouvelle base de données.

![adminer pour sqlite3 nouvelle base de données](./doc/adminer-sqlite3-new-database.gif)
#### :arrow_forward: Authenfication sur base SQLite3 existante
* La connexion s'effectue en indiquant le chemin « système de fichiers serveur » d'une base de données existante.

![adminer pour sqlite3 base de données existante](./doc/adminer-sqlite3-existing-database.gif)
