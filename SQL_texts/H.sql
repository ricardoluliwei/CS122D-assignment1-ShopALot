-- Your boss would like to know the top five store categories (i.e.,thefivecategories that appear the most frequently as a store category) 
-- as well as the number of stores that include each such category and the minimum, maximum, 
-- and average list prices of the products in each such category.


SELECT category
FROM stores s, UNNEST(string_to_array(s.categories, ', ')) as category