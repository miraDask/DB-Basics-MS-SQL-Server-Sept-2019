
CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY ,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(Max),
	CONSTRAINT CHK_PictureSizeUpTo_2MB CHECK (DATALENGTH(Picture)<= 2097152),
	Height DECIMAL(3,2),
	[Weight] DECIMAL(5,2),
	Gender CHAR(1) NOT NULL,
	CONSTRAINT CHK_Gender CHECK (Gender IN ('m', 'f')),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
) 

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('CECO', 33000, 1.85, 96, 'm', '1964-02-14', 'I was born in Sofia.'),
('Gogo Pedagogov', NULL, 1.65, 76, 'm', '2004-12-14', 'I was born in Plovdiv.'),
('Gergana Hr', NULL, 1.75, 56, 'f', '2000-11-14', 'I was born in Sofia.'),
('Maria Pedagogova', NULL, 1.66, 156, 'f', '1974-12-14', 'Gogo Pedagogov is my son.'),
('Gerasim Pedagogov', NULL, 1.95, 176, 'm', '1973-10-14','Gogo Pedagogov is my son.')
