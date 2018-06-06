\c shows

ALTER TABLE "user_follow_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;

COPY show (show_id, name, description, release_year, genres, network )
FROM  '/home/olivier/scripts/csv/show.csv' DELIMITER ',' CSV HEADER;

COPY users (user_id, registration_date, firstname, lastname, email, password )
FROM'/home/olivier/scripts/csv/user.csv' DELIMITER ',' CSV HEADER;

COPY episode (episode_id, show_id, season, number, date )
FROM '/home/olivier/scripts/csv/episode.csv' DELIMITER ',' CSV HEADER;

COPY user_follow_show (user_id, show_id, follow_date )
FROM '/home/olivier/scripts/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;

COPY user_rate_show ( user_id, show_id, rating, rating_date )
FROM '/home/olivier/scripts/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;

COPY user_watch_episode ( user_id, episode_id, watch_date )
FROM '/home/olivier/scripts/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE "user_follow_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
