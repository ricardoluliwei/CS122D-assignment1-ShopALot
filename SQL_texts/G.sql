-- Continuing from the previous problem, use the UNNEST operator of PostgreSQL to create a normalized list with the store ID, 
-- the name, and the category for each store with a zip code of 44401. 
-- (Keep the list entries for each business together by using an ORDER BY clause.)


SELECT s.store_id, s.name, category
FROM stores s, UNNEST(string_to_array(s.categories, ', ')) as category
WHERE s.zip_code = '44401'
ORDER BY s.store_id