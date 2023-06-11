-- SELECT-запрос, количество исполнителей в каждом жанре;
SELECT genre_name, COUNT(*) FROM singers_genres_list sgl
LEFT JOIN genre g ON sgl.genre_id = g.id 
GROUP BY genre_name
ORDER BY genre_name ASC;

-- SELECT-запрос, количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(track_id) FROM track t
LEFT JOIN album a ON t.album_id = a.id
WHERE album_year BETWEEN 2019 AND 2020;

-- SELECT-запрос, средняя продолжительность треков по каждому альбому;
SELECT album_name, AVG(track_duration) FROM track t
LEFT JOIN album a ON t.album_id = a.id
GROUP BY album_name
ORDER BY album_name ASC;

-- SELECT-запрос, все исполнители, которые не выпустили альбомы в 2020 году;
SELECT singer_name FROM singers_albums_list sat
JOIN singer s ON sat.singer_id = s.id
JOIN album a ON sat.album_id = a.id
WHERE album_year != 2020
ORDER BY singer_id; 

-- SELECT-запрос, названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT singer_name, compilation_name FROM tracks_compilations_list tcl
LEFT JOIN compilation c ON tcl.compilation_id = c.id
LEFT JOIN track t ON tcl.track_id = t.track_id
LEFT JOIN album a ON t.album_id = a.id
LEFT JOIN singers_albums_list sal ON a.id = sal.singer_id 
LEFT JOIN singer s ON sal.singer_id = s.id
WHERE singer_name LIKE '%AC%'; 

-- SELECT-запрос, название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album_name, singer_name FROM singers_albums_list sal 
LEFT JOIN album a ON sal.album_id = a.id 
LEFT JOIN singer s ON sal.singer_id = s.id
LEFT JOIN singers_genres_list sgl ON s.id = sgl.singer_id
GROUP BY album_name, singer_name
HAVING COUNT(genre_id) > 1; 

-- SELECT-запрос, наименование треков, которые не входят в сборники;
SELECT track_name FROM track t
LEFT JOIN tracks_compilations_list tcl ON t.track_id = tcl.id 
WHERE tcl.id IS NULL;

-- SELECT-запрос, исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT singer_name, track_name, track_duration FROM track t
LEFT JOIN album a ON t.album_id = a.id 
LEFT JOIN singers_albums_list sal ON a.id = sal.album_id 
LEFT JOIN singer s ON sal.singer_id = s.id 
WHERE track_duration = (SELECT min(track_duration) FROM track);

-- SELECT-запрос,название альбомов, содержащих наименьшее количество треков.
SELECT album_name, COUNT(*) FROM track t
JOIN album a ON t.album_id = a.id
GROUP BY album_name
HAVING COUNT(*) = (SELECT MIN(mycount)
FROM (SELECT album_id, COUNT(*) mycount
FROM track t
GROUP BY album_id) foo);