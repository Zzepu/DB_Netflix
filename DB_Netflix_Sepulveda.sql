
-- Creacion de la base de datos con todas sus tablas.

-- DROP DATABASE netflix;

CREATE DATABASE netflix;

USE netflix;

CREATE TABLE IF NOT EXISTS netflix.user (
	id_user INT AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(16) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_user),
    INDEX (name, email)
);

CREATE TABLE IF NOT EXISTS netflix.genre (
	id_genre INT AUTO_INCREMENT,
    genre_name VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_genre)
);

CREATE TABLE IF NOT EXISTS netflix.actor (
	id_actor INT AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    birthdate DATE DEFAULT '9999-12-31' NOT NULL,
    genre VARCHAR (25) NOT NULL,
    PRIMARY KEY (id_actor)
);

CREATE TABLE IF NOT EXISTS netflix.movies (
	id_movies INT AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    release_year YEAR (4) NOT NULL,
    rating_value DECIMAL (2,1) NOT NULL,
    PRIMARY KEY (id_movies)
);

CREATE TABLE IF NOT EXISTS netflix.director (
	id_director INT AUTO_INCREMENT,
    first_name VARCHAR (25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_director)
);

CREATE TABLE IF NOT EXISTS netflix.movies_actors (
	id_movies_actors INT AUTO_INCREMENT,
    id_movies INT,
    id_actor INT,
    PRIMARY KEY (id_movies_actors),
    FOREIGN KEY (id_movies) REFERENCES movies (id_movies) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_actor) REFERENCES actor (id_actor) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.movies_director (
	id_movies_director INT AUTO_INCREMENT,
    id_movies INT,
    id_director INT,
    PRIMARY KEY (id_movies_director),
    FOREIGN KEY (id_movies) REFERENCES movies (id_movies) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_director) REFERENCES director (id_director) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.address (
	id_address INT AUTO_INCREMENT,
    id_user INT,
    streetaddr1 VARCHAR(200) NOT NULL,
    streetaddr2 TINYINT DEFAULT 1,
    city VARCHAR (200) NOT NULL,
    state VARCHAR (200) NOT NULL,
    postal_code VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_address),
    FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.account (
	id_account INT AUTO_INCREMENT,
    id_user INT,
    register_date DATETIME DEFAULT CURRENT_TIMESTAMP(),
    genres VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_account),
    FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.movies_genre (
	id_movies_genre INT AUTO_INCREMENT,
    id_movies INT,
    id_genre INT,
    PRIMARY KEY (id_movies_genre),
    FOREIGN KEY (id_movies) REFERENCES movies (id_movies) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_genre) REFERENCES genre (id_genre) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.subscription (
	id_subscription INT AUTO_INCREMENT,
    id_user INT,
    num_sub INT NOT NULL,
    month VARCHAR(25) NOT NULL,
    year YEAR (4) NOT NULL,
    PRIMARY KEY (id_subscription),
    FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.streaming_plan (
	id_strm_plan INT AUTO_INCREMENT,
    id_user INT,
    description VARCHAR (50) NOT NULL,
    pricepermonth DECIMAL (11,2) NOT NULL,
    PRIMARY KEY (id_strm_plan),
    FOREIGN KEY (id_user) REFERENCES user (id_user) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS netflix.credit_card (
	id_card INT NOT NULL AUTO_INCREMENT,
    card_number VARCHAR(16) NOT NULL,
    cvc VARCHAR(3) NOT NULL,
    expiration_date DATE DEFAULT '9999-12-31' NOT NULL,
    PRIMARY KEY(id_card)
);

CREATE TABLE IF NOT EXISTS netflix.gift_card (
	id_gift_card INT NOT NULL AUTO_INCREMENT,
    code VARCHAR(20) NOT NULL,
    PRIMARY KEY(id_gift_card)
);

CREATE TABLE IF NOT EXISTS netflix.payment_method (
	id INT NOT NULL AUTO_INCREMENT,
    pay_type VARCHAR(25) NOT NULL,
    card_type VARCHAR(25) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS netflix.log_payment (
	id_log INT NOT NULL AUTO_INCREMENT,
    card_number VARCHAR(16) NOT NULL,
    old_card_number VARCHAR(16) DEFAULT NULL,
    gift_card VARCHAR(20) NOT NULL,
    old_gift_card VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (id_log)
);


CREATE TABLE IF NOT EXISTS netflix.log_user (
	id_user INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    register_date DATETIME DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (id_user)
);






	
	
	
	
















