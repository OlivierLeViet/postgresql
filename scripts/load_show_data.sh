#!/bin/bash

#lancement du fichier truncate.sql qui permet de vider les tables
psql --username=admin -f sql/truncate.sql

#crypte les password des users
psql --username=admin -f sql/crypt_password.sql

#sous le user admin lance load_table.sql remplit les tables à l'aide des csv
psql --username=admin -f sql/load_table.sql


