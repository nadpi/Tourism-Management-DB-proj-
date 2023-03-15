CREATE TABLE Hotel (
 Hotel_Name varchar(30) NOT NULL,
 Hotel_Type varchar(20) NOT NULL,
 Country varchar(20), 
 City varchar(15) NOT NULL, 
 Address varchar(20) NOT NULL,
 Register_no number(5), 
 Rating number(2,1) NOT NULL,
 View_type varchar(15) NOT NULL,
 PRIMARY KEY (Country, Register_no)
);

BEGIN
INSERT INTO Hotel(Hotel_Name, hotel_type , country , city, address, register_no, rating, view_type)
VALUES ('Hilton', 'Chain Hotels', 'Egypt', 'Cairo', 'Zamalek NileCorniche', 1500,4.4,'Nile-View');

INSERT INTO Hotel(Hotel_Name, hotel_type , country , city, address, register_no, rating, view_type)
VALUES ('Ritz-Carlton', 'Chain Hotels', 'Indonesia', 'Kedewatan', 'Ayung River', 1566,5.0,'River View');

INSERT INTO Hotel(Hotel_Name, hotel_type , country , city, address, register_no, rating, view_type)
VALUES ('Four Seasons', 'Family Resort', 'Indonesia', 'Sayan', 'Ubud 80571', 1786,5.0,'Island View');

INSERT INTO Hotel(Hotel_Name, hotel_type , country , city, address, register_no, rating, view_type)
VALUES ('The Marker', 'Chain Hotels', 'Ireland', 'Dublin', 'Docklands Square', 1566,4.5,'City View');

INSERT INTO Hotel(Hotel_Name, hotel_type , country , city, address, register_no, rating, view_type)
VALUES ('Thompson Nashville', 'Boutique Hotel', 'U.S', 'Tennessee', '401 11th Ave. S', 8566,4.5,'City View');
COMMIT;
END;

CREATE TABLE Hotel_Phone(
 Hotel_RegisterNo number(5),
 Hotel_Country varchar(10),
 Phone_No number(11),
PRIMARY KEY(Phone_No,Hotel_RegisterNo,Hotel_Country )
);

ALTER TABLE Hotel_Phone
ADD Foreign Key (Hotel_RegisterNo,Hotel_Country )
References Hotel (Register_no,Country);

BEGIN
INSERT INTO Hotel_Phone(Hotel_RegisterNo, Hotel_Country , phone_no )
VALUES (1566,'Ireland',051372580);

INSERT INTO Hotel_Phone(Hotel_RegisterNo, Hotel_Country , phone_no )
VALUES (8566,'U.S',352334185);

INSERT INTO Hotel_Phone(Hotel_RegisterNo, Hotel_Country , phone_no )
VALUES (1786,'Indonesia',02157930978);

INSERT INTO Hotel_Phone(Hotel_RegisterNo, Hotel_Country , phone_no )
VALUES (1500,'Egypt',027486864);

INSERT INTO Hotel_Phone(Hotel_RegisterNo, Hotel_Country , phone_no )
VALUES (1566,'Indonesia',0622435659);
COMMIT;
END;

CREATE TABLE Room (
 Room_Type varchar(15) NOT NULL ,
 Reserved varchar(3)  NOT NULL,
 Capacity number(2)  NOT NULL,
 Room_No number(3) ,
 Hotel_RegisterNo number(5),
 Description varchar(30)  NOT NULL,
 Hotel_Country varchar(20) ,
 PRIMARY KEY(Room_No,Hotel_RegisterNo,Hotel_Country)
);

ALTER TABLE Room 
ADD FOREIGN KEY(Hotel_RegisterNo,Hotel_Country)
REFERENCES Hotel (Register_no,Country);

BEGIN
INSERT INTO Room(room_type, reserved, capacity, room_no, hotel_registerno, Description ,  Hotel_Country)
VALUES ('Family Suite', 'yes', 5,207, 8566, '1KingBed 2SingleBed 1SofaBed', 'U.S');

INSERT INTO Room(room_type, reserved, capacity, room_no, hotel_registerno, Description ,  Hotel_Country)
VALUES ('Couples Room', 'no', 2,187, 8566, '1 KingSizeBed', 'U.S');

