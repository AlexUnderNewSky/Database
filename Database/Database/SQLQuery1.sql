CREATE TABLE Users (
AccountID INT NOT NULL,
Username NCHAR(16) NOT NULL,
"E-mail" NCHAR(20) NOT NULL,
Password NCHAR(20),
BirthDate DATE,
PhoneNumber NCHAR(15),
FirstName CHAR(20),
LastName CHAR(20)
CONSTRAINT UC_Users UNIQUE (BirthDate, FirstName, LastName, PhoneNumber, "E-mail"),
PRIMARY KEY (AccountID, Username)

);


CREATE TABLE Stream (
StreamID INT NOT NULL,
AccountID INT NOT NULL,
FOREIGN KEY (AccountID, Username) REFERENCES Users(AccountID, Username),
"Name" NCHAR(30) NOT NULL,
Username NCHAR(16) NOT NULL,
Description NCHAR(50),
Chat TEXT,
StreamCategory NCHAR(30),
StreamApp NCHAR(20)
CONSTRAINT UC_Stream UNIQUE (StreamID),
PRIMARY KEY (StreamID, Username, AccountID)
);


CREATE TABLE Chat (
AccountID INT NOT NULL,
Username NCHAR(16) NOT NULL,
FOREIGN KEY (AccountID, Username) REFERENCES Users(AccountID, Username),
Emotes IMAGE,
"Messages" TEXT,

PRIMARY KEY (Username, AccountID)
);

ALTER TABLE Stream
ADD CONSTRAINT UQ_Stream
UNIQUE (StreamID);

ALTER TABLE Stream
DROP CONSTRAINT UQ_Stream;


CREATE TABLE Subscription (
StreamID INT NOT NULL,
FOREIGN KEY (StreamID) REFERENCES Stream(StreamID),
AccountID INT NOT NULL,
Country CHAR(20),
CreditCardInfo NUMERIC(16) NOT NULL,
BirthDate DATE,
FirstName CHAR(20),
LastName CHAR(20),
PhoneNumber NCHAR(15),
"E-mail" NCHAR(20) NOT NULL,
FOREIGN KEY (AccountID, Username) REFERENCES Users(AccountID, Username),
FOREIGN KEY (BirthDate, FirstName, LastName, PhoneNumber, "E-mail") REFERENCES Users(BirthDate, FirstName, LastName, PhoneNumber, "E-mail"),

Username NCHAR(16) NOT NULL,

PRIMARY KEY (StreamID, AccountID)
);


CREATE TABLE Clip (
AccountID INT NOT NULL,
ClipName NCHAR(40) NOT NULL,
Username NCHAR(16) NOT NULL,
FOREIGN KEY (AccountID, Username) REFERENCES Users(AccountID, Username),
PRIMARY KEY (AccountID, ClipName)
);

CREATE TABLE Raid(
RaidStreamID INT NOT NULL PRIMARY KEY,
AccountID INT NOT NULL,
Username NCHAR(16) NOT NULL,
FOREIGN KEY (AccountID, Username) REFERENCES Users(AccountID, Username),
);
 
 
 
INSERT INTO Users(AccountID, Username, [E-mail], Password, BirthDate, PhoneNumber, FirstName, LastName) VALUES
('6', 'Natatem00', 'artyom2014@exmpl.com', 'Password1', '2000.08.20', '+4823564312', 'Artyom', 'Kotrus'),
('7', 'Flown', 'specOps@exmpl.com', 'JesterRest2', '2000.12.12', '+38023564312', 'Illya', 'Sheverdinkin'),
('8', 'Fenix_115', 'fenix_115@exmpl.com', '12zx12zx', '2000.06.28', '+380235643212', 'Stanislave', 'Shlyahovski'),
('9', 'Gri992S', 'Gri992S23@exmpl.com', 'Gr12992S', '2007.02.11', '+18235634312', 'Rocky', 'Paronius'),
('10', 'Lynch', 'Lynch@exmpl.com', 'Lynch225', '2003.11.27', '+55235625789', 'Harry', 'Dotter')



INSERT INTO Stream(StreamID, AccountID, Name, Username, Description, Chat, StreamCategory, StreamApp) VALUES 
('5', '7', 'CoDWarzone', 'Flown', 'Just Playing', '-', 'Games', 'SteamStream'),
('6', '6', 'Cooking', 'Natatem00', 'Trying to cook new dish', '+', 'Just Chatting', 'OBS'),
('7', '10', 'Magika 2', 'Lynch', 'Continue Magika 2', '+', 'Games', 'OBS'),
('8', '9', 'RepairBike', 'Gri992S', 'Repairing my old bike with my friends', '+', 'Just Chutting', 'StreamLabs')


INSERT INTO Chat(AccountID, Emotes, Messages, Username) VALUES
(6, 'IDK', 'How i can weight my d', 'Natatem00'),
(7, 'IDK', 'Do you like M4 in CoD Warzone2?', 'Flown'),
(8, 'IDK', 'Positive had sex with me', 'Fenix_115'),
(10, 'IDK', 'Where is the Igor?', 'Lynch')


INSERT INTO Subscription(AccountID, StreamID, Country, CreditCardInfo, BirthDate, FirstName, LastName, PhoneNumber, [E-mail], Username) VALUES 
(2, 5, 'United States', '4236522625653427', '1999-06-04', 'Boris', 'Lyarobski', '+359132125364', 'boris@example.com', 'BorisSenko'),
(10, 6, 'Germany', '2336523525653427', '2003-11-27', 'Harry', 'Dotter', '+55235625789', 'Lynch@exmpl.com', 'Lynch'),
(6, 6, 'Poland', '553652352562327', '2000-08-20', 'Artyom', 'Kotrus', '+4823564312', 'artyom2014@exmpl.com', 'Natatem00'),
(7, 2, 'Ukraine', '2536523525653682', '2000-12-12', 'Illya', 'Sheverdinkin', '+38023564312', 'specOps@exmpl.com', 'Flown'),
(8, 2, 'Ukraine', '423652352565587', '2000-06-28', 'Stanislave', 'Shlyahovski', '+380235643212', 'fenix_115@exmpl.com', 'Fenix_115'),
(9, 8, 'Albania', '2365235244753427', '2007-02-11', 'Rocky', 'Paronius', '+18235634312', 'Gri992S23@exmpl.com', 'Gri992S')



INSERT INTO Clip(AccountID, ClipName, Username)
VALUES (4, 'Music app and Stream app for free!', 'Johny3Tears')


INSERT INTO Raid(RaidStreamID, AccountID, Username)
VALUES (3, 5, 'deezer4life')


ALTER TABLE Stream
ALTER COLUMN Chat NCHAR(30);

--DELETE FROM Stream WHERE StreamID = 2;

SELECT * 
FROM Users;

SELECT * 
FROM Stream;

SELECT * 
FROM CHAT;

SELECT *
FROM Subscription

SELECT * 
FROM Clip;

SELECT * 
FROM Raid;
