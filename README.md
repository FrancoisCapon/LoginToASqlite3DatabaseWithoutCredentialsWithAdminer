## Adminer plugin to login to a SQLite3 database without credentials

#### :file_folder: versions for Adminer v4.x.x are in [4.x--1.x branch](https://github.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/tree/4.x--1.x)
### :new: Adminer v5.x.x is now supported

This plugin for the Web application [Adminer](https://www.adminer.org/en/) allows you to "connect to a database server [SQLite3](https://www.sqlite.org/index.html)" without the need to provide credentials **(no username and no password)**.

> :warning: This plugin should not be used in a production environment:
> * it gives access to all the SQLite3 databases accessible by the PHP script instance
> * it allows you to create a SQLite3 database anywhere in the file system tree that can be accessed by the PHP script instance

## :construction_worker: Install `or` :robot: Use compiled release `or` :gear: Compile

### :arrow_forward: Install the plugin :construction_worker:
The plugin is used like any other [Adminer plugins](https://www.adminer.org/en/plugins/), that is to say that it requires the following files:

Folder | Script | Description
:--|:--|:--
```./adminer-plugins```|```fc-sqlite-connection-without-credentials.php```|the plugin itself
```./```|```adminer-current.php```|the current version of adminer 5.x.x

### :arrow_forward: Use the [latest compiled releases](https://github.com/FrancoisCapon/LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/releases/latest) :robot:

### :arrow_forward: Compile a single file version :gear:

This script is used to *compile* a SQLite3 "dedicated" Adminer file:

* easy installation (a file to copy)
* light size (200Ko)
* can embedded your favorite design
* respect the philosophy of Adminer
> Adminer consist of a single file ready to deploy to the target server.

:memo: You can contribute by filling the warning translations file (`warning-translations.csv`)

### Examples of usage
* How to use it
```
> ./compile.sh
usage: ./compile.sh languagecode [design]
```
* First usage
```
> ./compile.sh en

1. Load adminer's sources:

Cloning into 'adminer'...
remote: Enumerating objects: 299, done.
remote: Counting objects: 100% (299/299), done.
remote: Compressing objects: 100% (283/283), done.
remote: Total 299 (delta 25), reused 166 (delta 12), pack-reused 0 (from 0)
Receiving objects: 100% (299/299), 683.04 KiB | 3.59 MiB/s, done.
Resolving deltas: 100% (25/25), done.
Submodule 'JsShrink' (https://github.com/vrana/JsShrink) registered for path 'externals/JsShrink'
Submodule 'PhpShrink' (https://github.com/vrana/PhpShrink) registered for path 'externals/PhpShrink'
Submodule 'jush' (https://github.com/vrana/jush) registered for path 'externals/jush'
Cloning into '/home/.../LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/adminer/externals/JsShrink'...
remote: Enumerating objects: 86, done.        
remote: Counting objects: 100% (39/39), done.        
remote: Compressing objects: 100% (23/23), done.        
remote: Total 86 (delta 10), reused 33 (delta 10), pack-reused 47 (from 1)        
Receiving objects: 100% (86/86), 123.11 KiB | 1.89 MiB/s, done.
Resolving deltas: 100% (20/20), done.
Cloning into '/home/.../LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/adminer/externals/PhpShrink'...
remote: Enumerating objects: 115, done.        
remote: Counting objects: 100% (115/115), done.        
remote: Compressing objects: 100% (65/65), done.        
remote: Total 115 (delta 61), reused 88 (delta 39), pack-reused 0 (from 0)        
Receiving objects: 100% (115/115), 20.55 KiB | 5.14 MiB/s, done.
Resolving deltas: 100% (61/61), done.
Cloning into '/home/.../LoginToASqlite3DatabaseWithoutCredentialsWithAdminer/adminer/externals/jush'...
remote: Enumerating objects: 1486, done.        
remote: Counting objects: 100% (250/250), done.        
remote: Compressing objects: 100% (143/143), done.        
remote: Total 1486 (delta 164), reused 184 (delta 105), pack-reused 1236 (from 1)        
Receiving objects: 100% (1486/1486), 1.13 MiB | 5.25 MiB/s, done.
Resolving deltas: 100% (1023/1023), done.
Submodule path 'externals/JsShrink': checked out '4f8a69bd80bda24e8233bca428e5f56400e3cb1b'
Submodule path 'externals/PhpShrink': checked out '2b38322c9c2c9cff11388d92785458fd49343afa'
Submodule path 'externals/jush': checked out 'c6ae413ff0b91da659a9675e70c3ff5c02f50fac'

2. Add plugin to source and bootstrap it


3. Search warning translation


4. Compile in language: en

adminer-5.3.0-sqlite-en.php created (204684 B).

5. Clean the sources


6. Voilà!

```

* Next usage

```
> ./compile.sh fr flat

1. Search warning translation

Attention : ne l\'utilisez pas dans un environnement de production !

2. Set the design: flat


3. Compile in language: fr

adminer-5.3.0-sqlite-fr.php created (207258 B).

4. Clean the sources


5. Voilà!

```

## :desktop_computer: Using Adminer with SQLite3 databases
Simply "authenticate" by clicking on the Authentication button by indicating (or not) the path of an existing database.

#### :arrow_forward: Authenfication to create a new SQLite3 database
* The connection is made without indicating a database.
* It is then possible to create a new database.

![adminer for sqlite3 witout credentials new database](./doc/adminer-sqlite3-new-database.gif)
#### :arrow_forward: Authentication on an existing SQLite3 database
* The connection is made by specifying the "server file system" path of an existing database.

![adminer for sqlite3 witout credentials existing database](./doc/adminer-sqlite3-existing-database.gif)
