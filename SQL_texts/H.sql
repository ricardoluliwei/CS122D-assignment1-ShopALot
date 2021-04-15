-- Your boss would like to know the top five store categories (i.e.,thefivecategories that appear the most frequently as a store category) 
-- as well as the number of stores that include each such category and the minimum, maximum, 
-- and average list prices of the products in each such category.

WITH category_count AS (
SELECT category, COUNT (DISTINCT s.store_id) as num_stores
FROM stores s, UNNEST(string_to_array(s.categories, ', ')) as category
GROUP BY category
ORDER BY num_stores DESC
LIMIT 5
)

SELECT cc.category, cc.num_stores, MIN(p.list_price), MAX(p.list_price), AVG(p.list_price)
FROM category_count AS cc, products AS p
WHERE cc.category = p.category
GROUP BY cc.category, cc.num_stores
ORDER BY cc.num_stores DESC
;