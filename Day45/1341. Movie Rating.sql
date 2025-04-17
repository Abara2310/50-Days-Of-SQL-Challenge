(
  SELECT name AS results 
  FROM movierating mr
  INNER JOIN users u ON mr.user_id = u.user_id
  GROUP BY u.user_id
  ORDER BY COUNT(*) DESC, name ASC
  LIMIT 1
)
UNION ALL
(
  SELECT results
  FROM (
    SELECT title AS results, AVG(rating) AS average_rating
    FROM movierating mr
    INNER JOIN movies m ON mr.movie_id = m.movie_id
    WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
    GROUP BY m.movie_id
  ) rating_group
  ORDER BY average_rating DESC, results ASC
  LIMIT 1
);
