SELECT * 
FROM places;
 
SELECT * 
FROM reviews;


SELECT * 
FROM places
WHERE price_point = '$' 
OR price_point = '$$';

SELECT * 
FROM places
INNER JOIN reviews
ON places.id = reviews.place_id
WHERE places.total_reviews >= 1;

SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note 
FROM places
INNER JOIN reviews
ON places.id = reviews.place_id
WHERE places.total_reviews >= 1;

SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note 
FROM places
LEFT JOIN reviews
ON places.id = reviews.place_id
WHERE places.total_reviews >= 1;

SELECT places.id, places.name
FROM places
LEFT JOIN reviews
ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;

WITH old_reviews AS(
  SELECT *
  FROM reviews
  WHERE strftime('%Y',review_date) = '2020'
)
SELECT *
FROM places
JOIN old_reviews
ON places.id = old_reviews.place_id;


SELECT COUNT(rating) AS 'Reviews',reviews.username,ROUND(AVG(rating),1) AS 'avg_user_rev_rating' ,places.name, places.average_rating
FROM reviews
JOIN places 
ON reviews.place_id=places.id
GROUP BY username
HAVING AVG(reviews.rating) < places.average_rating
ORDER BY COUNT(rating) DESC;
