-- People like to shop for everything they need at one stop if possible, 
-- which means that a store with a larger variety of categories may be more attractive to customers. 
-- Read the “Hints on Multivalued Data” appendix at the end of this assignment. 
-- Use the PostgreSQL string_to_array() function to list the store ID, the name, the store’s category list, 
-- and the length of the list for each store with a zip code of 44401. You may also find the array_length() function useful.


SELECT s.store_id, s.name, 