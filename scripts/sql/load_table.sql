-- vas dans la DB shows;
\c shows

-- permet de désactiver les verificaitons de clé étrangères;
ALTER TABLE "user_follow_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;

-- importe les fichies csv dans les tables associés;
COPY show (show_id, name, description, release_year, genres, network )
FROM '/mnt/c/postgresql/scripts/csv/show.csv' DELIMITER ',' CSV HEADER;

COPY users (user_id, registration_date, firstname, lastname, email, password )
FROM '/mnt/c/postgresql/scripts/csv/user.csv' DELIMITER ',' CSV HEADER;

COPY episode (episode_id, show_id, season, number, date )
FROM '/mnt/c/postgresql/scripts/csv/episode.csv' DELIMITER ',' CSV HEADER;

COPY user_follow_show (user_id, show_id, follow_date )
FROM '/mnt/c/postgresql/scripts/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;

COPY user_rate_show ( user_id, show_id, rating, rating_date )
FROM '/mnt/c/postgresql/scripts/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;

COPY user_watch_episode ( user_id, episode_id, watch_date )
FROM '/mnt/c/postgresql/scripts/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;

--réactive la vérification des clés étrangères;
ALTER TABLE "user_follow_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
