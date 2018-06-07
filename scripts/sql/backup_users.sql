\c shows

--sauvegarde des données de la table users format csv
COPY users TO '/mnt/c/postgresql/scripts/backup/users.csv' DELIMITER ',' CSV HEADER;
