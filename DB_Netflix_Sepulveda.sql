
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

-- Insertando los datos para las tablas ya creadas.

-- Table user --

INSERT INTO netflix.user (name, email, password, phone) VALUES 
    ('Blaine', 'bzapateroa@scientificamerican.com', 'kD58107Vq*RLO', '870-695-8748'),
    ('Raviv', 'rbalineb@gnu.org', 'fJ442295u', '718-998-0244'),
    ('Ramsay', 'rlarnc@imdb.com', 'pR98776dzm>``_Oc', '707-594-2564'),
    ('Sonni', 'sfitzpatrickd@instagram.com', 'zE79566|31"KnFJ', '568-727-9245'),
    ('Valentine', 'vgeale@dedecms.com', 'bU65522ufPw$C', '976-997-3240'),
    ('Anna-maria', 'ahabbijamf@usnews.com', 'fJ51427`Xb', '366-187-0415'),
    ('Otes', 'odemariag@admin.ch', 'zL00342UhbdD', '966-584-4964'),
    ('Matthus', 'matkinsonh@google.com.br', 'hZ13438+bKf~STPk', '497-854-8561'),
    ('Ilse', 'iavrahamovi@goo.gl', 'hV35115ylD<''', '442-743-7089'),
    ('Ardelia', 'aovanesianj@livejournal.com', 'lG92482pq', '644-373-9842'),
    ('Noni', 'noakeshottk@spiegel.de', 'fU51288rr%uF>yB', '100-152-8918'),
    ('Gualterio', 'gkippingl@cyberchimps.com', 'uO09992p', '312-340-7369'),
    ('Yves', 'ywhistancem@ft.com', 'aQ96750\%WPYE&Mm', '700-618-5326'),
    ('Vincenty', 'vtakisn@ehow.com', 'tE74414QvBP{,DfX', '330-633-2767'),
    ('Edd', 'ewoodfineo@diigo.com', 'qL28060OEtkMGp', '409-597-2728'),
    ('Lorilyn', 'lgianolinip@woothemes.com', 'oW55710#.j/AuKtY', '644-910-3836'),
    ('Jacquelynn', 'jlouisetq@sphinn.com', 'uH81683I2%%+#2Kn', '806-651-3859'),
    ('Kelli', 'kferreyr@amazonaws.com', 'qK25726sWX9cxE', '358-769-2222'),
    ('Farlee', 'frevels@elegantthemes.com', 'qX53925#ztxT(2', '450-227-8277'),
    ('Fons', 'fcarnockt@loc.gov', 'kM60353{HDB>c', '867-746-2928'),
    ('Allyce', 'agollandu@vk.com', 'cN61411lu>8s.h@', '498-990-5890'),
    ('Roxie', 'rglazebrookv@dmoz.org', 'dW32115''(?', '390-951-9538'),
    ('Harley', 'hpiechew@mozilla.org', 'wS08888<%<\{/!', '870-832-4890'),
    ('Roxana', 'reliesx@360.cn', 'nY76740zrJb+l', '995-453-5124'),
    ('Gwendolyn', 'gdahlgreny@desdev.cn', 'tB77080K,', '232-635-7359'),
    ('Marcy', 'mkohnz@shareasale.com', 'aF82027Sf.g|v\v', '923-872-0996'),
    ('Peadar', 'pilyunin10@quantcast.com', 'cF84500f2\0tHqt+', '250-956-2183'),
    ('Rob', 'rbockmaster11@microsoft.com', 'wM83676C4l)0<', '111-922-0982'),
    ('Stephen', 'spoytheras12@mediafire.com', 'uD80393ll!=,U~', '776-103-7453'),
    ('Carla', 'cspohr13@blog.com', 'bY13625}9', '161-335-5776'),
    ('Gus', 'gstockhill14@hc360.com', 'eO258033', '587-770-8063'),
    ('Cyb', 'cstainson15@eventbrite.com', 'kQ70613i(qlo?z{', '732-909-0224'),
    ('Saundra', 'slowerson16@virginia.edu', 'eI78423ZnNM<tN', '246-199-6539'),
    ('Jameson', 'jjupp17@nba.com', 'oA81748m?KEh', '297-693-3034'),
    ('Chuck', 'cburchnall18@etsy.com', 'fT87048a=', '187-662-6772'),
    ('Loretta', 'lcurnnok19@ihg.com', 'aV55973wUxUXmH/', '787-694-6963'),
    ('Jacquenetta', 'jgrunbaum1a@whitehouse.gov', 'vS29295<}."52', '719-868-3256'),
    ('Angy', 'acrotty1b@w3.org', 'hL28225t', '690-393-1249'),
    ('Lisetta', 'lbrisard1c@time.com', 'eR86472vGDAD''iZ', '103-206-5554'),
    ('Paulie', 'ponions1d@google.nl', 'aV13112/1{V', '528-118-5896'),
    ('Addie', 'aaveyard0@istockphoto.com', 'joaCXB238+T)', '285-759-8304'),
    ('Tomkin', 'tcanniffe1@tiny.cc', 'ceqZAR113%ojU*Sd', '133-371-2125'),
    ('Nydia', 'ndurban3@icio.us', 'izlUIJ826Qe+', '938-797-2119'),
	('Dicky', 'drobbert4@gov.uk', 'ophBLL684{', '429-291-2374'),
	('Ibrahim', 'iolivi5@auda.org.au', 'aidGRH537=/5$!u', '848-825-2039'),
	('Meade', 'mpedican6@bluehost.com', 'ukiJFV164$Qies&', '426-250-7027'),
	('Pietrek', 'poffa7@mediafire.com', 'ewtGJL911hum', '749-319-5423'),
	('Maude', 'mbonevant8@cmu.edu', 'yhxWRG763', '460-912-1950'),
	('Gwenni', 'gbloggett9@google.com', 'dyyFGO704!iQ,', '578-238-1081'),
    ('Domenico', 'dlupartoo@yellowpages.com', 'whoZUG464)~.s/+D', '666-911-0769');

