#!/bin/bash

#sous le user admin défini la time zone du serveur 

psql --username=admin -c "ALTER SYSTEM SET timezone = 'Europe/Paris';"
