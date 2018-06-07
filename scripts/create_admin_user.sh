#!/bin/bash

# chemin vers l'utilisateur admin sauvegarder dans .pgpass
touch ~/.pgpass
echo "*:*:*:admin:admin42" >> /mnt/c/.pgpass 
chmod 0600 ~/.pgpass
chown olivier:olivier ~/.pgpass

#createion de l'utilisateru admin en que role admin
sudo -u postgres psql -c "CREATE ROLE admin LOGIN PASSWORD 'admin42' SUPERUSER"
#creation des databases avec admin pour propriétaire
sudo -u postgres psql -c "CREATE DATABASE admin OWNER = admin "
sudo -u postgres psql -c "CREATE DATABASE ynov OWNER = admin "

#redémarre le service postresql
sudo service postgresql restart