-- Table genre --

INSERT INTO netflix.genre (genre_name) VALUES
    ('Action|Comedy|Drama'),
    ('Comedy|War'),
    ('Comedy|Western'),
    ('Horror|Mystery|Thriller'),
    ('Drama'),
    ('Drama'),
    ('Documentary'),
    ('Drama|Mystery'),
    ('Action|Comedy|Romance'),
    ('Action'),
    ('Comedy'),
    ('Drama'),
    ('Horror'),
    ('Documentary'),
    ('Children|Fantasy|Musical'),
    ('Action|Adventure|Drama'),
    ('Action|Crime|Thriller'),
    ('Drama|War'),
    ('Horror'),
    ('Action|Animation|Sci-Fi'),
    ('Comedy|Romance'),
    ('Fantasy|Horror|Mystery|Thriller'),
    ('Action|Comedy|Crime'),
    ('Comedy'),
    ('Comedy'),
    ('War'),
    ('Horror'),
    ('Action|Sci-Fi'),
    ('Comedy|Drama|Romance'),
    ('Horror|Thriller'),
    ('Crime|Drama|Thriller'),
    ('Drama'),
    ('Animation|Children|Comedy'),
    ('Comedy|Romance'),
    ('Action|Horror|Mystery'),
    ('Drama'),
    ('Comedy|Drama|Mystery|Thriller'),
    ('Action|Crime|Drama'),
    ('Comedy|Drama'),
    ('Drama|Romance'),
    ('Comedy'),
    ('Comedy'),
    ('Drama|Thriller'),
    ('Drama|War'),
    ('Comedy'),
    ('Children'),
    ('Comedy'),
    ('Action|Drama|War'),
    ('Horror|Thriller'),
    ('Documentary');

-- Table actor --

