\connect jazminesa

DROP DATABASE IF EXISTS music_collection;
CREATE DATABASE music_collection;

\connect music_collection;

DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
  name varchar(100) NOT NULL,
  genre varchar(100) NOT NULL,
  record_label varchar(100),
  PRIMARY KEY (name)
);

INSERT INTO artists (name, genre, record_label) VALUES
  ('Billie Eilish', 'Dark Pop', 'Interscope Records'),
  ('FINNEAS', 'Alt Pop', 'AWAL'),
  ('Hollywood Undead', 'Rap Rock', 'A&M Octone Records'),
  ('Juice WRLD', 'Hip Hop', 'Interscope Records'),
  ('Lady Gaga', 'Pop', 'Interscope Records'),
  ('Post Malone', 'Hip Hop', 'Republic Records'),
  ('Melanie Martinez', 'Indie Pop', 'Atlantic Records'),
  ('Travis Scott', 'Hip Hop', 'Grand Hustle Records'),
  ('Sam Smith', 'Pop', 'Capitol Records'),
  ('Tyler the Creator', 'Alt Hip Hop', 'Columbia Records')
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
  ('FINNEAS', 'song', 'Till Forever Falls Apart', '', 2021),
  ('Hollywood Undead', 'album', '', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Undead', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Sell Your Soul', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Everywhere I Go', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'No Other Place', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'No. 5', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Young', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Black Dahlia', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'This Love, This Hate', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Bottle and a Gun', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'California', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'City', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'The Diary', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Pimpin''', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Paradise Lost', 'Swan Songs', 2008),
  ('Hollywood Undead', 'song', 'Christmas in Hollywood', '', 2008),
  ('Hollywood Undead', 'album', '', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Been to Hell', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Apologize', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Comin'' in Hot', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'My Town', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'I Don''t Wanna Die', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Hear Me Now', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Gangsta Sexy', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Glory', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Lights Out', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Coming Back Down', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Bullet', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Levitate', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Pour Me', 'American Tragedy', 2011),
  ('Hollywood Undead', 'song', 'Tendencies', 'American Tragedy', 2011),
  ('Hollywood Undead', 'album', '', 'American Tragedy (Deluxe)', 2011),
  ('Hollywood Undead', 'song', 'Mother Murder', 'American Tragedy (Deluxe)', 2011),
  ('Hollywood Undead', 'song', 'Lump Your Head', 'American Tragedy (Deluxe)', 2011),
  ('Hollywood Undead', 'song', 'Le Deux', 'American Tragedy (Deluxe)', 2011),
  ('Hollywood Undead', 'song', 'S.C.A.V.A.', 'American Tragedy (Deluxe)', 2011),
  ('Hollywood Undead', 'album', '', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Dead Bite', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'From the Ground', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Another Way Out', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Lion', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'We Are', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Pigskin', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Rain', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Kill Everyone', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Believe', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Up in Smoke', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'song', 'Outside', 'Notes from the Underground', 2013),
  ('Hollywood Undead', 'album', '', 'Notes from the Underground - Unabridged (Deluxe)', 2013),
  ('Hollywood Undead', 'song', 'Medicine', 'Notes from the Underground - Unabridged (Deluxe)', 2013),
  ('Hollywood Undead', 'song', 'One More Bottle', 'Notes from the Underground - Unabridged (Deluxe)', 2013),
  ('Hollywood Undead', 'song', 'Delish', 'Notes from the Underground - Unabridged (Deluxe)', 2013),
  ('Hollywood Undead', 'album', '', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Usual Suspects', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'How We Roll', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Day of the Dead', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'War Child', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Dark Places', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Take Me Home', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Gravity', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Does Everybody in the World Have to Die', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Disease', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Party by Myself', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Live Forever', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'song', 'Save Me', 'Day of the Dead', 2015),
  ('Hollywood Undead', 'album', '', 'Day of the Dead (Deluxe Version)', 2015),
  ('Hollywood Undead', 'song', 'Guzzle, Guzzle', 'Day of the Dead (Deluxe Version)', 2015),
  ('Hollywood Undead', 'song', 'I''ll Be There', 'Day of the Dead (Deluxe Version)', 2015),
  ('Hollywood Undead', 'song', 'Let Go', 'Day of the Dead (Deluxe Version)', 2015),
  ('Hollywood Undead', 'album', '', 'Five', 2017),
  ('Hollywood Undead', 'song', 'California Dreaming', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Whatever It Takes', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Bad Moon', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Ghost Beach', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Broken Record', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Nobody''s Watching', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Renegade', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Black Cadillac', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Pray (Put ''Em in the Dirt)', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Cashed Out', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Riot', 'Five', 2017),
  ('Hollywood Undead', 'song', 'We Own the Night', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Bang Bang', 'Five', 2017),
  ('Hollywood Undead', 'song', 'Your Life', 'Five', 2017),
  ('Hollywood Undead', 'ep', '', 'Psalms', 2018),
  ('Hollywood Undead', 'song', 'Bloody Nose', 'Psalms', 2018),
  ('Hollywood Undead', 'song', 'Live Fast Die Young', 'Psalms', 2018),
  ('Hollywood Undead', 'song', 'Something to Believe', 'Psalms', 2018),
  ('Hollywood Undead', 'song', 'Another Level', 'Psalms', 2018),
  ('Hollywood Undead', 'song', 'Gotta Let Go', 'Psalms', 2018),
  ('Hollywood Undead', 'album', '', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Time Bomb', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Heart of a Champion', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Already Dead', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Empire', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Killin'' It', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Enemy', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Upside Down', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Second Chances', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'song', 'Nightmare', 'New Empire Vol. 1', 2020),
  ('Hollywood Undead', 'album', '', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Medicate', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Comin'' Thru the Stereo', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Ghost Out', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Gonna Be OK', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Monsters', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Idol', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Coming Home', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Unholy', 'New Empire Vol. 2', 2020),
  ('Hollywood Undead', 'song', 'Worth It', 'New Empire Vol. 2', 2020)
;
