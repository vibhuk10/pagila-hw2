/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
*/
SELECT DISTINCT title
FROM film
WHERE rating = 'G'
AND film_id IN (
    SELECT film_id
    FROM film
    where rating = 'G' and 'Trailers' = ANY(special_features)
)
ORDER BY title;
