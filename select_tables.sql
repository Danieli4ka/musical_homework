-- Задание № 2

-- 1. Название и продолжительность самого длительного трека
SELECT title
FROM tracks AS t
ORDER BY duration DESC 
LIMIT 1;

-- 2.Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM tracks AS t
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title 
FROM collections AS c 
WHERE c.release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artists AS a 
WHERE a.name NOT LIKE '% %';

-- 5.Название треков, которые содержат слово «мой» или «my».
SELECT title
FROM tracks AS t
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';

-- Задание № 3
-- 1. Количество исполнителей в каждом жанре.
SELECT g.name, count(*) as count_artists
FROM genres AS g 
JOIN genres_artists AS ga ON g.id = ga.genres_id 
JOIN artists AS a ON a.id = ga.artists_id 
GROUP BY g.name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(*) as count_traks
FROM tracks AS t 
JOIN albums AS a ON t.albums_id = a.id 
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому.
SELECT a.title, avg(t.duration) AS avg_duration
FROM tracks AS t 
JOIN albums AS a ON t.albums_id = a.id 
GROUP BY a.title;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT a2.name
FROM albums AS a 
JOIN artists_albums AS aa ON a.id = aa.albums_id
JOIN artists AS a2 ON a2.id  = aa.artists_id 
WHERE a.release_year != 2020;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.title 
FROM collections AS c
JOIN collections_tracks ct ON c.id = ct.collections_id
JOIN tracks AS t ON t.id = ct.tracks_id 
JOIN albums AS a ON a.id = t.albums_id
JOIN artists_albums AS aa ON aa.artists_id = a.id
JOIN artists AS a2 ON a2.id = aa.artists_id 
WHERE a2.name = 'Bi-2';

-- Задание № 4
-- 1.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.title
FROM albums AS a 
JOIN artists_albums AS aa ON a.id = aa.albums_id 
JOIN genres_artists AS ga ON aa.artists_id = ga.artists_id 
JOIN genres AS g ON g.id = ga.genres_id
GROUP BY a.id, a.title
HAVING count(DISTINCT g.id) > 1;

-- 2. Наименования треков, которые не входят в сборники.
SELECT t.title 
FROM tracks AS t 
FULL JOIN collections_tracks AS ct ON t.id = ct.tracks_id 
WHERE ct.collections_tracks_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
-- — теоретически таких треков может быть несколько.
SELECT a.name
FROM artists AS a 
JOIN artists_albums AS aa ON a.id = aa.artists_id 
JOIN albums AS a2 ON aa.albums_id = a2.id 
JOIN tracks AS t ON a2.id = t.albums_id 
WHERE t.duration = (SELECT min(t2.duration) FROM tracks t2);

-- 4. Названия альбомов, содержащих наименьшее количество треков.
SELECT a.title, count(t.id) AS count_albums
FROM albums AS a 
JOIN tracks AS t ON  t.albums_id = a.id 
GROUP BY a.id
--order by count(t.id)
HAVING count(t.id) = (
		SELECT min(1)
		FROM (SELECT count(*)
			  FROM tracks AS t2 
			  GROUP BY t2.albums_id) AS tracks_count);
