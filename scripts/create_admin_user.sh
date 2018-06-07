#!/bin/bash

# chemin vers l'utilisateur admin sauvegardé dans .pgpass
touch ~/.pgpass
echo "*:*:*:admin:admin42" >> /mnt/c/.pgpass 
chmod 0600 ~/.pgpass
chown olivier:olivier ~/.pgpass

#créateion du rôle admin
sudo -u postgres psql -c "CREATE ROLE admin LOGIN PASSWORD 'admin42' SUPERUSER"

#creation des databases avec admin pour propriétaire
sudo -u postgres psql -c "CREATE DATABASE admin OWNER = admin "

#redémarre le service postresql
sudo service postgresql restart

