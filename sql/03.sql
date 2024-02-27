/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
SELECT DISTINCT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.film_id IN (
    SELECT film_id
    FROM (
        SELECT f.film_id, 
               RANK() OVER (ORDER BY SUM(p.amount) DESC) AS profit_rank
        FROM film f
        JOIN inventory inv ON f.film_id = inv.film_id
        JOIN rental ren ON inv.inventory_id = ren.inventory_id
        JOIN payment p ON ren.rental_id = p.rental_id
        GROUP BY f.film_id
    ) AS top_profitable
    WHERE profit_rank <= 5
)
ORDER BY c.customer_id;