INSERT INTO Room(room_type, reserved, capacity, room_no, hotel_registerno, Description ,  Hotel_Country)
VALUES ('Triple Room', 'yes', 3,457, 1566, '3 SingleBeds', 'Ireland');

INSERT INTO Room(room_type, reserved, capacity, room_no, hotel_registerno, Description ,  Hotel_Country)
VALUES ('Royal Suite', 'no', 5,247, 1566, '1KingSizeBed 3SingleBeds', 'Indonesia');

INSERT INTO Room(room_type, reserved, capacity, room_no, hotel_registerno, Description ,  Hotel_Country)
VALUES ('Single Room', 'no', 1,415, 1500, '1QueenBed', 'Egypt');
COMMIT;
END;

CREATE TABLE Travel_Packages (
  Packange_Name varchar(10)  NOT NULL,
  Package_ID number(3) , 
  Package_Type varchar(10)  NOT NULL, 
  Price number(5)  NOT NULL, 
  No_of_Members number(2)  NOT NULL,
  Destination varchar(15)  NOT NULL, 
  Package_Duration number(2)  NOT NULL,
  PRIMARY KEY(Package_ID)
);

create sequence Packid_seq
start with 100
increment by 5
maxvalue 300;

BEGIN
INSERT INTO travel_packages(package_id, packange_name, package_type, price, no_of_members, destination, Package_duration)
Values ( Packid_seq.nextval , 'FamilyDeal','Inclusive', 15000,5,'U.S', 15);

INSERT INTO travel_packages(package_id, packange_name, package_type, price, no_of_members, destination, Package_duration)
Values ( Packid_seq.nextval , 'Buddies','Inclusive', 9000,3,'Indonesia', 7);

INSERT INTO travel_packages(package_id, packange_name, package_type, price, no_of_members, destination, Package_duration)
Values ( Packid_seq.nextval , 'Couples','Inclusive', 7000,2,'Egypt', 20);

INSERT INTO travel_packages(package_id, packange_name, package_type, price, no_of_members, destination, Package_duration)
Values ( Packid_seq.nextval , 'HoneyMoon','Inclusive', 10000,2,'Indonesia', 10);

INSERT INTO travel_packages(package_id, packange_name, package_type, price, no_of_members, destination, Package_duration)
Values ( Packid_seq.nextval , 'BigFam','Inclusive', 19000,7,'U.S', 15);
COMMIT;
END;

CREATE TABLE Has_A (
 Hotel_RegisterNo number(5),
 PID number(3),
 Hotel_Country varchar(10),
PRIMARY KEY(PID,Hotel_RegisterNo,Hotel_Country)
);

ALTER TABLE Has_A 
ADD Foreign Key (Hotel_RegisterNo,Hotel_Country )
References Hotel (Register_no,Country);

ALTER TABLE Has_A 
ADD Foreign Key (PID)
References Travel_Packages (Package_ID);

BEGIN
INSERT INTO Has_A(Hotel_RegisterNo,PID,Hotel_Country)
VALUES(1566, 105 , 'Ireland');

INSERT INTO Has_A(Hotel_RegisterNo,PID,Hotel_Country)
VALUES(8566, 110 , 'U.S');

INSERT INTO Has_A(Hotel_RegisterNo,PID,Hotel_Country)
VALUES(1786, 115 , 'Indonesia');

INSERT INTO Has_A(Hotel_RegisterNo,PID,Hotel_Country)
VALUES(1500, 125 , 'Egypt');

INSERT INTO Has_A(Hotel_RegisterNo,PID,Hotel_Country)
VALUES(1566, 120 , 'Indonesia');
Commit;
End;

CREATE TABLE Employee (
 Emp_Name varchar(30) NOT NULL,
 Hire_year DATE NOT NULL,
 Email varchar(30) UNIQUE,
 Emp_SSN number(30) ,
 Salary number(10) NOT NULL, 
 Gender varchar(7) NOT NULL, 
 Job_Type varchar(13) NOT NULL, 
PRIMARY KEY(Emp_SSN)
 );
 
