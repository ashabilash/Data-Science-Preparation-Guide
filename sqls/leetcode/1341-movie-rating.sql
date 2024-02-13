/*
Leetcode ID: 1341
Leetcode URL: https://leetcode.com/problems/movie-rating/description/
*/
(
SELECT 
    name AS results
FROM
    MovieRating INNER JOIN Users
    ON MovieRating.user_id = Users.user_id
GROUP BY
    MovieRating.user_id
ORDER BY COUNT(MovieRating.user_id) DESC, name
LIMIT 1
)
UNION
(
    SELECT 
        title AS results
    FROM
        MovieRating INNER JOIN Movies
        ON MovieRating.movie_id = Movies.movie_id
    WHERE
        EXTRACT(MONTH FROM created_at) = 2
        AND
        EXTRACT(YEAR FROM created_at) = 2020
    GROUP BY
        MovieRating.movie_id
    ORDER BY AVG(MovieRating.rating) DESC, title
    LIMIT 1
)
