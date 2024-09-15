<h1 align='center'>Japan - Population</h1>

## Problem Statement

**Problem URL :** [Japan Population](https://www.hackerrank.com/challenges/japan-population/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/fd4286a2-6f43-4d83-b98e-6659d73a0dd6)

## Problem Solution
```sql
SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE = 'JPN'
```

## Problem Solution Explanation
Let's break down the SQL query `SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN'` line by line:

### 1. `SELECT SUM(POPULATION)`
- **`SELECT`**: This keyword specifies that you're retrieving data from a database.
  
- **`SUM(POPULATION)`**: 
  - `SUM` is an aggregate function that calculates the total (sum) of a numeric column.
  - Here, `SUM(POPULATION)` adds up the values in the `POPULATION` column for all rows that meet the condition in the `WHERE` clause.
  - The result will be a single number representing the total population of the selected cities.

### 2. `FROM CITY`
- **`FROM CITY`**: 
  - This indicates the table from which the data is being retrieved. In this case, the `CITY` table is used, which contains data about various cities, including their populations and country codes.

### 3. `WHERE COUNTRYCODE = 'JPN'`
- **`WHERE`**: This keyword filters the data to include only the rows that meet a specific condition.
  
- **`COUNTRYCODE = 'JPN'`**:
  - This condition specifies that only rows (cities) where the `COUNTRYCODE` column is equal to `'JPN'` are included in the calculation.
  - The `COUNTRYCODE` column contains a three-letter code that represents the country each city belongs to. `'JPN'` is the code for Japan.
  - So, this clause filters the data to include only cities that are in Japan.

### Putting it all together:
- The query calculates the total population (`SUM(POPULATION)`) of all cities in Japan (where `COUNTRYCODE = 'JPN'`).
- The result is a single number, which is the sum of the population of all Japanese cities in the `CITY` table.

### Example:
If the `CITY` table contains the following data for Japanese cities:

| Name    | Population | CountryCode |
|---------|------------|-------------|
| Tokyo   | 9,273,000  | JPN         |
| Osaka   | 2,691,000  | JPN         |
| Kyoto   | 1,475,000  | JPN         |

The query would sum the populations of these cities:
- `SUM(POPULATION) = 9,273,000 + 2,691,000 + 1,475,000 = 13,439,000`

The result of the query would be `13,439,000`.
