<h1 align='center'>Revising - Aggregations - The - Sum - Function</h1>

## Problem Statement

**Problem URL :** [Revising Aggregations - The Sum Function](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/aa5f83af-2121-4ee8-a0ba-57f1cd250e07)

## Problem Solution
```sql
SELECT SUM(POPULATION) FROM CITY
WHERE DISTRICT = 'California'
```

## Problem Solution Explanation
Let's break down the SQL query `SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = 'California'` line by line:

### 1. `SELECT SUM(POPULATION)`
- **`SELECT`**: This is the SQL keyword used to specify that you're retrieving data from the database.
- **`SUM(POPULATION)`**: The `SUM` function is an aggregate function that adds up all the values in the specified column. In this case, `SUM(POPULATION)` calculates the total population for all cities that meet the condition in the `WHERE` clause. 
  - The `POPULATION` column stores the population data for each city in the `CITY` table. 
  - The result will be a single number that represents the sum of the populations of all cities in the specified district.

### 2. `FROM CITY`
- **`FROM CITY`**: This specifies the table from which data is being retrieved. Here, the data is being pulled from the `CITY` table, which contains information about different cities.

### 3. `WHERE DISTRICT = 'California'`
- **`WHERE`**: This introduces a condition that filters the rows of the `CITY` table.
- **`DISTRICT = 'California'`**: This condition filters the data so that only cities where the `DISTRICT` is 'California' are included. The `DISTRICT` column likely contains the name of the district or region each city belongs to. 
  - In this case, only cities located in the district labeled 'California' will be considered for the population summing.

### Putting it all together:
- The query calculates the total population (`SUM(POPULATION)`) of all cities located in the district labeled as 'California' in the `CITY` table.
- The result is a single number representing the sum of the population of all cities in 'California.'
