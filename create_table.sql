create table if not exists Genres (
	id SERIAL primary key,
	genres VARCHAR(80) UNIQUE not NULL 
);
	
create table if not exists Singers (
	id SERIAL primary key,
	singer_name VARCHAR(40) UNIQUE not null
);
	
create table if not exists SingerGenres (
	genres_id INTEGER references Genres(id),
	singer_id INTEGER references Singers(id),
	constraint pk primary key (genres_id, singer_id)
);

create table if not exists Albums (
	id SERIAL primary key,
	album VARCHAR(50) not null,
	release_date INTEGER not null CHECK(release_date>1900)
);

create table if not exists Tracks (
	id SERIAL primary key,
	album_id INTEGER not null references Albums(id),
	duration TIME 
);

create table if not exists SingersAlbums (
	singer_id INTEGER references Singers(id),
	album_id INTEGER references Albums(id),
	constraint prk primary key (singer_id, album_id)
);

create table if not exists Music_collections (
	id SERIAL primary key,
	collection_name VARCHAR(60) not null,
	release_date INTEGER not null CHECK(release_date>1900)
);

create table if not exists Music_collectionsTracks (
	music_collection_id INTEGER references Music_collections(id),
	track_id INTEGER references Tracks(id),
	constraint pk2 primary key (music_collection_id, track_id)
);





