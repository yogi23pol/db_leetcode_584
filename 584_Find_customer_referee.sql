# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem 

Create table If Not Exists Customer_9 
(
id int, 
name varchar(25), 
referee_id int
);

Truncate table Customer_9;
insert into Customer_9 (id, name, referee_id) values ('1', 'Will', NULL);
insert into Customer_9 (id, name, referee_id) values ('2', 'Jane', NULL);
insert into Customer_9 (id, name, referee_id) values ('3', 'Alex', '2');
insert into Customer_9 (id, name, referee_id) values ('4', 'Bill', NULL);
insert into Customer_9 (id, name, referee_id) values ('5', 'Zack', '1');
insert into Customer_9 (id, name, referee_id) values ('6', 'Mark', '2');

/** 
Q. Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

Example 1:
Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

**/

# TYPE 1 :-

SELECT * FROM Customer_9;
SELECT name 
FROM Customer_9
WHERE referee_id<>2 OR referee_id IS NULL;

# this code exclude null value.
# SELECT name FROM Customer WHERE id NOT IN (2);

# TYPE 2 :- subquery

SELECT name 
FROM Customer 
WHERE id NOT IN (SELECT id FROM Customer WHERE referee_id = 2);