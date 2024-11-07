CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
); 

CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE genres_artists (
	genres_artists_id SERIAL PRIMARY KEY,
    artists_id INT NOT NULL,
    genres_id INT NOT NULL,
    CONSTRAINT fk_artists FOREIGN KEY (artists_id) REFERENCES artists(id) ON DELETE CASCADE,
    CONSTRAINT fk_genres FOREIGN KEY (genres_id) REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE artists_albums (
	artists_albums_id SERIAL PRIMARY KEY,
    artists_id INT NOT NULL,
    albums_id INT NOT NULL,
    CONSTRAINT fk_artists FOREIGN KEY (artists_id) REFERENCES artists(id) ON DELETE CASCADE,
    CONSTRAINT fk_albums FOREIGN KEY (albums_id) REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    albums_id INT NOT NULL,
    FOREIGN KEY (albums_id) REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE collections_tracks (
	collections_tracks_id SERIAL PRIMARY KEY,
    collections_id INT NOT NULL,
    tracks_id INT NOT NULL,
    CONSTRAINT fk_collections FOREIGN KEY (collections_id) REFERENCES collections(id) ON DELETE CASCADE,
    CONSTRAINT fk_tracks FOREIGN KEY (tracks_id) REFERENCES tracks(id) ON DELETE CASCADE
);
