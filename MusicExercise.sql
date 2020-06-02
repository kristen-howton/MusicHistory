--1. Query all of the entries in the Genre table
SELECT 
	Id,
	Label
FROM Genre;

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT 
	Id,
	ArtistName
	YearEstablished
FROM Artist
ORDER BY ArtistName;

--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT 
    s.Title,
    a.ArtistName
FROM Song s
LEFT JOIN Artist a on s.ArtistId = a.id;

--4. Write a SELECT query that lists all the Artists that have a Pop Album
SELECT 
	
FROM Artist 