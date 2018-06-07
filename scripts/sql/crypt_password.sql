--installation de pgcrypto
CREATE EXTENSION pgcrypto;

--Mise a jour de la table users en cryptant le mot de passe.
UPDATE users
SET password = crypt(password, gen_salt('bf'));

--affichage de 3 utilisateurs pour confirmer le cryptage
--SELECT firstname, password FROM users LIMIT 3;
