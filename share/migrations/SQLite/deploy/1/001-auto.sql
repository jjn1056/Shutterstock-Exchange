-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Wed Apr  4 10:59:58 2012
-- 

;
BEGIN TRANSACTION;
--
-- Table: person
--
CREATE TABLE person (
  person_id INTEGER PRIMARY KEY NOT NULL,
  handle varchar(24) NOT NULL,
  email varchar(96) NOT NULL,
  password char(40) NOT NULL
);
CREATE UNIQUE INDEX person_email ON person (email);
CREATE UNIQUE INDEX person_handle ON person (handle);
--
-- Table: question
--
CREATE TABLE question (
  question_id INTEGER PRIMARY KEY NOT NULL,
  title varchar(64) NOT NULL,
  details text NOT NULL,
  asked_on datetime NOT NULL,
  person_id integer NOT NULL,
  FOREIGN KEY(person_id) REFERENCES person(person_id)
);
CREATE INDEX question_idx_person_id ON question (person_id);
--
-- Table: answer
--
CREATE TABLE answer (
  answer_id INTEGER PRIMARY KEY NOT NULL,
  content text NOT NULL,
  person_id integer NOT NULL,
  question_id integer NOT NULL,
  FOREIGN KEY(person_id) REFERENCES person(person_id),
  FOREIGN KEY(question_id) REFERENCES question(question_id)
);
CREATE INDEX answer_idx_person_id ON answer (person_id);
CREATE INDEX answer_idx_question_id ON answer (question_id);
COMMIT