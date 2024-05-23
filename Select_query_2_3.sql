-- ЗАДАНИЕ 2
select MAX (durat) from tracks;

select durat, track_name from tracks
where durat >= 210;

select collection_name, release_date from music_collections
where release_date between 2018 and 2020;

select singer_name from singers
where singer_name not like '% %';

select track_name, album_id  from tracks 
where track_name like '%моя%';


-- ЗАДАНИЕ 3

-- количество исполнителей в каждом жанре
select genres, COUNT(singer_id) from genres g
join singergenres sg on sg.genres_id = g.id 
group by g.genres;

--количество треков, вошедших в альбомы 2019-2020 годов
select album, COUNT (track_name) from albums a
join tracks t on t.album_id = a.id 
where release_date between 2019 and 2020
group by album ;

--средняя продолжительсть треков по каждому альбому
select album_id, AVG (durat) from tracks t 
group by album_id 
order by AVG (durat);

--все исполнители, которые не выпустили альбомы в 2020 году
select singer_name, release_date from singers s
join singersalbums sa on sa.singer_id = s.id
join albums a on a.id = sa.album_id
where release_date != 2020;

-- названия сборников в которых присутствует конкретный исполнитель
select album, singer_name from albums a
join singersalbums sa on a.id = sa.album_id 
join singers s on sa.singer_id = s.id 
where singer_name = 'Sam Smith';