INSERT INTO netflix.actor (first_name, last_name, birthdate, genre) VALUES
    ('Ulick', 'Leah', '1981-08-08', 'Male'),
    ('Gavra', 'MacGillivrie', '2004-10-07', 'Female'),
    ('Niccolo', 'Djurisic', '1992-05-15', 'Genderqueer'),
    ('Willy', 'Youell', '1998-12-13', 'Male'),
    ('Bruce', 'Giorgioni', '1997-11-05', 'Male'),
    ('Jorge', 'Gecks', '2002-06-17', 'Male'),
    ('Edie', 'Greatham', '1987-08-27', 'Female'),
    ('Kipper', 'Brundill', '1995-01-30', 'Male'),
    ('Megen', 'De Francisci', '1996-10-20', 'Female'),
    ('Maggi', 'Satford', '2005-05-31', 'Genderqueer'),
    ('Cherilyn', 'Dawks', '1994-10-11', 'Female'),
    ('Donny', 'Blunsom', '1983-03-17', 'Male'),
    ('Rosella', 'Milazzo', '1998-09-17', 'Female'),
    ('Magdalena', 'Kynder', '1995-04-23', 'Agender'),
    ('Monique', 'Vinton', '1984-11-19', 'Female'),
    ('Reinhold', 'Burl', '2001-01-11', 'Male'),
    ('Renate', 'Kunath', '1983-05-31', 'Female'),
    ('Bobbette', 'Lawman', '2000-12-13', 'Female'),
    ('Dulcea', 'Trenholm', '1997-10-17', 'Female'),
    ('Kenton', 'Dillow', '1987-06-30', 'Male'),
    ('Gino', 'Lawful', '1997-04-13', 'Bigender'),
    ('Glennie', 'Falloon', '2000-04-14', 'Female'),
    ('Stella', 'Marages', '2004-10-14', 'Female'),
    ('Geneva', 'Harte', '1990-11-05', 'Female'),
    ('Tamera', 'Stanes', '1994-03-12', 'Female'),
    ('Con', 'Melwall', '1999-01-17', 'Male'),
    ('Isaak', 'Shawl', '1984-01-31', 'Male'),
    ('Arlyn', 'Samwaye', '1999-05-14', 'Female'),
    ('Yuma', 'Henfre', '1982-06-13', 'Genderfluid'),
    ('Nadya', 'Crandon', '1999-10-14', 'Female'),
    ('Shane', 'Sambells', '1985-07-05', 'Female'),
    ('Jess', 'Jones', '1987-04-07', 'Female'),
    ('Benedict', 'Wyrill', '1981-10-06', 'Male'),
    ('Cad', 'Hadleigh', '1995-01-30', 'Male'),
    ('Evey', 'Ayling', '1981-07-22', 'Female'),
    ('Kerri', 'Kield', '1995-05-16', 'Female'),
    ('Shanie', 'Sinncock', '2002-05-19', 'Female'),
    ('Alfreda', 'Meeron', '1989-01-27', 'Female'),
    ('Sheila-kathryn', 'Skamal', '2004-09-24', 'Female'),
    ('Michail', 'Fittall', '2000-06-08', 'Male'),
    ('Jeromy', 'Terrett', '1981-01-10', 'Male'),
    ('Skye', 'Elgram', '1983-06-25', 'Male'),
    ('Ambrosius', 'Daniel', '1985-08-19', 'Male'),
    ('Trula', 'Gillmore', '1992-12-19', 'Female'),
    ('Traver', 'Maplethorpe', '2001-08-09', 'Genderfluid'),
    ('Jaclyn', 'Deares', '1985-11-22', 'Genderqueer'),
    ('Torr', 'Monck', '1999-11-15', 'Male'),
    ('Ardath', 'Ashleigh', '2003-03-30', 'Female'),
    ('Florenza', 'Emery', '2004-11-15', 'Female'),
    ('Thane', 'Ivel', '1981-02-20', 'Male');

-- Table movies --

INSERT INTO netflix.movies (title, release_year, rating_value) VALUES
    ('Shape of Things, The', 2010, 9.3),
    ('Haunted Mansion, The', 2011, 6.5),
    ('Failan', 2007, 3.5),
    ('Warlock: The Armageddon', 1993, 4.7),
    ('Waterloo Bridge', 1996, 0.5),
    ('Sunnyside', 2009, 4.8),
    ('T-Rex: Back to the Cretaceous', 1984, 5.5),
    ('Escape Plan', 1990, 9.5),
    ('Story of G.I. Joe', 2002, 0.4),
    ('Of Mice and Men', 2000, 2.0),
    ('Attila (Attila Flagello di Dio)', 1994, 7.3),
    ('Day in the Country, A (Partie de campagne)', 1989, 5.7),
    ('Groundstar Conspiracy, The', 2012, 9.3),
    ('Gambler, The', 2004, 2.2),
    ('1991: The Year Punk Broke', 2011, 7.6),
    ('Nine Dead', 1997, 4.4),
    ('Vibes', 1991, 9.5),
    ('Lightning in a Bottle', 1967, 5.4),
    ('Dark Girls', 2010, 4.9),
    ('Boys Life', 2003, 6.3),
    ('Sebastian Maniscalco: The movie', 2002, 3.4),
    ('Break-Up, The', 2010, 1.1),
    ('Cheaper by the Dozen 2', 2007, 4.8),
    ('Green Lantern: First Flight', 2012, 0.3),
    ('Terry Fator: Live from Las Vegas', 2006, 5.5),
    ('Mega Shark vs. Crocosaurus', 2006, 4.9),
    ('About a Boy', 2007, 1.4),
    ('Wake Up, Ron Burgundy', 1993, 6.8),
    ('Lebanon, Pa.', 2001, 7.3),
    ('Voyager (Homo Faber)', 1989, 5.7),
    ('Chisum', 2012, 9.9),
    ('Sex of Angels', 1992, 0.2),
    ('SLC Punk!', 1993, 7.1),
    ('Naked Killer (Chik loh go yeung)', 2009, 5.4),
    ('Aakrosh', 1993, 8.3),
    ('Two Lovers', 1996, 2.3),
    ('Executive Suite', 2011, 0.5),
    ('Oliver Twist', 2008, 9.1),
    ('Cheyenne Autumn', 2001, 9.7),
    ('Nights and Weekends', 1995, 1.3),
    ('Babar The Movie', 1992, 9.9),
    ('Curse, The (a.k.a. The Farm)', 1989, 2.7),
    ('Winter Light (Nattvardsgästerna)', 2002, 2.2),
    ('Wizards', 2004, 6.3),
    ('Halloween 4: The Return of Michael Myers', 1999, 1.2),
    ('Tora-san''s Rise and Fall', 2010, 0.2),
    ('Dog''s Life, A', 1990, 0.4),
    ('Stoked: The Rise and Fall of Gator', 2012, 9.4),
    ('Winnie the Pooh and the Blustery Day', 2012, 6.7),
    ('Return to Snowy River', 2009, 8.0);


