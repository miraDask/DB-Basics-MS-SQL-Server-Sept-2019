CREATE DATABASE Hotel

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	FirstName NVARCHAR(26) NOT NULL , 
	LastName NVARCHAR(26) NOT NULL, 
	Title NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(1000)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('John', 'Doe', 'Receptionist', 'Works in hotel since 25.09.2009'),
('Jenny', 'Doe', 'Cleaner', 'Works in hotel since 05.09.2019'),
('Johny', 'Doe', 'Manager', 'Works in hotel since 05.10.2000')


CREATE TABLE Customers(
	AccountNumber BIGINT PRIMARY KEY NOT NULL, 
	FirstName NVARCHAR(26) NOT NULL, 
	LastName NVARCHAR(26) NOT NULL, 
	PhoneNumber NVARCHAR(20) NOT NULL, 
	EmergencyName NVARCHAR(50) NOT NULL, 
	EmergencyNumber NVARCHAR(20) NOT NULL, 
	Notes NVARCHAR(1000)
)

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
(1234123412341234, 'Peter', 'Miller', '0888123321', 'Lili Miller', '0888888888', NULL),
(2345123412342345, 'Penny', 'Muller', '0888123321', 'Lili Muller', '0888888888', 'Roomservice at 8 pm'),
(2345123567843789, 'Mimi', 'Mim', '0888122353', 'Kris Mim', '0888888888', NULL)


CREATE TABLE RoomStatus (
	RoomStatus VARCHAR(8) NOT NULL PRIMARY KEY, 
	Notes NVARCHAR(1000)
)

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
('occupied', 'Room is not free'),
('free', 'Room is ready to let'),
('reserved', NULL)


CREATE TABLE RoomTypes (
	RoomType VARCHAR(9) PRIMARY KEY NOT NULL, 
	Notes NVARCHAR(1000)
)

INSERT INTO RoomTypes (RoomType, Notes) VALUES
('single', NULL),
('double', NULL),
('apartment', 'Two rooms apartments')


CREATE TABLE BedTypes(
   	BedType VARCHAR(6) PRIMARY KEY NOT NULL , 
	Notes NVARCHAR(1000)
)

INSERT INTO BedTypes (BedType, Notes) VALUES
('single' , 'standard single bed'),
('double' , 'standard double size bed'),
('king' , 'standard king size bed')


CREATE TABLE Rooms(
	RoomNumber SMALLINT PRIMARY KEY NOT NULL, 
	RoomType VARCHAR(9) NOT NULL
	FOREIGN KEY REFERENCES RoomTypes(RoomType)
	CHECK(RoomType IN ('single', 'double', 'apartment')), 
	BedType VARCHAR(6) NOT NULL
	FOREIGN KEY REFERENCES BedTypes(BedType)
	CHECK(BedType IN ('single', 'double', 'king')), 
	Rate INT NOT NULL, 
	RoomStatus VARCHAR(8) NOT NULL
	FOREIGN KEY REFERENCES RoomStatus(RoomStatus)
	CHECK (RoomStatus IN ('reserved', 'free', 'occupied')), 
	Notes NVARCHAR(1000)
)

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) VALUES
(1, 'apartment', 'king', 120, 'free', 'Needs kitchen sink repair.'),
(2, 'single', 'single', 50, 'occupied', 'Cleaning needed.' ),
(3, 'double', 'double', 70, 'reserved', 'Ready for occupancy.' )


CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	EmployeeId INT NOT NULL
	FOREIGN KEY REFERENCES Employees(Id), 
	PaymentDate DATE NOT NULL, 
	AccountNumber BIGINT NOT NULL, 
	FirstDateOccupied DATE NOT NULL, 
	LastDateOccupied DATE NOT NULL, 
	TotalDays AS DATEDIFF(Day,FirstDateOccupied,LastDateOccupied) , 
	AmountCharged DECIMAL(7,2), 
	TaxRate DECIMAL(7,2), 
	TaxAmount AS AmountCharged * (TaxRate / 100), 
	PaymentTotal AS AmountCharged + AmountCharged * (TaxRate / 100), 
	Notes NVARCHAR(1000)
)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate, Notes)
VALUES
(1, '2019-12-04', 111222333444, '2019-11-23', '2019-12-04', 55.367, 10.0, 'Additional charging for broken window.'),
(2, '2019-12-04', 123456789065, '2019-11-23', '2019-12-04', 550.543, 10.0, 'Additional charging for room service.'),
(3, '2019-12-04', 111234555532, '2019-11-23', '2019-12-04', 230.65433, 10.0, NULL)


CREATE TABLE Occupancies(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	EmployeeId INT NOT NULL, 
	DateOccupied DATE NOT NULL, 
	AccountNumber BIGINT NOT NULL, 
	RoomNumber SMALLINT NOT NULL
	FOREIGN KEY REFERENCES Rooms(RoomNumber) , 
	RateApplied DECIMAL(7,2) NOT NULL, 
	PhoneCharge DECIMAL(7,2), 
	Notes NVARCHAR(100)
)

INSERT INTO Occupancies (EmployeeId,DateOccupied, AccountNumber, RoomNumber, RateApplied,PhoneCharge, Notes)
       VALUES (1, '2019-11-06', 11112223334444, 3, 70, NULL, NULL),
              (2,'2019-11-06', 22234434621464, 2, 50, 26.34, NULL),
              (3,'2019-11-06', 31525552451311, 1, 120, NULL, NULL)

