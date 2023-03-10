CREATE DATABASE "Music_collection";

USE "Music_collection";

CREATE TABLE styles (
  id INT NOT NULL IDENTITY(1,1),
  style_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE perfomers (
  id INT NOT NULL IDENTITY(1,1),
  perfomer_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE publishers (
  id INT NOT NULL IDENTITY(1,1),
  publisher_name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE discs (
 id INT NOT NULL IDENTITY(1,1),
  disc_name VARCHAR(255) NOT NULL,
  perfomer_id INT NOT NULL,
  release_date DATE NOT NULL,
  style_id INT NOT NULL,
  publisher_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (perfomer_id) REFERENCES perfomers(id),
  FOREIGN KEY (style_id) REFERENCES styles(id),
  FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

CREATE TABLE songs (
  id INT NOT NULL IDENTITY(1,1),
  song_name VARCHAR(255) NOT NULL,
  disc_id INT NOT NULL,
  duration_song INT NOT NULL,
  style_song_id INT NOT NULL,
  perfomer_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (disc_id) REFERENCES discs(id),
  FOREIGN KEY (style_song_id) REFERENCES styles(id),
  FOREIGN KEY (perfomer_id) REFERENCES perfomers(id)
);