-- Table director --

INSERT INTO netflix.director (first_name, last_name) VALUES
    ('Gusta', 'Guess'),
    ('Dwight', 'O''Cullinane'),
    ('Jaquenette', 'Lush'),
    ('Tate', 'Cubitt'),
    ('Dew', 'Pedrozzi'),
    ('Laurel', 'Orehead'),
    ('Sylvan', 'Montes'),
    ('Esme', 'Gonzalez'),
    ('Caitlin', 'Kerswell'),
    ('Mahmoud', 'Saffin'),
    ('Teddie', 'Dawtre'),
    ('Faith', 'Severn'),
    ('Sofia', 'Swendell'),
    ('Kendra', 'Crossthwaite'),
    ('Al', 'Wiltsher'),
    ('Rutherford', 'Collicott'),
    ('Kylynn', 'Gluyas'),
    ('Weider', 'Tinkham'),
    ('Abbot', 'De Fries'),
    ('Audrie', 'Minchell'),
    ('Estevan', 'Lakeman'),
    ('Keen', 'Ferrant'),
    ('Corrina', 'Kippen'),
    ('Brandyn', 'Kacheller'),
    ('Farley', 'Perring'),
    ('Eimile', 'Lake'),
    ('Feliks', 'Atchly'),
    ('Austin', 'Lomasney'),
    ('Callie', 'Flemming'),
    ('Benedicta', 'Petrashov'),
    ('Clayson', 'Quarry'),
    ('Thedrick', 'Ferre'),
    ('Amabel', 'Phinnessy'),
    ('Shea', 'Scoble'),
    ('Annadiane', 'Tupie'),
    ('Bekki', 'Nuton'),
    ('Aveline', 'Guidotti'),
    ('Merry', 'Johansson'),
    ('Brandyn', 'Faich'),
    ('Buiron', 'Domeney'),
    ('Guntar', 'Grayshon'),
    ('Bartholomeo', 'Stoney'),
    ('Cornie', 'Agott'),
    ('Emmit', 'Camerati'),
    ('Kissie', 'Draaisma'),
    ('Cristi', 'O''Doireidh'),
    ('Jamey', 'Jakoub'),
    ('Herminia', 'Pranger'),
    ('Burton', 'Lourens'),
    ('Kelly', 'Overstall');

-- Table address --

