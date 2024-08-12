SELECT name,duration 
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);
SELECT name, duration FROM track WHERE duration >= '00:03:30';

SELECT name FROM music_collection WHERE year BETWEEN '2018-01-01' AND '2020-12-31';
SELECT name_singer FROM singer WHERE name_singer NOT LIKE '% %' AND name_singer NOT LIKE '% % %';

SELECT name FROM track
WHERE name ILIKE '% мой %'
OR name ILIKE 'мой %'
OR name ILIKE '% мой'
OR name ILIKE '% my'
OR name ILIKE '% my %'
OR name ILIKE 'My %'
OR name ILIKE 'My'
OR name ILIKE 'мой';



SELECT COUNT(track.id) FROM track
JOIN album ON album.id = track.id_album
WHERE album.year BETWEEN '1987-01-01' AND '1989-12-31';

SELECT album.name_album, album.year, count(track.id_album) 
  FROM album
  JOIN track ON album.id = track.id_album
  WHERE album.year BETWEEN '1987-01-01' AND '1989-01-01'
  GROUP BY album.name_album, album.year;
SELECT album.name_album, AVG(track.duration)
  FROM album
  JOIN track ON album.id = track.id_album
  GROUP BY album.name_album;

SELECT singer.name_singer
FROM singer
WHERE singer.name_singer NOT IN(
SELECT singer.name_singer
FROM singer
JOIN album_singer ON album_singer.id_singer = singer.id
JOIN album ON album_singer.id_album = album.id
WHERE EXTRACT(YEAR FROM album.year) = 2020);

SELECT music_collection.name FROM music_collection
JOIN collection_track ON collection_track.id_collection = music_collection.id
JOIN track ON track.id = collection_track.id_track
JOIN album ON album.id = track.id_album
JOIN album_singer ON album.id = album_singer.id_album
JOIN singer ON singer.id = album_singer.id_singer
WHERE singer.name_singer = 'Кино' 
;