BEGIN 
INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Sara',DATE'2007-12-11','sara1@gmail.com',3170611134560,20000,'female','travel agent');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Mark',DATE'2006-7-7','mark2@gmail.com',3170611185433,2000,'male','travel agent');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Alice',DATE'2006-7-7','alice@gmail.com',3070611185655,40000,'female','travel agent');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Ahmed',DATE'2009-7-7','ahmed@gmail.com',3270611184655,40000,'male','travel agent');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Ali',DATE'2017-8-7','ali12@gmail.com',3370612185655,60000,'male','travel agent');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Mark',DATE'2010-11-1','mark11@gmail.com',3170611134561,10000,'male','tour guide');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Reem',DATE'2012-12-3','reem@gmail.com',3170611185432,30000,'female','tour guide');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('john',DATE'2008-11-11','john@gmail.com',3020729152348,20000,'male','tour guide');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Nada',DATE'2012-3-11','nada@gmail.com',2920729152347,40000,'female','tour guide');

INSERT INTO Employee( Emp_Name, Hire_year, Email, Emp_SSN, Salary, Gender, Job_Type)
VALUES ('Menna',DATE'2002-1-11','menna@gmail.com','282072915236',8000,'female','tour guide');
COMMIT;
END;


CREATE TABLE Customers(
 F_name varchar (15) NOT NULL , 
 L_name varchar (15) NOT NULL,
 Email varchar (20) UNIQUE,
 Customer_SSN number (30) PRIMARY KEY,
 Birth_date date NOT NULL, 
 Payment_info varchar (30) NOT NULL,
 Country varchar (20) NOT NULL,
 City varchar (15) NOT NULL,
 Street varchar (25) NOT NULL,
 Building_no number (4),
 PID number (3),
 ESSN number (30)
);

ALTER TABLE Customers
ADD Foreign Key (PID)
References Travel_Packages(Package_ID);

ALTER TABLE Customers
ADD Foreign Key (ESSN)
References Employee(Emp_SSN);

BEGIN
INSERT INTO Customers(F_name,L_name,Email,Customer_SSN,Birth_date,Payment_info,Country,City,Street,Building_no,PID,ESSN)
VALUES ('Alex','Smith','alex1@gmail.com',1234567650100,Date'1995-03-12','Credit Card','Denmark','Stockholm','University street',15,105,3170611134560);

INSERT INTO Customers (F_name,L_name,Email,Customer_SSN,Birth_date,Payment_info,Country,City,Street,Building_no,PID,ESSN)
VALUES ('Sara','Ali','sara2@yahoo.com',2986600271235,Date'2000-07-05','Debit Card','Egypt','Alexandria','Elbahr street',18,110,3170611185433);

INSERT INTO Customers (F_name,L_name,Email,Customer_SSN,Birth_date,Payment_info,Country,City,Street,Building_no,PID,ESSN)
VAlUES ('John','Lee','jlee@yahoo.com',123456123456,Date'1997-01-13','Cash','South Korea','Busan','123 Street',23,115,3370612185655);

INSERT INTO Customers (F_name,L_name,Email,Customer_SSN,Birth_date,Payment_info,Country,City,Street,Building_no,PID,ESSN)
VALUES ('Youssef','Alaa','joealaa122@gmail.com',308047278888,Date'1991-02-02','Credit Card','Jordon','Amman','Rainbow street',23,120,3170611134561);

INSERT INTO Customers (F_name,L_name,Email,Customer_SSN,Birth_date,Payment_info,Country,City,Street,Building_no,PID,ESSN)
VALUES ('Eyad','Ahmed','eyad@hotmail.com',3070631274480,Date'1980-10-09','Debit Card','Egypt','Cairo','233 Street',14,125,3270611184655);
COMMIT;
END;

CREATE TABLE Companions(
 Companion_name varchar (20) NOT NULL,
 CSSN number (30),
 Gender varchar (7) NOT NULL, 
 Birthdate date NOT NULL,
 Relationship varchar (12) NOT NULL,
PRIMARY KEY (Companion_name,CSSN)
);

ALTER TABLE Companions 
ADD Foreign Key (CSSN)
References CUSTOMERS(Customer_SSN);

BEGIN
INSERT INTO Companions(Companion_name,CSSN,Gender,Birthdate,Relationship)
VALUES('Mark',3070631274480,'male',Date'2010-02-11','Son');

INSERT INTO Companions(Companion_name,CSSN,Gender,Birthdate,Relationship)
VALUES('Sandra',3070631274480,'female',Date'2015-07-05','Daughter');

INSERT INTO Companions(Companion_name,CSSN,Gender,Birthdate,Relationship)
VALUES('Mazen',1234567650100,'male',Date'2013-09-15','Son');