INSERT INTO netflix.address (id_user, streetaddr1, city, state, postal_code) VALUES
    (1, '4906 Kinsman Junction', 'Skutskär', 'Uppsala', '814 41'),
    (2, '8996 Forest Run Pass', 'Barbacoas', 'Asia', '57821'),
    (3, '78 Morningstar Circle', 'Shuangmiao', 'Asia', '408398'),
    (4, '41083 Debs Avenue', 'Krasnyye Barrikady', 'Asia', '416357'),
    (5, '8 Badeau Way', 'Teófilo Otoni', 'Asia', '39800-000'),
    (6, '313 Clemons Crossing', 'Plumbangan', 'Asia', '16361'),
    (7, '0 Holmberg Court', 'Kasulu', 'Asia', '90837'),
    (8, '857 3rd Circle', 'Asahi', 'Asia', '989-2474'),
    (9, '858 Everett Way', 'Lin’an', 'Asia', '17352'),
    (10, '44 Kim Drive', 'Jönköping', 'Jönköping', '551 21'),
    (11, '93 Buhler Street', 'Gunajaya', 'Asia', '364381'),
    (12, '21360 Raven Trail', 'Tangkolo', 'Asia', '45738945'),
    (13, '9 Doe Crossing Road', 'Cotaparaco', 'Asia', '5879549'),
    (14, '46 High Crossing Road', 'Kwakoa', 'Asia', '4686479'),
    (15, '716 Lakeland Lane', 'Changtu', 'Asia', '8696'),
    (16, '125 Ryan Center', 'Shuangjing', 'Asia', '45737'),
    (17, '778 Cascade Trail', 'Changhe', 'Asia', '46356'),
    (18, '551 Service Alley', 'Mulanay', 'Asia', '4312'),
    (19, '14 Algoma Junction', 'Santa Catalina - Dique Lujan', 'Asia', '1623'),
    (20, '4 Huxley Hill', 'Castanheira do Campo', 'Coimbra', '3025-511'),
    (21, '64 Golf Parkway', 'Conduaga', 'Asia', '1084'),
    (22, '4 Tennessee Court', 'Cubará', 'Asia', '151427'),
    (23, '27 Northport Park', 'San Antonio', 'Asia', '4503'),
    (24, '02 Monica Center', 'Semampirbarat', 'Asia', '484785'),
    (25, '68 Loftsgordon Avenue', 'San Antonio', 'Texas', '78215'),
    (26, '9 Gulseth Terrace', 'Puerto Rico', 'Europe', '503068'),
    (27, '43041 Pine View Way', 'Mogi das Cruzes', 'Europe', '69110-000'),
    (28, '28754 Vahlen Avenue', 'Nanhu', 'Europe', '584985'),
    (29, '04 Becker Avenue', 'Gardanne', 'Provence-Alpes-Côte d''Azur', '13548 CEDEX'),
    (30, '6 Warrior Parkway', 'Berlin', 'Berlin', '10715'),
    (31, '225 Dryden Alley', 'Waajid', 'Europe', '907473'),
    (32, '96648 Corry Lane', 'Portela', 'Viseu', '4690-300'),
    (33, '0 Linden Pass', 'Jamao al Norte', 'Europe', '10131'),
    (34, '13848 6th Center', 'Shuangqiao', 'Europe', '38463'),
    (35, '1 Kim Pass', 'Gaocheng', 'Europe', '2363562'),
    (36, '04 Village Green Plaza', 'Mahekou', 'Europe', '74828'),
    (37, '4414 Darwin Terrace', 'Rasskazovo', 'Europe', '301288'),
    (38, '3 Red Cloud Place', 'Road Town', 'Europe', '09472'),
    (39, '0 Sauthoff Road', 'Baishigou', 'Europe', '45734 4'),
    (40, '27 Glendale Avenue', 'Petřvald', 'Europe', '735 41'),
    (41, '0 Bartelt Way', 'Wanrongjiang', 'Europe', 'Europe'),
    (42, '4 Randy Road', 'São Pedro da Aldeia', 'Europe', '28940-000'),
    (43, '45733 Wayridge Alley', 'Urozhaynoye', 'Europe', '361215'),
    (44, '8618 Charing Cross Place', 'La Concordia', 'Europe', '9843 43'),
    (45, '16407 Garrison Drive', 'Perovo', 'Europe', '453002'),
    (46, '0 Eagle Crest Circle', 'Sandyford', 'Europe', 'D04'),
    (47, '8 Oneill Point', 'Rosmalen', 'Provincie Noord-Brabant', '5244'),
    (48, '1585 Sunfield Street', 'Bennäs', 'Europe', '02701'),
    (49, '4471 Spaight Parkway', 'Doug An', 'Europe', '487093'),
    (50, '90 Transport Court', 'Skoghall', 'Värmland', '663 30');

-- Table account --

INSERT INTO netflix.account (id_user, register_date, genres) VALUES
    (1, '2013-06-26', 'Female'),
    (2, '2023-03-13', 'Male'),
    (3, '2015-06-04', 'Female'),
    (4, '2011-08-11', 'Female'),
    (5, '2013-02-01', 'Male'),
    (6, '2019-11-12', 'Female'),
    (7, '2019-01-22', 'Male'),
    (8, '2022-10-27', 'Male'),
    (9, '2015-04-06', 'Female'),
    (10, '2016-07-23', 'Female'),
    (11, '2019-12-30', 'Female'),
    (12, '2012-10-08', 'Female'),
    (13, '2010-07-05', 'Male'),
    (14, '2022-10-02', 'Female'),
    (15, '2016-03-07', 'Female'),
    (16, '2014-04-20', 'Male'),
    (17, '2017-10-18', 'Male'),
    (18, '2022-01-04', 'Male'),
    (19, '2015-10-07', 'Male'),
    (20, '2019-02-21', 'Male'),
    (21, '2022-06-20', 'Male'),
    (22, '2016-02-18', 'Female'),
    (23, '2015-03-13', 'Female'),
    (24, '2017-05-31', 'Female'),
    (25, '2012-08-01', 'Male'),
    (26, '2020-05-27', 'Female'),
    (27, '2017-09-15', 'Polygender'),
    (28, '2017-11-18', 'Female'),
    (29, '2020-08-02', 'Male'),
    (30, '2015-04-19', 'Genderfluid'),
    (31, '2014-12-13', 'Female'),
    (32, '2018-06-25', 'Female'),
    (33, '2016-04-11', 'Male'),
    (34, '2022-11-24', 'Male'),
    (35, '2018-02-10', 'Male'),
    (36, '2014-04-15', 'Female'),
    (37, '2017-09-22', 'Female'),
    (38, '2017-03-26', 'Non-binary'),
    (39, '2018-03-16', 'Female'),
    (40, '2022-09-13', 'Female'),
    (41, '2010-07-06', 'Male'),
    (42, '2016-01-07', 'Female'),
    (43, '2023-05-28', 'Male'),
    (44, '2011-04-20', 'Female'),
    (45, '2022-07-31', 'Male'),
    (46, '2017-09-26', 'Male'),
    (47, '2019-01-07', 'Female'),
    (48, '2012-07-06', 'Male'),
    (49, '2011-04-12', 'Male'),
    (50, '2010-11-21', 'Male');

