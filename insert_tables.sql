INSERT INTO genres (name) VALUES 
    ('Rock'),
    ('Pop'),
    ('Jazz');
    
INSERT INTO artists (name) VALUES 
    ('Kipelov'),
    ('Coldplay'),
    ('Bi-2'),
    ('Louis Armstrong');
    
INSERT INTO genres_artists (artists_id, genres_id) VALUES 
    (1, 1),
    (2, 1),
    (2, 2),
    (3, 1),
    (4, 3),
    (4, 2);
    
INSERT INTO albums (title, release_year) VALUES 
    ('The Essential Satchmo', 1992),
    ('Parachutes ', 2000),
    ('Everyday Life', 2019),
    ('Bi-2', 2000),
    ('Vavilon', 2004);
    
 INSERT INTO artists_albums (artists_id, albums_id) VALUES 
    (1, 5),
    (2, 2),
    (2, 3),
    (3, 4),
    (4, 1),
    (1, 4);
    
INSERT INTO tracks (title, duration, albums_id) VALUES 
    ('What a Wonderful World', 138, 1),
    ('Cabaret', 166, 1),
    ('Shiver', 300, 2),
    ('Arabesque', 340, 3),
    ('Varvara', 301, 4),
    ('Happy', 247, 4),
    ('Vavilon', 345, 5);
   
INSERT INTO collections (title, release_year) VALUES 
    ('Happy', 2019),
    ('Relax', 2024),
    ('Sad', 2021),
    ('Good', 2020);
   
INSERT INTO collections_tracks (collections_id, tracks_id) VALUES 
    (1, 1),
    (1, 3),
    (1, 7),
    (2, 1),
    (2, 2),
    (2, 4),
    (3, 2),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 4),
    (4, 3);
 
 
