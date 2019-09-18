CREATE TABLE Users(
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	CONSTRAINT CHK_ProfilePictureSizeIsUpTo900KB CHECK(DATALENGTH(ProfilePicture)<= 921600),
	LastLoginTime DATETIME2,
	IsDeleted BIT NOT NULL
)

INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted) VALUES
('Gogo', 'pass123', NULL, NULL, 0),
('Gogogo', 'pass123', NULL, NULL, 1),
('Gogogogo', 'pass123', NULL, NULL, 1),
('Gogogogogo', 'pass123', NULL, NULL, 0),
('Go', 'pass123', NULL, NULL, 0)
