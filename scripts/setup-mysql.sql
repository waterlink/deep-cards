CREATE DATABASE IF NOT EXISTS deepcards_development;
CREATE DATABASE IF NOT EXISTS deepcards_test;
CREATE USER IF NOT EXISTS 'deepcards'@'localhost' IDENTIFIED BY 'deepcards';
GRANT ALL PRIVILEGES ON deepcards_development.* TO 'deepcards'@'localhost';
GRANT ALL PRIVILEGES ON deepcards_test.* TO 'deepcards'@'localhost';
