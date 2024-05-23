-- ЗАДАНИЕ 1
insert into genres (id, genres) values 
	(1, 'RNB'),
	(2, 'POP'),
	(3, 'Latin');

insert into singers (id, singer_name) values
	(1, 'Ashanti'),
	(2, 'Дима Билан'),
	(3, 'Sam Smith'),
	(4, 'Ed Sheeran');

insert into singergenres (genres_id, singer_id) values
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 4);

insert into albums (id, album, release_date) values
	(1, 'Cant stop', '2004'),
	(2, 'Heal', '2020'),
	(3, 'Gloria', '2023'),
	(4, 'Эгоист', '2017');

alter table tracks
add durat integer not null check( durat >90) 

alter table tracks 
drop column duration;

insert into tracks (id, album_id, durat, track_name) values
	(1, 1, 232, 'Come to me'),
	(2, 2, 222, 'Pray'),
	(3, 2, 167, 'Like I can'),
	(4, 2, 221, 'La La La');

insert into singersalbums (singer_id, album_id) values
	(1, 1),
	(3, 2),
	(3, 3),
	(2, 4);

insert into music_collections (id, collection_name, release_date) values
	(1, '100 лучших зарубежных хитов 2004', '2004'),
	(2, 'The best pop singles 2020', '2020'),
	(3, 'The best RNB HITs 2004', '2004'),
	(4, 'Хиты 2020', '2020');


insert into music_collectionstracks (music_collection_id,track_id) values
	(1, 1),
	(2, 2),
	(3, 2),
	(4, 2);

insert into tracks (id, album_id, durat, track_name) values
	(5, 4, '123', 'Это моя любовь');
