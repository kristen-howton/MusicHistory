﻿--1. Query all of the entries in the Genre table
SELECT 
	Id,
	Label
FROM Genre;

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT 
	Id,
	ArtistName,
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
	artist.ArtistName
FROM Artist artist
JOIN Album album ON artist.id = album.ArtistId 
JOIN Genre g ON album.GenreId = g.Id
WHERE g.Label = 'Pop';

--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT 
	artist.ArtistName
FROM Artist artist
JOIN Album album ON artist.id = album.ArtistId 
JOIN Genre g ON album.GenreId = g.Id
WHERE g.Label = 'Jazz' OR g.Label = 'Rock';


--6. Write a SELECT statement that lists the Albums with no songs
SELECT 
	album.Title
FROM Album album
LEFT JOIN Song s ON album.id = s.AlbumId
WHERE s.AlbumId IS NULL;

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Fall Out Boy', '2001');

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('From Under the Cork Tree', '05/03/2005', 43, 'BMG Direct Marketing, Inc.', 1005, 2);

