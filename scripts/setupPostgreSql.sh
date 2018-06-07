#!/bin/bash

#rajoute une ligne nécessaire  dans le fichier pgdg.list à l'installion de postgresqm
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main
" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

#  download upate postgresql
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install postgresql-10

psql -V