-- Table subscription --

INSERT INTO netflix.subscription (id_user, num_sub, month, year) VALUES
    (1, 1,'Marzo' , 2005),
    (2, 2,'Diciembre' ,2007),
    (3, 3,'Agosto' ,2009),
    (4, 4,'Junio' ,2010),
    (5, 5,'Febrero' ,2006),
    (6, 6,'Noviembre' ,1987),
    (7, 7,'Abril' ,2008),
    (8, 8,'Julio' ,1993),
    (9, 9,'Septiembre' ,2002),
    (10, 10,'Enero' ,2000),
    (11, 11,'Mayo' ,2008),
    (12, 12,'Octubre' ,2006),
    (13, 13,'Febrero' ,2008),
    (14, 14,'Agosto' ,2005),
    (15, 15,'Junio' ,1993),
    (16, 16,'Diciembre' ,1992),
    (17, 17,'Julio' ,1993),
    (18, 18,'Abril' ,1999),
    (19, 19,'Marzo' ,1994),
    (20, 20,'Noviembre' ,1997),
    (21, 21,'Septiembre' ,1998),
    (22, 22,'Mayo' ,1992),
    (23, 23,'Octubre' ,1995),
    (24, 24,'Enero' ,1993),
    (25, 25,'Febrero' ,2003),
    (26, 26,'Agosto' ,1989),
    (27, 27,'Noviembre' ,2003),
    (28, 28,'Diciembre' ,1998),
    (29, 29,'Abril' ,2000),
    (30, 30,'Junio' ,1993),
    (31, 31,'Marzo' ,2004),
    (32, 32,'Julio' ,1993),
    (33, 33,'Septiembre' ,2001),
    (34, 34,'Octubre' ,1994),
    (35, 35,'Enero' ,1999),
    (36, 36,'Mayo' ,2013),
    (37, 37,'Febrero' ,1983),
    (38, 38,'Noviembre' ,2013),
    (39, 39,'Agosto' ,2001),
    (40, 40,'Marzo' ,2004),
    (41, 41,'Diciembre' ,2012),
    (42, 42,'Abril' ,2009),
    (43, 43,'Junio' ,1993),
    (44, 44,'Julio' ,1995),
    (45, 45,'Septiembre' ,1984),
    (46, 46,'Octubre' ,2013),
    (47, 47,'Enero' ,1977),
    (48, 48,'Febrero' ,1994),
    (49, 49,'Noviembre' ,2006),
    (50, 50,'Mayo' ,2004);
    
-- Table streaming_plan --

INSERT INTO netflix.streaming_plan (id_user, description, pricepermonth) VALUES
    (1, 'netflix plan 123', '18.67'),
    (2, 'netflix plan 123', '10.33'),
    (3, 'netflix plan 123', '19.63'),
    (4, 'netflix plan 123', '11.97'),
    (5, 'netflix plan 123', '14.90'),
    (6, 'netflix plan 123', '11.55'),
    (7, 'netflix plan 123', '17.92'),
    (8, 'netflix plan 123', '9.48'),
    (9, 'netflix plan 123', '18.04'),
    (10, 'netflix plan 123', '9.14'),
    (11, 'netflix plan 123', '19.50'),
    (12, 'netflix plan 123', '12.72'),
    (13, 'netflix plan 123', '18.02'),
    (14, 'netflix plan 123', '14.45'),
    (15, 'netflix plan 123', '13.92'),
    (16, 'netflix plan 123', '15.05'),
    (17, 'netflix plan 123', '13.04'),
    (18, 'netflix plan 123', '17.44'),
    (19, 'netflix plan 123', '18.39'),
    (20, 'netflix plan 123', '12.05'),
    (21, 'netflix plan 123', '17.32'),
    (22, 'netflix plan 123', '12.07'),
    (23, 'netflix plan 123', '9.34'),
    (24, 'netflix plan 123', '15.03'),
    (25, 'netflix plan 123', '17.35'),
    (26, 'netflix plan 123', '15.86'),
    (27, 'netflix plan 123', '17.30'),
    (28, 'netflix plan 123', '16.78'),
    (29, 'netflix plan 123', '15.80'),
    (30, 'netflix plan 123', '15.36'),
    (31, 'netflix plan 123', '15.48'),
    (32, 'netflix plan 123', '14.63'),
    (33, 'netflix plan 123', '11.02'),
    (34, 'netflix plan 123', '17.97'),
    (35, 'netflix plan 123', '17.40'),
    (36, 'netflix plan 123', '12.38'),
    (37, 'netflix plan 123', '13.11'),
    (38, 'netflix plan 123', '14.52'),
    (39, 'netflix plan 123', '12.25'),
    (40, 'netflix plan 123', '18.97'),
    (41, 'netflix plan 123', '16.58'),
    (42, 'netflix plan 123', '13.95'),
    (43, 'netflix plan 123', '9.02'),
    (44, 'netflix plan 123', '12.36'),
    (45, 'netflix plan 123', '12.25'),
    (46, 'netflix plan 123', '10.34'),
    (47, 'netflix plan 123', '18.48'),
    (48, 'netflix plan 123', '12.20'),
    (49, 'netflix plan 123', '17.50'),
    (50, 'netflix plan 123', '16.67');
    