INSERT INTO Companions(Companion_name,CSSN,Gender,Birthdate,Relationship)
VALUES('Yasmine',1234567650100,'female',Date'2017-8-8','Daughter');

INSERT INTO Companions(Companion_name,CSSN,Gender,Birthdate,Relationship)
VALUES('Zayn',123456123456,'male',Date'2012-10-27','Son');
COMMIT;
END;

CREATE TABLE Reservation (
 Reservation_ID number (3) PRIMARY KEY, 
 Payment_method varchar (15) NOT NULL,
 Cancellation_deadline date NOT NULL, 
 Trip_date date NOT NULL,
 Amount_paid number (5) NOT NULL, 
 Country varchar (20) NOT NULL,
 City varchar (15) NOT NULL, 
 CSSN number (30)
);

ALTER TABLE Reservation
ADD Foreign Key (CSSN)
References CUSTOMERS(Customer_SSN);

CREATE SEQUENCE res_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

BEGIN
INSERT INTO Reservation(Reservation_ID,Payment_method,Cancellation_deadline,Trip_date,Amount_paid,Country,City,CSSN)
VALUES(res_seq.nextval,'Credit Card',Date'2020-8-8',Date'2020-9-3',1500,'Canada','Toronto',3070631274480);

INSERT INTO Reservation(Reservation_ID,Payment_method,Cancellation_deadline,Trip_date,Amount_paid,Country,City,CSSN)
VALUES(res_seq.nextval,'Debit Card',Date'2020-6-12',Date'2020-7-27',10000,'UAE','Dubai',2986600271235);

INSERT INTO Reservation(Reservation_ID,Payment_method,Cancellation_deadline,Trip_date,Amount_paid,Country,City,CSSN)
VALUES(res_seq.nextval,'Cash',Date'2021-2-13',Date'2021-3-12',22500,'Australa','Sydney',308047278888);

INSERT INTO Reservation(Reservation_ID,Payment_method,Cancellation_deadline,Trip_date,Amount_paid,Country,City,CSSN)
VALUES(res_seq.nextval,'Credit Card',Date'2020-5-10',Date'2020-6-14',22500,'Mexico','Cancun',1234567650100);

INSERT INTO Reservation(Reservation_ID,Payment_method,Cancellation_deadline,Trip_date,Amount_paid,Country,City,CSSN)
VALUES(res_seq.nextval,'Cash',Date'2020-2-10',Date'2020-3-14',22500,'Amman','Jordon',123456123456);
COMMIT;
END;


CREATE TABLE Customer_phone_no(
 CSSN number (30),
 Phone_number number (25),
PRIMARY KEY (CSSN,Phone_number)
);

ALTER TABLE Customer_phone_no
ADD Foreign Key (CSSN)
References CUSTOMERS(Customer_SSN);

BEGIN
INSERT INTO Customer_phone_no
VALUES (3070631274480,20108650329);

INSERT INTO Customer_phone_no
VALUES (3070631274480,20125409865);

INSERT INTO Customer_phone_no
VALUES (2986600271235,31678912345);

INSERT INTO Customer_phone_no
VALUES (308047278888,966546088403);

INSERT INTO Customer_phone_no
VALUES (1234567650100,4155552671);
COMMIT;
END;

CREATE TABLE Transportation(
 Trans_Type varchar(20) NOT NULL, 
 Capacity number(5) NOT NULL,
 License_Plate varchar(20) PRIMARY KEY,
 PID number(3),
 isFull varchar(5) NOT NULL
);

ALTER TABLE Transportation
ADD Foreign Key (PID)
References Travel_Packages(Package_ID);

BEGIN
INSERT INTO Transportation
VALUES ('Bus',15,'BPWM-1875',110,'Yes');

INSERT INTO Transportation
VALUES ('Bus',35,'6TRJ244',105,'Yes');

INSERT INTO Transportation
VALUES ('Plane',164,'AAA000',105,'No');

INSERT INTO Transportation
VALUES ('Ship',5000,'BB5951',125,'Yes');

INSERT INTO Transportation
VALUES ('Ship',7850,'BB0700',120,'No');
COMMIT;
END;

CREATE TABLE tour_name(
tourname varchar(40) UNIQUE NOT NULL
);

