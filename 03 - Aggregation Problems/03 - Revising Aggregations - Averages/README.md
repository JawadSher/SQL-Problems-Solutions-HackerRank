<h1 align='center'>Revising - Aggregations - Averages</h1>

## Problem Statement

**Problem URL :** [Revising Aggregations - Averages](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/8f6658b6-26bf-4c14-b5f6-f82d0a99c2ee)

## Problem Solution
```sql
SELECT AVG(POPULATION) FROM CITY
WHERE DISTRICT = 'California'
```

## Problem Solution Explanation
Let's break down the SQL query `SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = 'California'` line by line:

### 1. `SELECT AVG(POPULATION)`
- **`SELECT`**: This keyword is used to retrieve data from the database.
- **`AVG(POPULATION)`**: The `AVG` function is an aggregate function in SQL that calculates the average value of a numeric column. In this case, `AVG(POPULATION)` computes the average population of all cities that meet the condition in the `WHERE` clause.
  - The **`POPULATION`** column holds the population values for each city. The `AVG` function adds up all the population values for the filtered cities and divides that sum by the number of cities, giving the average population.

### 2. `FROM CITY`
- **`FROM CITY`**: This specifies the table from which data is being retrieved. Here, the `CITY` table is used, which likely contains details like city names, population, and district information for various cities.

### 3. `WHERE DISTRICT = 'California'`
- **`WHERE`**: The `WHERE` clause is used to filter the rows of data based on specific criteria.
- **`DISTRICT = 'California'`**: This condition filters the rows, so only cities that belong to the district named 'California' are included in the calculation. The `DISTRICT` column likely contains the name of the district or administrative region each city belongs to.
  - Only cities with a `DISTRICT` value equal to 'California' will be considered for the average population calculation.

### Putting it all together:
- The query calculates the average population (`AVG(POPULATION)`) for all cities in the `CITY` table where the `DISTRICT` is 'California.'
- The result will be a single number representing the average population of all cities in the district of 'California.'
