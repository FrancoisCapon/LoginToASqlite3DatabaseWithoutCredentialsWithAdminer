:fr: [fr](#fr-)
## :us: Adminer plugin to login to a Sqlite3 database without credentials
## :fr: Adminer plug-in pour se connecter à une base de données Sqlite3 sans informations d'identification
Ce plug-in pour l'application Web [Adminer](https://www.adminer.org/en/) permet de se « connecter » à une base de données [SQLite3](https://www.sqlite.org/index.html) sans avoir besoin de fournir d'informations d'identification (*credientials*).

> :warning: Ce plug-in ne doit pas être utilisé dans un environnement de production : 
> * il donne accès à toutes les bases de base de données SQLite3 accessibles par l'instance du script PHP
> * il permet de créer une base de données SQLite3 n'importe où dans l'arborescence de fichiers accessible par l'instance du script PHP
### Installation du plug-in
Le plug-in s'utilise comme n'importe quels autres [plug-ins de Adminer](https://www.adminer.org/en/plugins/), c'est-à-dire qu'il nécessite les fichiers suivants :

Dossier | Script | Description
:--|:--|:--
```./plugins```|```plugin.php```|le fichier de base des plug-ins
```./plugins```|```fc-sqlite-connection-without-credentials.php```|le plug-in lui-même
```./```|```adminer.php```|la version courante d'adminer
```./```|```index.php```|un « adminer » chargeant le plug-in

```php
<?php 

// ./index.php

function adminer_object() {

   require "./plugins/plugin.php";
   require "./plugins/fc-sqlite-connection-without-credentials.php";

   $plugins = array(
             new FCSqliteConnectionWithoutCredentials()
    );
    
    return new AdminerPlugin($plugins);

}

require "./adminer.php";
```
### Utilisation d'Adminer avec des bases SQLite3
Il suffit de « s'authentifier » en cliquant sur le bouton Authentification en indiquant (ou non) le chemin d'une base de donnée existante.
