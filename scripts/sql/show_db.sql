-- vas dans la DB shows;
\c shows

-- crée les tables users episode show et les 3 tables de jointures;
CREATE TABLE users ( user_id SERIAL PRIMARY KEY,
registration_date TIMESTAMP CHECK (registration_date < NOW() ),
firstname TEXT, lastname TEXT,
email TEXT CHECK ( email LIKE '%@%' ), password TEXT );

CREATE TABLE episode ( episode_id SERIAL PRIMARY KEY,
show_id INT,season INT, number INT, date TIMESTAMP );

CREATE TABLE show ( show_id SERIAL PRIMARY KEY,
name TEXT, description TEXT , release_year INT,
genres VARCHAR, network TEXT  );

CREATE TABLE user_follow_show ( user_id INT REFERENCES users (user_id),
show_id INT REFERENCES show (show_id), follow_date TIMESTAMP CHECK ( follow_date < NOW() ) );

CREATE TABLE user_rate_show ( user_id INT REFERENCES users (user_id),
show_id INT REFERENCES show (show_id), rating INT, rating_date TIMESTAMP CHECK ( rating_date < NOW() ) );

CREATE TABLE user_watch_episode ( user_id INT REFERENCES users (user_id),
episode_id INT REFERENCES episode (episode_id), watch_date TIMESTAMP CHECK (watch_date < NOW() ) );
