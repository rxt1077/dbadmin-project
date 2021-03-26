\connect jazminesa

DROP DATABASE IF EXISTS music_collection;
CREATE DATABASE music_collection;

\connect music_collection;

DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
  name varchar(100) NOT NULL,
  genre varchar(100) NOT NULL,
  PRIMARY KEY (name)
);

INSERT INTO artists (name, genre) VALUES
  ('Billie Eilish', 'Dark Pop'),
  ('FINNEAS', 'Alt Pop'),
  ('Hollywood Undead', 'Rap Rock'),
  ('Juice WRLD', 'Hip Hop'),
  ('Lady Gaga', 'Pop'),
  ('Post Malone', 'Hip Hop'),
  ('Melanie Martinez', 'Indie Pop'),
  ('Travis Scott', 'Hip Hop'),
  ('Sam Smith', 'Pop'),
  ('Tyler the Creator', 'Alt Hip Hop')
;

DROP TABLE IF EXISTS valid_media_type;
CREATE TABLE valid_media_type (
  mtype text PRIMARY KEY NOT NULL
);

INSERT INTO valid_media_type (mtype) VALUES
  ('album'),
  ('ep'),
  ('song')
;

DROP TABLE IF EXISTS music_catalog;
CREATE TABLE music_catalog (
  id serial NOT NULL UNIQUE,
  artist varchar(100) NOT NULL,
  media_type text REFERENCES valid_media_type (mtype),
  song_title varchar(100) NOT NULL DEFAULT '',
  album_title varchar(100) NOT NULL DEFAULT '',
  release_year varchar(4) DEFAULT NULL,
  PRIMARY KEY (id, artist, song_title),
  CONSTRAINT music_cat_idx FOREIGN KEY (artist) REFERENCES artists (name) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO music_catalog (artist, media_type, song_title, album_title, release_year) VALUES
  ('Billie Eilish', 'song', 'Six Feet Under', '', 2016),
  ('Billie Eilish', 'ep', '', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'ocean eyes', 'Don''t Smile at Me', 2016),
  ('Billie Eilish', 'song', 'bellyache', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'watch', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'COPYCAT', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'idontwannabeyouanymore', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'hostage', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'party favor', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'my boy', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', '&burn', 'Don''t Smile at Me', 2017),
  ('Billie Eilish', 'song', 'Bored', '', 2017),
  ('Billie Eilish', 'song', 'bitches broken hearts', '', 2018),
  ('Billie Eilish', 'song', 'lovely', '', 2018),
  ('Billie Eilish', 'song', 'come out and play', '', 2018),
  ('Billie Eilish', 'song', 'WHEN I WAS OLDER', '', 2019),
  ('Billie Eilish', 'album', '', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', '!!!!!!!', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'bad guy', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'xanny', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'you should see me in a crown', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'all the good girls go to hell', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'wish you were gay', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'when the party''s over', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', '8', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'my strange addiction', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'bury a friend', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'ilomilo', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'listen before i go', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'i love you', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'goodbye', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 2019),
  ('Billie Eilish', 'song', 'everything i wanted', '', 2019),
  ('Billie Eilish', 'song', 'No Time To Die', '', 2020),
  ('Billie Eilish', 'song', 'my future', '', 2020),
  ('Billie Eilish', 'song', 'Therefore I Am', '', 2020),
  ('Billie Eilish', 'song', 'Lo Vas A Olvidar', '', 2021),
  ('FINNEAS', 'song', 'New Girl', '', 2016),
  ('FINNEAS', 'song', 'I''m in Love Without You', '', 2017),
  ('FINNEAS', 'song', 'Heaven', '', 2018),
  ('FINNEAS', 'song', 'Life Moves On', '', 2018),
  ('FINNEAS', 'song', 'Landmine', '', 2018),
  ('FINNEAS', 'song', 'Hollywood Forever', '', 2018),
  ('FINNEAS', 'song', 'College', '', 2018),
  ('FINNEAS', 'song', 'Luck Pusher', '', 2018),
  ('FINNEAS', 'song', 'Claudia', '', 2019),
  ('FINNEAS', 'song', 'Angel', '', 2019),
  ('FINNEAS', 'ep', '', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'I Lost a Friend', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'Shelter', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'Lost My Mind', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'I Don''t Miss You at All', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'Partners in Crime', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'Let''s Fall in Love for the Night', 'Blood Harmony', 2019),
  ('FINNEAS', 'song', 'Die Alone', 'Blood Harmony', 2019),
  ('FINNEAS', 'album', '', 'Blood Harmony (Deluxe)', 2020),
  ('FINNEAS', 'song', 'Break My Heart Again', 'Blood Harmony (Deluxe)', 2020),
  ('FINNEAS', 'song', 'Let''s Fall in Love for the Night (1964)', 'Blood Harmony (Deluxe)', 2020),
  ('FINNEAS', 'song', 'Can''t Wait To Be Dead', '', 2020),
  ('FINNEAS', 'song', 'Where the Poison Is', '', 2020),
  ('FINNEAS', 'song', 'Another Year', '', 2020),
  ('FINNEAS', 'song', 'American Cliché', '', 2021),
  ('FINNEAS', 'song', 'Till Forever Falls Apart', '', 2021)
;
