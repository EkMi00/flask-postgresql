DROP TABLE IF EXISTS Bid CASCADE;
DROP TABLE IF EXISTS Availability CASCADE;
DROP TABLE IF EXISTS Pet CASCADE;
DROP TABLE IF EXISTS PetOwner CASCADE;
-- DROP TABLE IF EXISTS CareTaker CASCADE;
DROP TABLE IF EXISTS PetSitters CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE IF NOT EXISTS Users (
 username VARCHAR(64) PRIMARY KEY,
 email VARCHAR(64) UNIQUE NOT NULL,
 password VARCHAR(64) NOT NULL);

-- CREATE TABLE CareTaker (
--   uname     varchar(50) PRIMARY KEY REFERENCES Users (uname)
-- );

CREATE TABLE IF NOT EXISTS PetSitters (
  username VARCHAR(64) PRIMARY KEY REFERENCES Users (username),
  startDate DATE,
  endDate DATE,
  price NUMERIC NOT NULL,
  dog BOOLEAN NOT NULL DEFAULT FALSE,
  cat BOOLEAN NOT NULL DEFAULT FALSE,
  petBoarding BOOLEAN NOT NULL DEFAULT FALSE,
  dogWalking BOOLEAN NOT NULL DEFAULT FALSE,
  petGrooming BOOLEAN NOT NULL DEFAULT FALSE,
  petDaycare BOOLEAN NOT NULL DEFAULT FALSE,
  petSitting BOOLEAN NOT NULL DEFAULT FALSE,
  petTaxi BOOLEAN NOT NULL DEFAULT FALSE);

CREATE TABLE PetOwner (
  username     varchar(50) PRIMARY KEY REFERENCES Users (username)
);

CREATE TABLE Pet (
  username     varchar(50) REFERENCES PetOwner (username)
                        ON DELETE cascade,
  name      varchar(50),
  diet      varchar(20) NOT NULL,
  PRIMARY KEY (username, name)
);

CREATE TABLE Availability (
  username     varchar(50) REFERENCES PetSitters (username)
                        ON DELETE cascade,
  s_date    date,
  s_time    time,
  e_time    time,
  PRIMARY KEY (username, s_date, s_time, e_time)
);

CREATE TABLE Bid (
  pouname   varchar(50),
  name      varchar(50),
  ctuname   varchar(50),
  s_date    date,
  s_time    time,
  e_time    time,
  price     numeric NOT NULL,
  rating    integer CHECK ((rating IS NULL) OR (rating >= 0 AND rating <= 5)),
  FOREIGN KEY (pouname, name) REFERENCES Pet (username, name),
  FOREIGN KEY (ctuname, s_date, s_time, e_time) REFERENCES Availability (username, s_date, s_time, e_time),
  PRIMARY KEY (pouname, name, ctuname, s_date, s_time, e_time),
  CHECK (pouname <> ctuname)
);
