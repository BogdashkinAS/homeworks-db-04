
-- (Задача 1) Количество исполнителей в каждом жанре
SELECT g.name AS Жанр, COUNT(a.name_author) AS Количество_исполнителей FROM genre g
LEFT JOIN genre_author AS ga ON ga.genre_id = g.id
LEFT JOIN author AS a ON a.id = ga.author_id
GROUP BY g.name;

-- (Задача 2) Общее количество треков в альбомах 2019 - 2020 годов
SELECT COUNT(t.name_track) AS Количество_треков FROM album AS a
LEFT JOIN track AS t ON t.album_id = a.id
WHERE (a.year >= 2019) AND (a.year <= 2020);

-- (Задача 2) Список треков 2019 - 2020 годов по годам выпуска
SELECT t.name_track AS Трек, a.year AS Год FROM album AS a
LEFT JOIN track AS t ON t.album_id = a.id
WHERE (a.year >= 2019) AND (a.year <= 2020)
ORDER BY a.year;

-- (Задача 3) Средняя продолжительность треков по каждому альбому
SELECT a.name_album AS Альбом, AVG(t.duration) AS Средняя_продолжительнось FROM album AS a
LEFT JOIN track AS t ON t.album_id = a.id
GROUP BY a.name_album
ORDER BY AVG(t.duration);

-- (Задача 4) Простой список исполнителей без альбомов 2020 года
SELECT a.name_author AS Исполнители FROM author AS a
WHERE a.name_author NOT IN (
SELECT a.name_author FROM author AS a
LEFT JOIN author_album AS aa ON aa.author_id = a.id
LEFT JOIN album AS al ON al.id = aa.album_id
WHERE al.year = 2020)
ORDER BY a.name_author;

-- (Задача 4) Список исполнителей без альбомов 2020 года с годами выпуска (исполнители повторяются, т.к. они могут входить в разные альбомы)
SELECT a.name_author AS Исполнители, al.year AS Год FROM author AS a
LEFT JOIN author_album AS aa ON aa.author_id = a.id
LEFT JOIN album AS al ON al.id = aa.album_id
WHERE a.name_author NOT IN (
SELECT a.name_author FROM author AS a
LEFT JOIN author_album AS aa ON aa.author_id = a.id
LEFT JOIN album AS al ON al.id = aa.album_id
WHERE al.year = 2020)
ORDER BY a.name_author, al.year;

-- (Задача 5) Сборники с исполнителем - Massive Attack.
SELECT c.name AS Сборники FROM compilation AS c
LEFT JOIN compilation_track AS ct ON c.id = ct.compilation_id
LEFT JOIN track AS t ON t.id = ct.track_id
LEFT JOIN album AS a ON a.id = t.album_id
LEFT JOIN author_album AS aa ON aa.album_id = a.id
LEFT JOIN author AS au ON au.id = aa.author_id
WHERE au.name_author LIKE '%%Massive Attack%%'
ORDER BY c.name;

-- (Задача 6) Альбомы с исполнителями более 1 жанра
SELECT a.name_album AS Альбомы FROM album AS a
LEFT JOIN author_album AS aa ON aa.album_id = a.id
LEFT JOIN author AS au ON au.id = aa.author_id 
LEFT JOIN genre_author AS ga ON ga.author_id = au.id
LEFT JOIN genre AS g ON g.id = ga.genre_id 
GROUP BY a.name_album
HAVING COUNT(DISTINCT g.name) > 1
ORDER BY a.name_album;

-- (Задача 6) Альбомы с исполнителями более 1 жанра с указанием количества жанров
SELECT a.name_album AS Альбомы, COUNT(g.id) AS Количество_жанров FROM album AS a
LEFT JOIN author_album AS aa ON aa.album_id = a.id
LEFT JOIN author AS au ON au.id = aa.author_id 
LEFT JOIN genre_author AS ga ON ga.author_id = au.id
LEFT JOIN genre AS g ON g.id = ga.genre_id 
GROUP BY a.name_album
HAVING COUNT(DISTINCT g.name) > 1
ORDER BY a.name_album;

-- (Задача 7) Треки, не входящие в сборники
SELECT t.name_track AS Трек FROM track AS t
LEFT JOIN compilation_track AS ct ON ct.track_id = t.id
WHERE ct.compilation_id IS NULL;

-- (Задача 8) Испольнитель с самым коротким треком
SELECT a.name_author AS Исполнитель, min(t.duration) AS Продолжительность FROM track AS t
LEFT JOIN album AS al ON al.id = t.album_id
LEFT JOIN author_album AS aa ON aa.album_id = al.id
LEFT JOIN author AS a ON a.id = aa.album_id
GROUP BY a.name_author
ORDER BY MIN(t.duration) LIMIT 1;

-- (Задача 9) Альбомы с наименьшим количеством треков
SELECT a.name_album  AS Альбомы, COUNT(t.id) AS Количество_треков FROM album AS a
LEFT JOIN track AS t ON t.album_id = a.id
WHERE t.album_id in (SELECT album_id FROM track
GROUP BY album_id
HAVING count(id) = (SELECT count(id) FROM track
GROUP BY album_id
ORDER BY count LIMIT 1))
GROUP BY a.name_album
ORDER BY a.name_album;
