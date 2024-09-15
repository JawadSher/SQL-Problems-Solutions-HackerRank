<h1 align='center'>Average - Population</h1>

## Problem Statement

**Problem URL :** [Average Population](https://www.hackerrank.com/challenges/average-population/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/2a186b7c-f785-493f-b40a-5eb712ebad49)

## Problem Solution
```sql
SELECT FLOOR(AVG(POPULATION)) FROM CITY
```

## Problem Solution Explanation

Let's break down the SQL query `SELECT FLOOR(AVG(POPULATION)) FROM CITY` line by line:

### 1. `SELECT FLOOR(AVG(POPULATION))`
- **`SELECT`**: This keyword is used to specify that you are retrieving data from a database.
  
- **`AVG(POPULATION)`**: 
  - `AVG` is an aggregate function that calculates the **average value** of the specified column. 
  - In this case, `AVG(POPULATION)` calculates the average population of all the cities in the `CITY` table.
  
- **`FLOOR(AVG(POPULATION))`**:
  - `FLOOR()` is a mathematical function that takes a numeric value and **rounds it down** to the nearest integer.
  - Here, the `FLOOR` function is applied to the result of the `AVG(POPULATION)` function, rounding down the average population to the nearest integer.
  - For example, if `AVG(POPULATION)` returns `1025.8`, `FLOOR()` will round it down to `1025`.
  
  - **Key Point**: The `FLOOR()` function always rounds down to the largest integer that is less than or equal to the value, even if the number is already a whole number (in which case it remains unchanged).

### 2. `FROM CITY`
- **`FROM CITY`**: 
  - This specifies the table from which to retrieve the data. In this case, the `CITY` table is used, which contains information such as city names and populations.

### Putting it all together:
- The query calculates the average population of all cities in the `CITY` table using `AVG(POPULATION)`.
- The `FLOOR` function is then applied to the result, ensuring that the average is rounded down to the nearest integer.
- The final output is a single integer value representing the average population of all cities, rounded down.

### Example:
If the population values in the `CITY` table were 500, 1200, 1500, and 1800:
1. `AVG(POPULATION)` = (500 + 1200 + 1500 + 1800) / 4 = 1250.
2. `FLOOR(1250)` = 1250 (since it's already a whole number, the result remains unchanged).

If the average was `1250.9`, `FLOOR(1250.9)` would return `1250`.
