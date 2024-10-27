-- Create database
CREATE DATABASE IF NOT EXISTS Enotes;

-- Switch to the Enotes schema
USE Enotes;

-- Create the user table if it doesn't exist
CREATE TABLE IF NOT EXISTS user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create another table post if it doesn't exist
CREATE TABLE IF NOT EXISTS post (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL UNIQUE,
    date TIMESTAMP NULL DEFAULT now(),
    uid INT NOT NULL,
    PRIMARY KEY(id),
    INDEX uid_idx (uid ASC),
    CONSTRAINT uid
    FOREIGN KEY(uid)
    REFERENCES Enotes.user(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

