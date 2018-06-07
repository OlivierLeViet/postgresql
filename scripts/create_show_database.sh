#!/bin/bash

#supprimier la table si elle existe avant de la créer
psql --username=admin -c "DROP DATABASE shows"
psql --username=admin -c "CREATE DATABASE shows"

#lance le scsript show_db.sql sous l'utilisateur admin
psql --username=admin -f sql/show_db.sql
