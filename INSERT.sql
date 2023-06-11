INSERT INTO genre(genre_name) VALUES
('Метал'),
('Рок'),
('Рэп'),
('Альтернатива'),
('Панк');

INSERT INTO singer(singer_name) VALUES
('Nirvana'),
('Король и Шут'),
('Каста'),
('Green Day'),
('Imagine Dragons'),
('Би-2'),
('Ария'),
('Linkin Park');

INSERT INTO singers_genres_list(singer_id, genre_id) VALUES
(1, 2),
(2, 5),
(3, 3),
(4, 5),
(5, 2),
(6, 2),
(7, 1),
(8, 1),
(1, 4),
(2, 2),
(4, 2);

INSERT INTO album(album_name, album_year) VALUES
('Театръ демона', 2010),
('Nevermind', 1991),
('Лучшие песни', 2014),
('Father of All...', 2020),
('Origins', 2018),
('Мяу кисс ми', 2001),
('Проклятье морей', 2018),
('A Thousand Suns Live Around the World', 2012);

INSERT INTO singers_albums_list(singer_id, album_id) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO track(album_id, track_name, track_duration) VALUES
(1,'Танец злобного гения', 236),
(1,'Фокусник', 213),
(2,'Come As You Are', 218),
(2,'Smells Like Teen Spirit', 301),
(3,'Мы берём это на улицах', 209),
(3,'Вокруг шум', 213),
(4,'Meet Me on the Roof', 159),
(4,'Fire, Ready, Aim', 172),
(5,'Machine', 181),
(5,'Only', 180),
(6,'Моя любовь', 296),
(6,'Мой рок-н-ролл', 405),
(7,'Живой', 535),
(7,'Проклятье морей', 725),
(8,'The Requiem', 150);

INSERT INTO compilation(compilation_name, compilation_year) VALUES
('Лучшие песни русского панк-рока', 2021),
('Best Of The Best', 2010),
('Hip-Hop Info #7', 2019),
('Classic Rock Running', 2020),
('Antrenament în ritm POP', 2020),
('The Best of', 2013),
('Russian Rock Legends Vol. 4', 2018),
('Live 8', 2019);

INSERT INTO tracks_compilations_list(track_id, compilation_id) VALUES
(3,2),
(6,3),
(14,7),
(15,8),
(8,4),
(10,5),
(4,2),
(1,1),
(12,6);