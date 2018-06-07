CREATE EXTENSION pgcrypto;

UPDATE users
SET password = crypt(password, gen_salt('bf'));

--SELECT * FROM users LIMIT 3;
