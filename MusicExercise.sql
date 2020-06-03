--1. Query all of the entries in the Genre table
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
	album.Title, album.Id
FROM Album album
LEFT JOIN Song s ON album.id = s.AlbumId
WHERE s.AlbumId IS NULL;

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Fall Out Boy', '2001');

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('From Under the Cork Tree', '05/03/2005', 43, 'BMG Direct Marketing, Inc.', 1005, 2);

--9. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO SONG (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Our Lawyer Made Us Change the Name', 3, '05/03/2005', 2, 1005, 1005);

--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT 
	album.Title, 
	s.Title, 
	artist.ArtistName
FROM Album album
JOIN Song s ON s.AlbumID = album.Id
JOIN Artist artist ON artist.Id = s.ArtistId
WHERE s.AlbumId = 1005;

--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	album.Title,
	COUNT(s.Id) AS 'Song Count'
FROM Album album
LEFT JOIN Song s ON s.AlbumId = album.Id
GROUP BY (album.Title);

--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	artist.ArtistName,
	COUNT(s.Id) AS 'Song Count'
FROM Artist artist
LEFT JOIN Song s ON s.ArtistId = artist.Id
GROUP BY (artist.ArtistName);

--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	g.Label,
	COUNT(s.Id) AS 'Song Count'
FROM Genre g
LEFT JOIN Song s ON g.Id = s.GenreId
GROUP BY (g.Label);

--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT 
	artist.ArtistName AS 'Artist',
	COUNT (DISTINCT album.Label) AS 'Number of Labels'
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
GROUP BY artist.ArtistName
HAVING COUNT(DISTINCT album.Label) > 1;


