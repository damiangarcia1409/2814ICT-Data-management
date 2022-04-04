INSERT INTO LANGUAGE (LanguageCode, LanguageName) VALUES
('es', 'Spanish'),
('en', 'English');

INSERT INTO COUNTRY (CountryCode, CountryName) VALUES
('34', 'Spain');

INSERT INTO OFFICIAL_ROLE (RoleID, RoleDescription) VALUES
('JD', 'Judge');

INSERT INTO OFFICIAL (OfficialID, LanguageCode, CountryCode, OfficialFirstName, OfficialLastName, OfficialRole) VALUES
('SPN99710', 'es', '34', 'Daniel', 'Ortega', 'JD');

INSERT INTO LOCATION_TYPE (LocTypeID, LocTypeDescription) VALUES
('01', 'Pick up'),
('02', 'Drop off');

INSERT INTO LOCATION (LocationID, StreetNo, StreetName, City, LocTypeID) VALUES
('01', '16', 'Nielsens Rd', 'Gold Coast', '01'),
('02', '117', 'Pacific Avenue', 'Gold Coast', '02');

INSERT INTO VEHICLE (VIN, Veh_Make, VEH_Model, VEH_Colour, VEH_RegoNum, VEH_Odometer, VEH_Availability, VEH_SeatCapacity) VALUES
('SANFDAE11U1286116', 'Holden', 'Colorado', 'Blue', '113abd', '026982', 'Y', '05');

INSERT INTO DRIVER (DriverLicenceNum, DriverFirstName, DriverLastName, ClearanceLevel, IsAvailable) VALUES
('098674432', 'John', 'Arnold', '3', 'Y');

INSERT INTO DRIVER_LANGUAGE (LanguageCode, DriverLicenceNum) VALUES
('es', '098674432'),
('en', '098674432');

INSERT INTO TRIP (VIN, DriverLicenceNum, OfficialID, PickUpLocID, DropOffLocID, StartTimeIntended, EndTimeIntended, StartTimeActual, EndTimeActual, StartOdometerKM, EndOdometerKM) VALUES
('SANFDAE11U1286116', '098674432', 'SPN99710', '01', '02', '2018-04-09 10:00:00', '2018-04-09 10:45:00', '2018-04-09 10:15:00', '2018-04-09 11:55:00', '026982', '027119')
