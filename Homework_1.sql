USE Music_collection

--Завдання 2

--1) Представлення відображає назви всіх виконавців:
--CREATE VIEW all_artists AS
--SELECT perfomer_name FROM perfomers;

----2) Представлення відображає повну інформацію про всі пісні: 
----назва пісні, назва диска, тривалість пісні, музичний стиль пісні, виконавець:
--CREATE VIEW all_songs_info AS
--SELECT songs.song_name, discs.disc_name, songs.duration_song, 
--styles.style_name, perfomers.perfomer_name
--FROM songs
--INNER JOIN discs ON songs.disc_id = discs.id
--INNER JOIN styles ON songs.style_song_id = styles.id
--INNER JOIN perfomers ON songs.perfomer_id = perfomers.id;

----3) Представлення відображає інформацію про музичні диски певної групи. 
----Наприклад, The Beatles:
--CREATE VIEW the_beatles_albums AS
--SELECT *
--FROM discs
--WHERE perfomer_id = (SELECT id FROM perfomers WHERE perfomer_name = 'The Beatles');

----4) Представлення відображає назву найпопулярнішого в колекції виконавця. 
----Популярність визначається за кількістю дисків у колекції:
--CREATE VIEW most_popular_artist AS
--SELECT TOP 1 perfomers.perfomer_name
--FROM perfomers
--INNER JOIN discs ON perfomers.id = discs.perfomer_id
--GROUP BY perfomers.perfomer_name
--ORDER BY COUNT(*) DESC;

----5) Представлення відображає топ-3 найпопулярніших у 
----колекції виконавців. Популярність визначається за кількістю дисків у колекції:
--CREATE VIEW top_3_popular_artists AS
--SELECT TOP 3 perfomers.perfomer_name, COUNT(*) as кількість_дисків
--FROM perfomers
--INNER JOIN discs ON perfomers.id = discs.perfomer_id
--GROUP BY perfomers.perfomer_name
--ORDER BY кількість_дисків DESC;


----6) Представлення відображає найдовший за тривалістю музичний альбом:
--CREATE VIEW longest_album AS
--SELECT TOP 1 discs.disc_name, SUM(songs.duration_song) AS загальна_тривалість
--FROM songs
--INNER JOIN discs ON songs.disc_id = discs.id
--GROUP BY discs.disc_name
--ORDER BY загальна_тривалість DESC;

--Завдання 3

--1)Представлення для вставки нових стилів:
CREATE VIEW add_style AS 
    INSERT INTO styles (style_name)
    VALUES ('new_style_name');

--2)Представлення для вставки нових пісень:
CREATE VIEW add_song AS 
    INSERT INTO songs (title, album, duration_song, style_song_id, perfomer_id)
    VALUES ('new_song_title', 'album_name', '00:03:30', 1, 1);
	go
--3)Представлення для оновлення інформації про видавця:
CREATE VIEW update_publisher AS 
    UPDATE publisher 
    SET country = 'new_country' 
    WHERE name = 'publisher_name';

--4)Представлення для видалення виконавців:
CREATE VIEW delete_artist AS 
    DELETE FROM artist 
    WHERE name = 'artist_name';

--5)Представлення для оновлення інформації про конкретного виконавця:
CREATE VIEW update_artist AS 
    UPDATE artist 
    SET name = 'new_artist_name', genre_id = 2
    WHERE name = 'artist_name';



