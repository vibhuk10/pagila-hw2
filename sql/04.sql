/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
SELECT DISTINCT f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE c.customer_id = 1
AND f.film_id IN (
    SELECT f.film_id
    FROM rental r2
    JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
    JOIN film f ON i2.film_id = f.film_id
    WHERE r2.customer_id = c.customer_id
    GROUP BY f.film_id
    HAVING COUNT(r2.rental_id) > 1
);

