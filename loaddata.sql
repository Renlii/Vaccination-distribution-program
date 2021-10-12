-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!


INSERT INTO Category VALUES 
('Health Workers', 1)
,('Elderly', 1)
,('Teachers', 2)
,('Children', 2)
,('Essential Service', 3)
,('Others', 4)
;

INSERT INTO Person VALUES 
('10000XY', 'Jane Doe', 'Female','J2S3A7', '37 st.Cross', 'Montreal', DATE '1995-01-06', '519-981-3272', 'Health Workers')
,('10001XY', 'Lindy Marris', 'Female', 'Q3W4S6', '8 Sunbrook Center', 'Laval', DATE '1973-07-21', '135-520-9966', 'Teachers')
,('10002XY', 'Ty Ganter', 'Male', 'S2W7A3', '12 Anhalt Trail', 'Lachine', DATE '1946-04-23', '532-515-1265', 'Elderly')
,('10003XY', 'Alexi Gorelli', 'Male', 'H4S3S8', '3 Chive Street', 'Montreal', DATE '1989-09-07', '513-627-9662', 'Essential Service')
,('10004XY', 'Kath Orvis', 'Female', 'S4A7W1', '58 Lawn Plaza', 'Laval', DATE '1999-07-31', '151-408-1252', 'Others')
,('10005XY', 'Ricky Owens', 'Male', 'Y3W4A7', '943 Forest Circle', 'Brossard', DATE '2018-04-01', '152-458-3134', 'Children')
,('10006XY', 'John Lawren', 'Male', 'T2S3A6', '523 Green Field', 'Montreal', DATE '1988-02-21', '176-334-6521', 'Others')
,('10007XY', 'Audrey Green', 'Female', 'H2A9S7', '31 Long Street', 'Lachine', DATE '1997-12-26', '123-548-2542', 'Health Workers')
;

INSERT INTO VaccineLocation VALUES
('Montreal hospital', 'G4D2S6', '135 st.Catherine', 'Montreal')
,('Aboriginal hospital', 'H3E4S6', '2nd Crossing', 'Laval')
,('Federal hospital', 'H3S4A7', '519 Dennis Hill', 'Montreal')
,('Happy hospital', 'J1S3W7', '412 rue Dennis', 'Brossard')
,('Jewish General', 'S5G2A9', '123 st.John', 'Montreal')
,('Sunshine Clinique', 'J1Q3S8', '19 Oakridge Park', 'Brossard')
,('PC Pharmacy', 'S5D7Q1', '62 Chive Hill', 'Laval')
;

INSERT INTO Vaccine VALUES
('PfizerBioNTech', 2, 30)
,('Moderna', 2, 30)
;

INSERT INTO Batch VALUES
('PfizerBioNTech', 'PB001', 2, DATE '2020-09-30', DATE '2021-09-30', 'Montreal hospital')
,('PfizerBioNTech', 'PB002', 2, DATE '2021-01-03', DATE '2022-01-03', 'Aboriginal hospital')
,('PfizerBioNTech', 'PB003', 2, DATE '2021-02-11', DATE '2022-01-01', 'PC Pharmacy')
,('PfizerBioNTech', 'PB004', 2, DATE '2021-01-11', DATE '2022-01-11', 'Happy hospital')
,('PfizerBioNTech', 'PB005', 2, DATE '2021-02-19', DATE '2022-02-19', 'Jewish General')
,('Moderna', 'MO001', 2, DATE '2020-12-21', DATE '2021-12-21', 'Federal hospital')
,('Moderna', 'MO002', 2, DATE '2021-01-27', DATE '2022-01-27', 'Sunshine Clinique')
;

INSERT INTO Vials VALUES
('PfizerBioNTech', 'PB001', 'PVC0001')
,('PfizerBioNTech', 'PB001', 'PVC0002')
,('PfizerBioNTech', 'PB002', 'PVC0003')
,('PfizerBioNTech', 'PB002', 'PVC0004')
,('PfizerBioNTech', 'PB003', 'PVC0005')
,('PfizerBioNTech', 'PB003', 'PVC0006')
,('PfizerBioNTech', 'PB004', 'PVC0007')
,('PfizerBioNTech', 'PB004', 'PVC0008')
,('PfizerBioNTech', 'PB005', 'PVC0009')
,('PfizerBioNTech', 'PB005', 'PVC0010')
,('Moderna', 'MO001', 'MVC0011')
,('Moderna', 'MO001', 'MVC0012')
,('Moderna', 'MO002', 'MVC0013')
,('Moderna', 'MO002', 'MVC0014')
;

