#!/bin/bash

#Lance les scripts pour la création de user, de la base et tables, et rempli les tables
./create_admin_user.sh
./create_show_database.sh
./load_show_data.sh
