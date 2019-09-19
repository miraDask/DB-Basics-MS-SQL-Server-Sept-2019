CREATE DATABASE CarRental

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName VARCHAR(26) NOT NULL, 
	DailyRate DECIMAL(5,2) NOT NULL, 
	WeeklyRate DECIMAL(5,2) NOT NULL , 
	MonthlyRate DECIMAL(6,2) NOT NULL,
	WeekendRate DECIMAL(5,2) NOT NULL
)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES 
('Sports sedan', 49.99, 105.29, 1200, 95.69),
('Minivan', 99.99, 305.29, 1500, 105.69),
('Bus', 129.99, 500.29, 2200, 150.69)

CREATE TABLE Cars(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	PlateNumber NVARCHAR(10) NOT NULL, 
	Manufacturer NVARCHAR(30) NOT NULL, 
	Model NVARCHAR(30) NOT NULL, 
	CarYear SMALLINT NOT NULL, 
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL, 
	Doors TINYINT NOT NULL, 
	Picture VARBINARY(MAX) CHECK(DATALENGTH(Picture) <= 2097152), 
	Condition NVARCHAR(1000), 
	Available BIT NOT NULL
)  

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
('BR123D', 'Ford', 'Transit Connect', 2015, 2, 5, NULL, 'New', 1),
('BR123R', 'Chavdar', '3', 1999, 3, 2, 550, 'Used', 0),
('BT123D', 'Honda ', 'Civic ', 2018, 1, 4, NULL, 'New', 1)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	FirstName NVARCHAR(20) NOT NULL, 
	LastName NVARCHAR(30) NOT NULL, 
	Title NVARCHAR(30) NOT NULL, 
	Notes NVARCHAR(1000)
) 

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES
('Bob', 'Robinson', 'Manager', 'Sales Manager'),
('Rob', 'Bobson', 'Sales Assistant', NULL),
('Miki', 'Mause', 'Sales Assistant', NULL)

CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	DriverLicenceNumber NVARCHAR(15) NOT NULL, 
	FullName NVARCHAR(50) NOT NULL, 
	[Address] NVARCHAR(50) NOT NULL, 
	City NVARCHAR(20) NOT NULL, 
	ZIPCode NVARCHAR(20) NOT NULL, 
	Notes NVARCHAR(1000)
) 

INSERT INTO Customers(DriverLicenceNumber, FullName, [Address], City, ZIPCode, Notes) VALUES
('SY1234MN','Ivan Ivanov', '20 High str', 'Biala', '1234', 'Was little suspicious' ),
('SW1234BN','Ivana Ivanova', '20 High str', 'Biala', '1234', NULL ),
('SC1234MV','Peter Miller', '20 Car str', 'Prinston', 'PR3 2HG', NULL )


CREATE TABLE RentalOrders (
	Id INT PRIMARY KEY IDENTITY NOT NULL, 
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL, 
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL, 
	CarId INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL, 
	TankLevel INT NOT NULL, 
	KilometrageStart INT NOT NULL, 
	KilometrageEnd INT NOT NULL, 
	TotalKilometrage AS KilometrageEnd - KilometrageStart, 
	StartDate DATE NOT NULL, 
	EndDate DATE NOT NULL,
	TotalDays AS DATEDIFF(DAY, StartDate, EndDate),
	RateApplied DECIMAL(6, 2),
    TaxRate DECIMAL(6, 2),
    OrderStatus NVARCHAR(20),
    Notes NVARCHAR(1000),
)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, StartDate, EndDate, RateApplied, TaxRate, OrderStatus, Notes) 
       VALUES (2, 3, 1, 60, 1645, 1700, '2019-02-15', '2019-02-16', NULL, NULL, NULL, NULL),
              (1, 2, 3, 82, 100000, 100123, '2019-09-26', '2019-10-01', NULL, NULL, NULL, NULL),
              (3, 1, 2, 163, 3303, 3444, '2019-08-01', '2019-09-01', NULL, NULL, NULL, NULL)

