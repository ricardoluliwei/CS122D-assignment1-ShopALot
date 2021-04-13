CREATE TABLE Person ( 
    id int,
    name varchar(20),
    hobbies varchar(80)
);

INSERT INTO Person VALUES
(1, 'Joe Cool', 'karate,skiing,skydiving'),
(2, 'Susan Smith', 'scuba,piano'),
(3, 'Hans Solo', 'flying');

SELECT * FROM Person p;
SELECT p.id, p.name, string_to_array(p.hobbies,',')

FROM Person p;
SELECT p.id, p.name, hobby
FROM Person p, UNNEST(string_to_array(p.hobbies,',')) AS hobby ORDER BY p.id;