INSERT INTO netflix.credit_card (id_card, card_number, cvc, expiration_date) VALUES
	 (1, '560225810601302', 681, '2037-06-22'),
	 (2, '35547438210898', 293, '2032-06-29'),
	 (3, '3718913472226', 758, '2033-09-14'),
	 (4, '63840337208359', 889, '2033-10-09'),
	 (5, '63048516512190', 736, '2037-06-17'),
	 (6, '35741233264485', 507, '2034-05-18'),
	 (7, '35384557550435', 670, '2036-01-20'),
	 (8, '676713452367493', 155, '2038-04-09'),
	 (9, '35383142260903', 710, '2039-09-01'),
	 (10, '63847795802039', 640, '2034-01-31'),
	 (11, '54309312220090', 399, '2035-05-12'),
	 (12, '56022462290312', 431, '2039-01-06'),
	 (13, '56022102361135', 784, '2036-12-24'),
	 (14, '67718511376723', 405, '2033-01-23'),
	 (15, '44053972669647', 804, '2031-08-21'),
	 (16, '54269012020963', 395, '2035-12-30'),
	 (17, '63046046064183', 376, '2032-05-16'),
	 (18, '35854971393544', 229, '2040-02-07'),
	 (19, '35522425915736', 987, '2036-03-11'),
	 (20, '51087533031508', 355, '2040-06-12'),
	 (21, '35886996825592', 945, '2037-12-23'),
	 (22, '35372696940106', 526, '2033-05-20'),
	 (23, '6761823282730', 439, '2040-02-07'),
	 (24, '56106607377641', 961, '2039-12-24'),
	 (25, '67619349445092', 278, '2035-10-11'),
	 (26, '35646249542961', 759, '2033-03-23'),
	 (27, '63863687538120', 276, '2035-03-02'),
	 (28, '35870258204212', 950, '2033-05-21'),
	 (29, '35588653858330', 246, '2033-04-17'),
	 (30, '35299660251784', 302, '2032-07-11'),
	 (31, '35899009990311', 635, '2038-06-17'),
	 (32, '35601704854681', 420, '2031-07-12'),
	 (33, '35841972316088', 349, '2039-08-09'),
	 (34, '490305422406820', 903, '2037-06-05'),
	 (35, '63311030308628', 750, '2031-03-30'),
	 (36, '676312961367175', 126, '2036-07-02'),
	 (37, '56022128704676', 803, '2037-04-27'),
	 (38, '5893236273499163', 677, '2034-01-07'),
	 (39, '50184488364843', 723, '2030-08-24'),
	 (40, '35448432094237', 973, '2039-11-13'),
	 (41, '35496463758318', 742, '2033-07-23'),
	 (42, '3414437209595', 663, '2034-12-09'),
	 (43, '670964321614192', 881, '2031-08-29'),
	 (44, '589355473075182', 438, '2030-10-27'),
	 (45, '35608704867028', 609, '2040-02-05'),
	 (46, '50076627869081', 666, '2031-07-05'),
	 (47, '35735521441318', 180, '2033-07-29'),
	 (48, '35856791807147', 642, '2039-04-21'),
	 (49, '675924485130772', 489, '2040-04-09'),
	 (50, '41750087304358', 109, '2039-02-28');
     
