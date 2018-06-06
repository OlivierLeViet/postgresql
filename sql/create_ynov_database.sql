\c ynov

CREATE TABLE students ( student_id SERIAL PRIMARY KEY,
nom TEXT,
prenom TEXT );

CREATE TABLE classes (class_id SERIAL PRIMARY KEY,
class_name TEXT,
professeur TEXT );

CREATE TABLE notes (note_id SERIAL PRIMARY KEY,
note INT,
coefficient INT,
student_id INT REFERENCES students (student_id),
class_id INT REFERENCES classes (class_id) );

INSERT INTO students ( nom, prenom) VALUES ( 'Holloway', 'Max'), 
( 'Kim', 'Jong-Un');
INSERT INTO classes ( 'anglais', 'John');
INSERT INTO notes ( 14, 2, 2, 1 );

