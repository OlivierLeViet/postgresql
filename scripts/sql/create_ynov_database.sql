--deletio net création de la DB et des tables
DROP DATABASE ynov;
CREATE DATABASE ynov;
\c ynov

DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
student_id serial PRIMARY KEY,
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL
);

CREATE TABLE classes (
class_id serial PRIMARY KEY,
class_name VARCHAR (100),
teacher_name VARCHAR (100)
);

CREATE TABLE notes (
note_id serial PRIMARY KEY,
student_id integer REFERENCES students (student_id) NOT NULL,
class_id integer REFERENCES classes (class_id) NOT NULL,
note NUMERIC(5, 3) NOT NULL,
coefficient NUMERIC(3, 2) NOT NULL
);

--peuplement
INSERT INTO students (firstname, lastname)
VALUES ('Olivier', 'Tran');
INSERT INTO students (firstname, lastname)
VALUES ('Theo', 'Cib');


INSERT INTO classes (class_name, teacher_name)
VALUES ('postgreSQL', 'PILLET Gabriel');
INSERT INTO classes (class_name, teacher_name)
VALUES ('NodeJS', 'Gabin AURECHE');


INSERT INTO notes (student_id, class_id, note, coefficient)
VALUES ((SELECT student_id FROM students WHERE firstname='Olivier'),
        (SELECT class_id FROM classes WHERE class_name='postgreSQL'),
        20, 2);
INSERT INTO notes (student_id, class_id, note, coefficient)
VALUES ((SELECT student_id FROM students WHERE firstname='Olivier'),
        (SELECT class_id FROM classes WHERE class_name='postgreSQL'),
        10, 1);
INSERT INTO notes (student_id, class_id, note, coefficient)
VALUES ((SELECT student_id FROM students WHERE firstname='Olivier'),
        (SELECT class_id FROM classes WHERE class_name='NodeJS'),
        13, 2);
INSERT INTO notes (student_id, class_id, note, coefficient)
VALUES ((SELECT student_id FROM students WHERE firstname='Theo'),
        (SELECT class_id FROM classes WHERE class_name='NodeJS'),
        2, 1);
INSERT INTO notes (student_id, class_id, note, coefficient)
VALUES ((SELECT student_id FROM students WHERE firstname='Theo'),
        (SELECT class_id FROM classes WHERE class_name='postgreSQL'),
        16, 3);

--Création de la vue avec le calcul de la moyenne generale
CREATE VIEW average_students AS
        SELECT stds.student_id AS id,
        stds.firstname || ' ' || stds.lastname AS full_name,
        SUM(n.note*n.coefficient)/SUM(n.coefficient) AS moyenneGen
        FROM students stds
        JOIN notes n ON stds.student_id = n.student_id
        GROUP BY stds.student_id;