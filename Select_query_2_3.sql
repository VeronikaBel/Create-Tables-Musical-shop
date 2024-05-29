-- ЗАДАНИЕ 2
select track_name, durat from tracks
where durat = (select MAX(durat) from tracks);

select durat, track_name from tracks
where durat >= 210;

select collection_name, release_date from music_collections
where release_date between 2018 and 2020;

select singer_name from singers
where singer_name not like '% %';

select track_name, album_id  from tracks 
where track_name ILIKE 'my %'
OR track_name ILIKE '% my'
OR track_name ILIKE '% my %'
OR track_name ILIKE 'my'
OR track_name ILIKE 'моя'
OR track_name ILIKE 'моя %'
OR track_name ILIKE '% моя'
OR track_name ILIKE '% моя %';

-- ЗАДАНИЕ 3

-- количество исполнителей в каждом жанре
select genres, COUNT(singer_id) from genres g
join singergenres sg on sg.genres_id = g.id 
group by g.genres;

--количество треков, вошедших в альбомы 2019-2020 годов
select COUNT (t.id) from tracks t
join albums a on t.album_id = a.id 
where release_date between 2019 and 2020;

--средняя продолжительсть треков по каждому альбому
select album_id, AVG (durat) from tracks t 
group by album_id 
order by AVG (durat);

--все исполнители, которые не выпустили альбомы в 2020 году
SELECT singer_name FROM singers s
WHERE singer_name NOT IN (SELECT singer_name FROM singers s
 JOIN singersalbums sa ON s.id = sa.singer_id
 JOIN albums a ON a.id = sa.album_id 
 WHERE release_date = 2020);

-- названия сборников в которых присутствует конкретный исполнитель
select collection_name, singer_name from music_collections m
join music_collectionstracks mtr on mtr.music_collection_id = m.id 
join tracks tr on tr.id = mtr.track_id
join albums a on a.id = tr.album_id
join singersalbums sa on sa.album_id = a.id
join singers s on s.id = sa.singer_id   
where singer_name = 'Sam Smith';