BEGIN
INSERT INTO tour_name
VALUES('Pyramids Tour');

INSERT INTO tour_name
VALUES('Nile Tour');

INSERT INTO tour_name
VALUES('City Sightseeing');

INSERT INTO tour_name
VALUES('The Landmark Tour');

INSERT INTO tour_name
VALUES('RollerCoaster Tour');
COMMIT;
END;


CREATE TABLE Tours(
 No_of_attendees number(2) NOT NULL,
 Tour_Name varchar(40) REFERENCES tour_name(tourname),
 Price_Per_Person number(5) NOT NULL,
 Country varchar(20) NOT NULL,
 City varchar(15) NOT NULL,
 PID number(3),
PRIMARY KEY (Tour_Name,PID)
);

ALTER TABLE Tours
ADD Foreign Key (PID)
REFERENCES Travel_Packages(Package_ID);

BEGIN
INSERT INTO Tours
VALUES (10,'Nile Tour',2500,'Egypt','Cairo',105);

INSERT INTO Tours
VALUES (50,'RollerCoaster Tour',350,'Japan','Tokyo',105);

INSERT INTO Tours
VALUES (40,'Pyramids Tour',1000,'Egypt','Giza',120);

INSERT INTO Tours
VALUES (25,'City Sightseeing',500,'England','London',110);

INSERT INTO Tours
VALUES (60,'Nile Tour',2000,'Egypt','Cairo',125);
COMMIT;
END;

CREATE TABLE Sites(
 Tname varchar(40) ,
 PID number(3),
 Site varchar(30),
PRIMARY KEY (Tname,PID,Site)
);

ALTER TABLE Sites
ADD Foreign Key (Tname)
REFERENCES tour_name (tourname);

ALTER TABLE Sites
ADD Foreign Key (PID)
REFERENCES Travel_Packages(Package_ID);

BEGIN
INSERT INTO Sites
VALUES ('Nile Tour',105,'Nile River');

INSERT INTO Sites
VALUES ('RollerCoaster Tour',105,'Tokyo DisneyLand');

INSERT INTO Sites
VALUES ('Pyramids Tour',120,'The Pyramids');

INSERT INTO Sites
VALUES ('City Sightseeing',110,'London');

INSERT INTO Sites
VALUES ('The Landmark Tour',120,'Riyadh');
COMMIT;
END;

CREATE TABLE T_DepartTimes(
 T_LicensePlate varchar(20),
 Departures_Times date,
PRIMARY KEY(T_LicensePlate,Departures_Times)
);

ALTER TABLE T_DepartTimes
ADD Foreign Key (T_LicensePlate)
REFERENCES Transportation(License_Plate);

BEGIN
INSERT INTO T_DepartTimes
VALUES ('BPWM-1875',DATE'2022-07-11');

INSERT INTO T_DepartTimes
VALUES ('6TRJ244',DATE'2023-01-1');

INSERT INTO T_DepartTimes
VALUES ('AAA000',DATE'2022-11-20');

INSERT INTO T_DepartTimes
VALUES ('BB5951',DATE'2022-12-12');

INSERT INTO T_DepartTimes
VALUES ('BB0700',DATE'2022-09-05');
COMMIT;
END;

CREATE TABLE Contains(
 Tname varchar(40),
 PID number(3),
Primary Key(Tname,PID)
);

ALTER TABLE Contains
ADD Foreign Key (Tname)
REFERENCES tour_name(tourname);

ALTER TABLE Contains
ADD Foreign Key (PID)
REFERENCES Travel_Packages(Package_ID);

BEGIN
INSERT INTO Contains
VALUES ('Nile Tour',105);

INSERT INTO Contains
VALUES ('Nile Tour',110);

INSERT INTO Contains
VALUES ('The Landmark Tour',120);

INSERT INTO Contains
VALUES ('City Sightseeing',110);

INSERT INTO Contains
VALUES ('Pyramids Tour',120);
COMMIT;
END;

CREATE TABLE Travel_Agent (
 ESSN number(30),
 country varchar(20) NOT NULL,
PRIMARY KEY(ESSN)
);

ALTER TABLE Travel_Agent 
ADD FOREIGN KEY(ESSN)
REFERENCES Employee(Emp_SSN);

BEGIN 
INSERT INTO Travel_Agent(ESSN, country)
VALUES (3170611134560,'France');