INSERT INTO netflix.gift_card (id_gift_card, code) VALUES
     (1, '75909-100'),
	 (2, '10812-442'),
	 (3, '61958-0101'),
	 (4, '55316-249'),
	 (5, '59726-360'),
	 (6, '10819-7002'),
	 (7, '0615-7606'),
	 (8, '41250-535'),
	 (9, '45014-152'),
	 (10, '49288-0646'),
	 (11, '43742-0456'),
	 (12, '36800-484'),
	 (13, '11822-0340'),
	 (14, '66993-060'),
	 (15, '55319-194'),
	 (16, '16714-339'),
	 (17, '57955-0015'),
	 (18, '11822-0300'),
	 (19, '59667-0099'),
	 (20, '43063-242'),
	 (21, '30142-313'),
	 (22, '55154-5686'),
	 (23, '64578-0092'),
	 (24, '39822-2010'),
	 (25, '43269-837'),
	 (26, '43857-0247'),
	 (27, '68788-9042'),
	 (28, '41167-0053'),
	 (29, '58411-182'),
	 (30, '66993-902'),
	 (31, '55111-556'),
	 (32, '50006-100'),
	 (33, '45802-106'),
	 (34, '36987-2795'),
	 (35, '42291-899'),
	 (36, '21130-002'),
	 (37, '59676-566'),
	 (38, '63433-803'),
	 (39, '54458-894'),
	 (40, '43269-692'),
	 (41, '55714-8013'),
	 (42, '52810-102'),
	 (43, '13668-107'),
	 (44, '55714-8005'),
	 (45, '50242-090'),
	 (46, '23155-195'),
	 (47, '57520-0795'),
	 (48, '63029-602'),
	 (49, '0941-0427'),
	 (50, '0145-0091');
     
INSERT INTO netflix.payment_method (id, pay_type, card_type) VALUES 
	 (1, 'Credit Card', 'jcb'),
	 (2, 'Bank Transfer', 'laser'),
	 (3, 'Bank Transfer', 'mastercard'),
	 (4, 'Credit Card', 'switch'),
	 (5, 'Credit Card', 'switch'),
	 (6, 'Apple Pay', 'bankcard'),
	 (7, 'Bank Transfer', 'diners-club-carte-blanche'),
	 (8, 'Bank Transfer', 'switch'),
	 (9, 'Bank Transfer', 'jcb'),
	 (10, 'Apple Pay', 'jcb'),
	 (11, 'PayPal', 'jcb'),
	 (12, 'Bank Transfer', 'diners-club-carte-blanche'),
	 (13, 'Bank Transfer', 'americanexpress'),
	 (14, 'Google Pay', 'mastercard'),
	 (15, 'Apple Pay', 'jcb'),
	 (16, 'Apple Pay', 'americanexpress'),
	 (17, 'Bank Transfer', 'switch'),
	 (18, 'Apple Pay', 'mastercard'),
	 (19, 'Apple Pay', 'diners-club-enroute'),
	 (20, 'Credit Card', 'jcb'),
	 (21, 'Apple Pay', 'jcb'),
	 (22, 'Apple Pay', 'visa-electron'),
	 (23, 'Bank Transfer', 'jcb'),
	 (24, 'Credit Card', 'instapayment'),
	 (25, 'PayPal', 'jcb'),
	 (26, 'Credit Card', 'jcb'),
	 (27, 'Bank Transfer', 'diners-club-carte-blanche'),
	 (28, 'PayPal', 'jcb'),
	 (29, 'PayPal', 'jcb'),
	 (30, 'Google Pay', 'china-unionpay'),
	 (31, 'Apple Pay', 'visa-electron'),
	 (32, 'Apple Pay', 'diners-club-enroute'),
	 (33, 'Apple Pay', 'jcb'),
	 (34, 'Credit Card', 'mastercard'),
	 (35, 'Apple Pay', 'jcb'),
	 (36, 'Bank Transfer', 'switch'),
	 (37, 'Credit Card', 'visa'),
	 (38, 'Google Pay', 'jcb'),
	 (39, 'Bank Transfer', 'jcb'),
	 (40, 'PayPal', 'switch'),
	 (41, 'Apple Pay', 'mastercard'),
	 (42, 'Credit Card', 'jcb'),
	 (43, 'Google Pay', 'diners-club-carte-blanche'),
	 (44, 'Apple Pay', 'switch'),
	 (45, 'Credit Card', 'diners-club-enroute'),
	 (46, 'Google Pay', 'jcb'),
	 (47, 'Apple Pay', 'switch'),
	 (48, 'Google Pay', 'diners-club-enroute'),
	 (49, 'Apple Pay', 'jcb'),
	 (50, 'Apple Pay', 'china-unionpay');


-- CONSULTAS SIMPLES

-- Selecciono todos los nombres y los emails de los usuarios en donde contengan el texto 'an' en cualquier parte 
USE netflix;

SELECT
	name
    , email
FROM user
WHERE email OR name LIKE '%an%';


-- Selecciono todos los generos y los orderno de la Z a la A
USE netflix;

SELECT
	genre_name
FROM genre
ORDER BY genre_name DESC;



	
	
	
	
















