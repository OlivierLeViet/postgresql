# postgresql

Projet PostgreSQL YnovB2 par Olivier TRAN & Gautier NICOLLET.

***Liste des scripts***

-setupPostgreSql --> installation de PostgreSQL & de ses dépendances. Si l'installation est effectuée correctement, la version de PostgreSQL doit s'afficher dans la console.

-create_admin_user --> création du fichier .pgpass + création du rôle admin et de la base de données admin. 

-set_configuration --> mise à jour de la config serveur, ici, le timestamp.

-create_show_database --> création de la base de données show & des tables.

-load_show_database --> peuplement de la BDD show avec les csv.

-ynov

-backup_shows --> backup de la table shows et du serveur avec pg_dump et pg_dumpall.

***Notes importantes***

Pour que le projet fonctionne, modifiez les éléments suivants:
-le chemin vers le fichier scripts: /mnt/c/postgresql

Assurez-vous d'avoir un dossier csv avec les fichiers à importer dans la DB show.