INSERT INTO Travel_Agent(ESSN, country)
VALUES (3170611185433,'France');

INSERT INTO Travel_Agent(ESSN, country)
VALUES (3070611185655,'Italy');

INSERT INTO Travel_Agent(ESSN, country)
VALUES (3270611184655,'Egypt');

INSERT INTO Travel_Agent(ESSN, country)
VALUES (3370612185655,'Egypt');
COMMIT;
END;

CREATE TABLE Tour_Guide (
 ESSN number(30),
 No_of_trips_done number(2) NOT NULL,
 R_City varchar(15) NOT NULL,
 R_Country varchar(20) NOT NULL,
PRIMARY KEY(ESSN)
);
 
ALTER TABLE Tour_Guide
ADD FOREIGN KEY(ESSN)
REFERENCES Employee(Emp_SSN);

BEGIN 
INSERT INTO Tour_Guide (ESSN , No_of_trips_done, R_City, R_Country)
VALUES (3020729152348,10,'Cairo','Egypt');

INSERT INTO Tour_Guide (ESSN , No_of_trips_done, R_City, R_Country)
VALUES (3170611134561,20,'Rome','Italy');

INSERT INTO Tour_Guide (ESSN , No_of_trips_done, R_City, R_Country)
VALUES (3170611185432,30,'Paris','France');

INSERT INTO Tour_Guide (ESSN , No_of_trips_done, R_City, R_Country)
VALUES (2920729152347,10,'Giza','Egypt');

INSERT INTO Tour_Guide (ESSN , No_of_trips_done, R_City, R_Country)
VALUES (282072915236,26,'Rome','Italy');
COMMIT;
END;

CREATE TABLE Guides (
 ESSN number(30),
 CSSN number(30),
 Hours number(2) NOT NULL,
PRIMARY KEY(ESSN,CSSN)
);
 
ALTER TABLE Guides
ADD FOREIGN KEY(ESSN)
REFERENCES Employee(Emp_SSN);

ALTER TABLE Guides
ADD FOREIGN KEY(CSSN)
REFERENCES Customers(Customer_SSN);

BEGIN 
INSERT INTO Guides (ESSN, CSSN, Hours)
VALUES (3020729152348,3070631274480,8);

INSERT INTO Guides (ESSN, CSSN, Hours)
VALUES (3170611134561,2986600271235,6);

INSERT INTO Guides (ESSN, CSSN, Hours)
VALUES (3170611185432,308047278888,9);

INSERT INTO Guides (ESSN, CSSN, Hours)
VALUES (2920729152347,1234567650100,10);

INSERT INTO Guides (ESSN, CSSN, Hours)
VALUES (282072915236,123456123456,7);
COMMIT;
END;

CREATE TABLE TG_Destinations (
 ESSN number(30),
 Country varchar(20),
 City varchar(15),
PRIMARY KEY(ESSN,Country,City)
);

ALTER TABLE TG_Destinations
ADD FOREIGN KEY(ESSN)
REFERENCES Employee(Emp_SSN);

BEGIN
INSERT INTO TG_Destinations ( ESSN, Country, City)
VALUES (3020729152348,'Brazil','Rio');

INSERT INTO TG_Destinations ( ESSN, Country, City)
VALUES (3170611134561,'Netherlands','Amsterdam');

INSERT INTO TG_Destinations ( ESSN, Country, City)
VALUES (3170611185432,'South Korea','Seoul');

INSERT INTO TG_Destinations ( ESSN, Country, City)
VALUES (2920729152347,'Japan','Tokoyo');

INSERT INTO TG_Destinations ( ESSN, Country, City)
VALUES (282072915236,'Egypt','Alexandria');
COMMIT;
END;

CREATE TABLE TG_Schedule(
 Emp_SSN number(30),
 Schedule date, 
PRIMARY KEY(Emp_SSN,Schedule)
);

ALTER TABLE TG_Schedule
ADD FOREIGN KEY(Emp_SSN)
REFERENCES Employee(Emp_SSN);

BEGIN
INSERT INTO TG_Schedule
VALUES(3170611134561,DATE'2023-01-01');

INSERT INTO TG_Schedule
VALUES(3170611185432,DATE'2023-09-3');

INSERT INTO TG_Schedule
VALUES(3020729152348,DATE'2023-06-4');