INSERT INTO Hospital VALUES
('Montreal hospital')
,('Aboriginal hospital')
,('Federal hospital')
,('Happy hospital')
,('Jewish General')
;

INSERT INTO Nurse VALUES
('CN00001', 'Carl Duerdin', 'Montreal hospital')
,('CN00002', 'Kristel Leys', 'Aboriginal hospital')
,('CN00003', 'Sally Hop', 'Federal hospital')
,('CN00004', 'Michel Hill', 'Happy hospital')
,('CN00005', 'Fey Celli', 'Jewish General')
;

INSERT INTO VaccDates VALUES
('Montreal hospital', DATE '2021-02-06')
,('Montreal hospital', DATE '2020-12-13')
,('Aboriginal hospital', DATE '2021-01-23')
,('PC Pharmacy', DATE '2021-01-02')
,('PC Pharmacy', DATE '2021-02-02')
,('Jewish General', DATE '2021-03-20')
,('Jewish General', DATE '2021-02-06')
,('Sunshine Clinique', DATE '2021-03-09')
,('Federal hospital', DATE '2021-01-12')
,('Federal hospital', DATE '2021-02-26')
;

INSERT INTO Slots VALUES
('S01', 'Montreal hospital', DATE '2021-02-06', '12:30', DATE '2021-01-02', '10000XY', 'CN00001', 'PfizerBioNTech', 'PB001', 'PVC0001')
,('S02', 'Montreal hospital', DATE '2020-12-13', '15:30', DATE '2021-01-01', '10002XY', 'CN00001', 'PfizerBioNTech', 'PB001', 'PVC0002')
,('S01', 'Aboriginal hospital', DATE '2021-01-23', '11:00', DATE '2020-11-01', '10002XY', 'CN00003', 'PfizerBioNTech','PB002', 'PVC0003' )
,('S01', 'PC Pharmacy', DATE '2021-01-02', '13:00', DATE '2020-12-15', '10003XY', 'CN00002', 'PfizerBioNTech', 'PB003', 'PVC0005')
,('S02', 'PC Pharmacy', DATE '2021-02-02', '15:00', NULL, NULL, NULL, NULL, NULL, NULL)
,('S01', 'Jewish General', DATE '2021-03-20', '10:30', NULL, NULL, NULL, NULL, NULL, NULL)
,('S02', 'Jewish General', DATE '2021-03-20', '13:30', NULL, NULL, NULL, NULL, NULL, NULL)
,('S01', 'Jewish General', DATE '2021-02-06', '19:30', DATE '2021-01-22', '10005XY', 'CN00004', 'PfizerBioNTech', 'PB005', 'PVC0009')
,('S01', 'Sunshine Clinique', DATE '2021-03-09', '09:00', DATE '2021-02-02', '10001XY', 'CN00005', 'Moderna', 'MO002', 'MVC0013')
,('S01', 'Federal hospital', DATE '2021-01-12', '18:30', DATE '2020-11-28', '10007XY', 'CN00002', 'Moderna', 'MO001', 'MVC0011')
,('S01', 'Federal hospital', DATE '2021-02-26', '13:00', DATE '2021-01-02', '10006XY', 'CN00003', 'Moderna', 'MO001', 'MVC0012')
;

INSERT INTO NurseAssignedTo (cnlicenseNum, vlName, vDate) VALUES
('CN00001', 'Montreal hospital', DATE '2020-12-13')
,('CN00001', 'Montreal hospital', DATE '2021-02-06')
,('CN00002', 'PC Pharmacy', DATE '2021-01-02')
,('CN00003', 'Aboriginal hospital', DATE '2021-01-23')
,('CN00004', 'Jewish General', DATE '2021-02-06')
,('CN00005', 'Sunshine Clinique', DATE '2021-03-09')
,('CN00002', 'Federal hospital', DATE '2021-01-12')
,('CN00003', 'Federal hospital', DATE '2021-02-26')
;
