/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT
    special_features,
    COUNT(*)
FROM (
    SELECT
        UNNEST(special_features) AS special_features
    FROM film
) AS unnested_special_features
GROUP BY
    special_features
ORDER BY
    special_features;