INSERT INTO TG_Schedule
VALUES(2920729152347, DATE'2023-07-6');

INSERT INTO TG_Schedule
VALUES(282072915236, DATE'2023-11-7');
COMMIT;
END;

CREATE TABLE E_Languages(
Emp_SSN number(30),
Languages varchar(15), 
PRIMARY KEY (Emp_SSN,Languages)
);

ALTER TABLE E_Languages
ADD FOREIGN KEY(Emp_SSN)
REFERENCES Employee(Emp_SSN);

Begin
INSERT INTO E_Languages
VALUES(3170611134560,'English');

INSERT INTO E_Languages
VALUES(3170611185433,'English');

INSERT INTO E_Languages
VALUES(3070611185655,'English');

INSERT INTO E_Languages
VALUES(3270611184655,'Arabic');

INSERT INTO E_Languages
VALUES(3370612185655,'English');

INSERT INTO E_Languages
VALUES(3170611134561,'Russian');

INSERT INTO E_Languages
Values(3170611185432,'Spanish');

INSERT INTO E_Languages
VALUES(3020729152348,'Japanese');

INSERT INTO E_Languages
VALUES(2920729152347,'Japanese');

INSERT INTO E_Languages
VALUES(282072915236,'Korean');
COMMIT;
END;


CREATE TABLE E_PhoneNo(
Emp_SSN number(30),
PhoneNo varchar(15), 
PRIMARY KEY(Emp_SSN,PhoneNo)
);

ALTER TABLE E_PhoneNo
ADD FOREIGN KEY(Emp_SSN)
REFERENCES Employee(Emp_SSN);

Begin
INSERT INTO E_PhoneNo
VALUES(3170611134560,01123456789);

INSERT INTO E_PhoneNo
VALUES(3170611185433,01223456789);

INSERT INTO E_PhoneNo
VALUES(3070611185655,01123456786);

INSERT INTO E_PhoneNo
VALUES(3270611184655,01523456776);

INSERT INTO E_PhoneNo
VALUES(3370612185655,01023786789);

INSERT INTO E_PhoneNo
VALUES(3170611134561,01523756765);

INSERT INTO E_PhoneNo
VALUES(3170611185432,01223346789);

INSERT INTO E_PhoneNo
VALUES(3020729152348,01023456654);

INSERT INTO E_PhoneNo
VALUES(2920729152347,01023459989);

INSERT INTO E_PhoneNo
VALUES(282072915236,01523456123);
COMMIT;
END;


CREATE TABLE Dependents(
Emp_SSN number(30),
DName varchar(10),
Gender varchar(1) NOT NULL,
Birthdate date NOT NULL,
Relationship varchar(15) NOT NULL,
PRIMARY KEY(Emp_SSN,DName)
);

ALTER TABLE Dependents
ADD FOREIGN KEY(Emp_SSN)
REFERENCES Employee(Emp_SSN);

BEGIN
INSERT INTO Dependents
VALUES(282072915236,'Ahmed','M',Date'1999-02-6','Spouse');

INSERT INTO Dependents
VALUES(282072915236,'Mera','F',Date'2020-09-4','Daughter');

INSERT INTO Dependents
VALUES(2920729152347,'Mohamed','M',Date'1998-07-22','Spouse');

INSERT INTO Dependents
VALUES(3170611185433,'Linda','F',Date'1976-06-01','Spouse');

INSERT INTO Dependents
VALUES(3070611185655,'Marcus','M', DATE'1996-04-01','Spouse');
COMMIT;
END;


CREATE TABLE Offer(
Emp_SSN number(30),
PID number(3),
PRIMARY KEY(Emp_SSN,PID)
);

Alter Table Offer
ADD FOREIGN KEY(Emp_SSN)
REFERENCES Employee(Emp_SSN);

ALTER TABLE Offer
ADD FOREIGN KEY (PID)
REFERENCES Travel_Packages(Package_ID);

BEGIN
INSERT INTO Offer
VALUES(3170611134560,105);

INSERT INTO Offer
VALUES(3170611185433,120);

INSERT INTO Offer
VALUES(3070611185655,115);

INSERT INTO Offer
VALUES(3270611184655,125);

INSERT INTO Offer
VALUES(3370612185655,110);
COMMIT;
END;
