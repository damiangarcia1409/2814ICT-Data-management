CREATE DATABASE CTSDBs5098442;
USE CTSDBs5098442;

CREATE TABLE DRIVER (
	DriverLicenceNum	VARCHAR(18),
	DriverFirstName	VARCHAR(20),
	DriverLastName	VARCHAR(20),
	ClearanceLevel	CHAR(1),
	IsAvailable	CHAR(1),
	PRIMARY KEY (DriverLicenceNum)
)ENGINE=InnoDB;

CREATE TABLE VEHICLE (
	VIN	CHAR(17),
	VEH_Make	VARCHAR(30),
	VEH_Model	VARCHAR(30),
	VEH_Colour	VARCHAR(20),
	VEH_RegoNum	CHAR(6),
	VEH_Odometer	INT(6),
	VEH_Availability	CHAR(1),
	VEH_SeatCapacity	INT(2),
	PRIMARY KEY (VIN)
);

CREATE TABLE LANGUAGE (
	LanguageCode	CHAR(2),
	LanguageName	VARCHAR(50),
	PRIMARY KEY (LanguageCode)
);

CREATE TABLE COUNTRY (
	CountryCode	CHAR(2),
	CountryName	VARCHAR(50),
	PRIMARY KEY (CountryCode)
);

CREATE TABLE LOCATION_TYPE (
	LocTypeID	CHAR(2),
	LocTypeDescription	VARCHAR(40),
	PRIMARY KEY (LocTypeID)
);

CREATE TABLE OFFICIAL_ROLE (
	RoleID	CHAR(2) PRIMARY KEY,
	RoleDescription	VARCHAR(40)
);

CREATE TABLE LOCATION (
	LocationID	INT,
	StreetNo	VARCHAR(5),
	StreetName	VARCHAR(50),
	City	VARCHAR(40),
	LocTypeID	CHAR(2),
	PRIMARY KEY (LocationID),
	FOREIGN KEY (LocTypeID) REFERENCES LOCATION_TYPE(LocTypeID)
);

CREATE TABLE COUNTRY_LANGUAGE (
	CountryCode	CHAR(2),
	LanguageCode	CHAR(2),
	PRIMARY KEY (CountryCode, LanguageCode),
	FOREIGN KEY (CountryCode) REFERENCES COUNTRY(CountryCode),
	FOREIGN KEY (LanguageCode) REFERENCES LANGUAGE(LanguageCode)
);

CREATE TABLE DRIVER_LANGUAGE (
	LanguageCode	CHAR(2),
	DriverLicenceNum	VARCHAR(18),
	PRIMARY KEY (LanguageCode, DriverLicenceNum),
	FOREIGN KEY (LanguageCode) REFERENCES LANGUAGE(LanguageCode),
	FOREIGN KEY (DriverLicenceNum) REFERENCES DRIVER(DriverLicenceNum)
);

CREATE TABLE MAINTENANCE_REPAIR (
	VIN	CHAR(17),
	OdometerReading	INT(6),
	MR_Type	CHAR(1),
	MR_Date	DATE,
	MR_Cost	DECIMAL,
	MR_Details	VARCHAR(100),
	PRIMARY KEY (VIN, OdometerReading),
	FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
);

CREATE TABLE OFFICIAL (
	OfficialID	CHAR(8),
	LanguageCode	CHAR(2),
	CountryCode	CHAR(2),
	OfficialFirstName	VARCHAR(40),
	OfficialLastName	VARCHAR(40),
	OfficialRole	CHAR(2),
	PRIMARY KEY (OfficialID),
	FOREIGN KEY (LanguageCode) REFERENCES LANGUAGE(LanguageCode),
	FOREIGN KEY (CountryCode) REFERENCES COUNTRY(CountryCode),
	FOREIGN KEY (OfficialRole) REFERENCES OFFICIAL_ROLE(RoleID)
);

CREATE TABLE TRIP (
	BookingRefNum	INT AUTO_INCREMENT,
	VIN	CHAR(17),
	DriverLicenceNum	VARCHAR(18),
	OfficialID	CHAR(8),
	PickUpLocID	INT,
	DropOffLocID	INT,
	StartTimeIntended	DATETIME,
	EndTimeIntended	DATETIME,
	StartTimeActual	DATETIME,
	EndTimeActual	DATETIME,
	StartOdometerKM	INT(6),
	EndOdometerKM	INT(6),
	PRIMARY KEY (BookingRefNum),
	FOREIGN KEY (Vin) REFERENCES VEHICLE(Vin),
	FOREIGN KEY (DriverLicenceNum) REFERENCES DRIVER(DriverLicenceNum),
	FOREIGN KEY (OfficialID) REFERENCES OFFICIAL(OfficialID),
	FOREIGN KEY (PickUpLocID) REFERENCES LOCATION(LocationID),
	FOREIGN KEY (DropOffLocID) REFERENCES LOCATION(LocationID)
);