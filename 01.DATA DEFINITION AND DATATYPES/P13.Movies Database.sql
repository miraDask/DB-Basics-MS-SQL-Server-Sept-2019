CREATE DATABASE Movies

CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName CHAR NOT NULL,
	Notes NVARCHAR(1000)
)

CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(50) NOT NULL,
	DirectorId INT NOT NULL FOREIGN KEY REFERENCES Directors (Id) ,
	CopyrightYear SMALLINT NOT NULL,
	[Length] SMALLINT NOT NULL,
	GenreId INT NOT NULL FOREIGN KEY REFERENCES Genres (Id),
	CategoryId INT  NOT NULL FOREIGN KEY REFERENCES Categories (Id),
	Rating DECIMAL(2,1) NOT NULL,
	Notes NVARCHAR(1000)
)

INSERT INTO Directors(DirectorName, Notes) VALUES
('Frank Darabont', 'Three-time Oscar nominee'),
('Christopher Nolan', 'Best known for his cerebral, often nonlinear, storytelling,
 acclaimed writer-director Christopher Nolan was born on July 30, 1970 in London, England'),
('Steven Spielberg', 'One of the most influential personalities in the history of cinema.'),
('Francis Ford Coppola', 'Francis Ford Coppola was born in 1939 in Detroit, Michigan,
  but grew up in a New York suburb in a creative,supportive Italian-American family.'),
('Sidney Lumet', 'Sidney Lumet was a master of cinema, best known for his technical knowledge
 and his skill at getting first-rate performances from his actors.')

 INSERT INTO Genres(GenreName, Notes) VALUES
  ('Drama', 'In film and television, drama is a genre of narrative fiction (or semi-fiction)
  intended to be more serious than humorous in tone'),
  ('Action', 'Action film is a film genre in which the protagonist or protagonists are thrust into a series of events that typically include violence, 
  extended fighting, physical feats, and frantic chases.'),
  ('History', 'History is one of the three main genres in Western theatre alongside tragedy and comedy, although it originated, in its modern form, 
  thousands of years later than the other primary genres'),
  ('Crime', 'Crime fiction is the genre of fiction that deals with crimes, 
  their detection, criminals, and their motives.'),
  ('Comedy', NULL)


  INSERT INTO Categories(CategoryName, Notes) VALUES
  ('A', 'Recommended for children'),
  ('B', 'No age restrictions'),
  ('C', 'Not recommended for children under 12'),
  ('D', 'Prohibited for persons under 16'),
  ('X', 'Prohibited for persons under 18')

  INSERT INTO Movies(Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes) 
  VALUES 
  ('The Shawshank Redemption', 1, 1994, 140, 1, 4, 9.3, 'Two imprisoned men bond over a number of years, 
  finding solace and eventual redemption through acts of common decency.'),
  ('The Godfather', 4, 1972, 175, 4, 4, 9.2, 'The aging patriarch of an organized crime dynasty transfers
   control of his clandestine empire to his reluctant son.'),
  ('The Dark Knight', 2, 2008, 152, 2, 3, 9.0, 'When the menace known as The Joker emerges from his mysterious past,
    he wreaks havoc and chaos on the people of Gotham. The Dark Knight must
    accept one of the greatest psychological and physical tests of his ability to fight injustice.'),
  ('12 Angry Men', 5, 1957, 96, 1, 2, 8.9, 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.'),
  ('Schindler''s List', 3, 1993, 195, 3, 4, 8.9, 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for 
  his Jewish workforce after witnessing their persecution by the Nazis.' )