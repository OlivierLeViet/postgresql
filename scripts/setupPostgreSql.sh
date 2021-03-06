#!/bin/bash

--suppression du fichier pour éviter de réécrire la ligne à chaque fois.
rm -f /etc/apt/sources.list.d/pgdg.list

--Ajout des dépendances
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main
" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

--installation de PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install postgresql-10

--Affichage de la version de PostgreSQL
psql -V

