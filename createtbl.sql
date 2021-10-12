-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE Category
(
	cname VARCHAR(20) NOT NULL,
	prioNum INTEGER,
	PRIMARY KEY(cname)
);

CREATE TABLE Person
(
	hinsurNum VARCHAR(50) NOT NULL,
	pName VARCHAR(30) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	pPostalCode VARCHAR(10),
	pStreetAddr VARCHAR(50),
	pCity VARCHAR(10),
	birthday DATE NOT NULL,
	phone VARCHAR(20),
	cname VARCHAR(20),
	PRIMARY KEY (hinsurNum),
	FOREIGN KEY (cname) REFERENCES Category
);

CREATE TABLE VaccineLocation
(
	vlName VARCHAR(30) NOT NULL,
	vPostalCode VARCHAR(10) NOT NULL,
	vStreetAddr VARCHAR(50) NOT NULL,
	vCity VARCHAR(10) NOT NULL,
	PRIMARY KEY (vlName)
);

CREATE TABLE Vaccine
(
	vName VARCHAR(20) NOT NULL,
	dose INTEGER NOT NULL,
	waitPeriod INTEGER NOT NULL,
	PRIMARY KEY (vName)
);

CREATE TABLE Batch
(
	vName VARCHAR(30) NOT NULL,
	batchNum VARCHAR(30) NOT NULL,
	numDoses INTEGER NOT NULL,
	manuDate DATE NOT NULL,
	expDate DATE NOT NULL,
	vlName VARCHAR(30),
	PRIMARY KEY (vName, batchNum),
	FOREIGN KEY (vlName) REFERENCES VaccineLocation,
	FOREIGN KEY (vName) REFERENCES Vaccine
);

CREATE TABLE Vials
(
	vName VARCHAR(30) NOT NULL,
	batchNum VARCHAR(30) NOT NULL,
	vialID VARCHAR(30) NOT NULL,
	PRIMARY KEY (vName, vialID, batchNum),
	FOREIGN KEY (vName, batchNum) REFERENCES Batch
);

CREATE TABLE Hospital
(
	vlName VARCHAR(30) NOT NULL,
	PRIMARY KEY (vlName),
	FOREIGN KEY (vlName) REFERENCES VaccineLocation
);

CREATE TABLE Nurse
(
	cnlicenseNum VARCHAR(50) NOT NULL,
	nName VARCHAR(30) NOT NULL,
	vlName VARCHAR(30),
	PRIMARY KEY (cnlicenseNum),
	FOREIGN KEY (vlName) REFERENCES Hospital
);

CREATE TABLE VaccDates
(
	vlName VARCHAR(30) NOT NULL,
	vDate DATE NOT NULL,
	PRIMARY KEY (vlName, vDate),
	FOREIGN KEY (vlName) REFERENCES VaccineLocation
);

CREATE TABLE Slots
(
	vSlot VARCHAR(10) NOT NULL,
	vlName VARCHAR(30) NOT NULL,
	vDate DATE NOT NULL,
	vTime VARCHAR(10) NOT NULL,
	asgndate DATE,
	hinsurnum VARCHAR(50),
	cnlicenseNum VARCHAR(50),
	vName VARCHAR(30),
	batchNum VARCHAR(30),
	vialID VARCHAR(30),
	PRIMARY KEY (vSlot, vlName, vDate, vTime),
	FOREIGN KEY (vlName, vDate) REFERENCES VaccDates,
	FOREIGN KEY (hinsurnum) REFERENCES Person,
	FOREIGN KEY (cnlicenseNum) REFERENCES Nurse,
	FOREIGN KEY (vName, vialID, batchNum) REFERENCES Vials
);

CREATE TABLE NurseAssignedTo
(
	cnlicenseNum VARCHAR(50) NOT NULL,
	vlName VARCHAR(30) NOT NULL,
	vDate DATE NOT NULL,
	PRIMARY KEY (cnlicenseNum, vlName, vDate),
	FOREIGN KEY (cnlicenseNum) REFERENCES Nurse,
	FOREIGN KEY (vlName, vDate) REFERENCES VaccDates
);
alter table Slots modify column asgndate date NULL;
alter table Slots modify column hinsurnum  VARCHAR(50) NULL;
alter table Slots modify column cnlicenseNum VARCHAR(50) NULL;
alter table Slots modify column vName VARCHAR(30) NULL;
alter table Slots modify column batchNum VARCHAR(30) NULL;
alter table Slots modify column vialID VARCHAR(30) NULL;
