/*
songs - song id, artist id
artist - artist id, artist name
global song rank - day, son id, rank
*/

WITH song_appearances AS (
  SELECT
    song_id,
    COUNT(song_id) AS no_of_appearances
  FROM
    global_song_rank
  WHERE
    rank <=10
  GROUP BY
    song_id
),
artist_apperances AS (
  SELECT 
    songs.artist_id,
    SUM(song_appearances.no_of_appearances) as no_of_artist_appearances
  FROM
    song_appearances INNER JOIN songs
    ON song_appearances.song_id = songs.song_id
  GROUP BY songs.artist_id
),
artist_ranks AS (
  SELECT 
    artist_id,
    DENSE_RANK() OVER(
      PARTITION BY 1 
      ORDER BY no_of_artist_appearances DESC
    ) AS rank_of_artist,
    no_of_artist_appearances
  FROM artist_apperances
)
SELECT 
  artists.artist_name,
  artist_ranks.rank_of_artist AS artist_rank
FROM artists INNER JOIN artist_ranks
ON artists.artist_id = artist_ranks.artist_id
WHERE artist_ranks.rank_of_artist <=5
ORDER BY artist_ranks.rank_of_artist, artist_name

/*
SELECT 
  artist_name,
  artist_rank
FROM artists;
*/


/*
songs - song id, artist id
artist - artist id, artist name
global song rank - day, son id, rank
*/

/* Version 2
Reduced number of lines
*/

WITH song_appearances AS (
  SELECT
    songs.artist_id,
    COUNT(songs.song_id) AS song_count
  FROM
    global_song_rank INNER JOIN songs 
    ON songs.song_id = global_song_rank.song_id
  WHERE
    rank <=10
  GROUP BY
    songs.artist_id
),
artist_rank_details AS(
SELECT
  artist_id,
  DENSE_RANK() OVER(
    ORDER BY song_count DESC
  ) AS artist_rank
FROM 
  song_appearances
)
SELECT 
  artists.artist_name,
  artist_rank_details.artist_rank
FROM
  artist_rank_details INNER JOIN artists
  ON artist_rank_details.artist_id = artists.artist_id
WHERE 
  artist_rank_details.artist_rank <=5
ORDER BY 2, 1

/* Version 3
Reduced number of lines
*/

WITH artist_rank_details AS(
  SELECT
    songs.artist_id,
    DENSE_RANK() OVER(
      ORDER BY COUNT(songs.song_id) DESC
    ) AS artist_rank
  FROM 
    global_song_rank INNER JOIN songs 
    ON songs.song_id = global_song_rank.song_id
  WHERE
    global_song_rank.rank <=10
  GROUP BY
    songs.artist_id
)
SELECT 
  artists.artist_name,
  artist_rank_details.artist_rank
FROM
  artist_rank_details INNER JOIN artists
  ON artist_rank_details.artist_id = artists.artist_id
WHERE 
  artist_rank_details.artist_rank <=5
ORDER BY 2, 1