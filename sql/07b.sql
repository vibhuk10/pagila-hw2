/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN (
    SELECT f.film_id
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
    JOIN city ct ON a.city_id = ct.city_id
    JOIN country co ON ct.country_id = co.country_id
    WHERE co.country like 'United States'
) us_films ON f.film_id = us_films.film_id
WHERE us_films.film_id IS NULL
ORDER BY f.title;
