<h1 align='center'>Revising - Aggregations - The - Count - Function</h1>

## Problem Statement

**Problem URL :** [Revising Aggregations - The Count Function](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/7e77a2db-3fb0-4bea-bf0c-514c2ad4cff3)

## Problem Solution
```sql
SELECT COUNT(NAME) FROM CITY
WHERE POPULATION > 100000
```

## Problem Solution Explanation
Let's break down the SQL query `SELECT COUNT(NAME) FROM CITY WHERE POPULATION > 100000` line by line:

### 1. `SELECT COUNT(NAME)`
- **`SELECT`**: This is the SQL keyword used to specify that you're retrieving data from a database.
- **`COUNT(NAME)`**: The `COUNT` function is an aggregate function in SQL that counts the number of rows that match the specified condition. In this case, `COUNT(NAME)` is counting how many rows in the `CITY` table have a non-NULL value in the `NAME` column. 
  - Note: Even though it is counting rows based on the `NAME` column, it doesn't necessarily mean it is counting unique names. It's simply counting how many cities (rows) satisfy the condition in the `WHERE` clause.

### 2. `FROM CITY`
- **`FROM CITY`**: This indicates the table from which data is being retrieved. In this case, the data is being fetched from the `CITY` table.

### 3. `WHERE POPULATION > 100000`
- **`WHERE`**: This keyword introduces a condition to filter the data that is being retrieved.
- **`POPULATION > 100000`**: This is the condition being applied. It filters the rows so that only cities with a population greater than 100,000 are included in the result. 

### Putting it all together:
- The query retrieves the count of city names from the `CITY` table where the city's population exceeds 100,000.
- The result is a single number, representing how many cities in the table have a population greater than 100,000.
