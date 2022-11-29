INSERT INTO Author
VALUES(1, 'Massive Attack'),
(2, 'Граймс'),
(3, 'Vanilla Sky'),
(4, 'АТС'),
(5, 'Brazzaville'),
(6, 'Yoon Do Hyun Band'),
(7, 'Infinity of Sound'),
(8, 'Rammstein');

INSERT INTO Genre
VALUES(1, 'Classic'),
(2, 'Rock'),
(3, 'Pop'),
(4, 'Metal'),
(5, 'Disco');

INSERT INTO Album
VALUES(1, 'The Dark Side of the Moon', 1973),
(2, 'Back in Black', 1980),
(3, 'Fantome-1', 2017),
(4, 'Girl Going Nowhere', 2018),
(5, 'Hi Viz', 2018),
(6, 'Ategnatos', 2019),
(7, 'A Holly Dolly Christmas', 2020),
(8, 'The Bitter Truth', 2021);

INSERT INTO Compilation 
VALUES(1, 'Cross Road', 1994),
(2, 'All the Way. A Decade of Song', 1999),
(3, 'ЛУЧШИЕ ПЕСНИ 2017', 2017),
(4, 'Лучшая Музыка 2018', 2018),
(5, 'Top 100 2018', 2018),
(6, 'ТОП 100 октябрь 2019', 2019),
(7, 'MELOMAN MUSIC', 2020),
(8, 'RUSSISCHE MUSIK', 2021);

INSERT INTO Track
VALUES(1, 2, 'Crossfire', '00:03:18'),
(2, 1, 'Somewhere Along The Way', '00:04:17'),
(3, 7, 'More Than You Know', '00:03:20'),
(4, 4, 'Way Down We Go', '00:03:18'),
(5, 5, 'Despacito ft. Daddy Yankee', '00:03:47'),
(6, 6, 'Shape Of You', '00:03:51'),
(7, 7, 'Attention', '00:03:26'),
(8, 8, 'Be my Mine', '00:02:40'),
(9, 7, 'Something Just Like This', '00:04:05'),
(10, 6, 'Weak', '00:03:19'),
(11, 5, 'Never Go Away', '00:03:46'),
(12, 6, 'Good Day', '00:03:47'),
(13, 4, 'Take my To Infinity', '00:03:53'),
(14, 3, 'I Never Felt So Right', '00:04:11'),
(15, 8, 'Other People', '00:03:02');

INSERT INTO genre_author 
VALUES(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 1, 6),
(7, 2, 7),
(8, 3, 8),
(9, 4, 2),
(10, 5, 3);

INSERT INTO author_album 
VALUES(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 1, 2),
(10, 2, 3),
(11, 3, 4),
(12, 4, 5),
(13, 5, 6),
(14, 6, 7),
(15, 7, 8),
(16, 8, 7);

INSERT INTO compilation_track  
VALUES(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 1, 9),
(10, 2, 10),
(11, 3, 11),
(12, 4, 12),
(13, 5, 13),
(14, 6, 14),
(15, null, 15);