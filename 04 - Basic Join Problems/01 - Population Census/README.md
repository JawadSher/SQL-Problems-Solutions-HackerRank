<h1 align='center'>Population - Census</h1>

## Problem Statement

**Problem URL :** [Population Census](https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/2b31e769-a8a6-4f9c-91e6-e3ab6604a016)
![image](https://github.com/user-attachments/assets/d6045576-2e3c-4516-8304-2292fa12eae5)

## Problem Solution
```sql
SELECT SUM(CITY.POPULATION) FROM CITY INNER JOIN COUNTRY ON
CITY.CountryCode = COUNTRY.Code WHERE CONTINENT = 'Asia';
```

## Problem Solution Explanation
Let's break down the SQL query line by line:

### Line 1: `SELECT SUM(CITY.POPULATION)`
- **`SELECT`**: This keyword is used to indicate the columns or expressions you want to retrieve from a database table. In this case, the query asks to retrieve a calculated value.
- **`SUM(CITY.POPULATION)`**: The `SUM` function adds up the values in the `POPULATION` column from the `CITY` table. Each row in the result set will contribute its population to this sum. This means that the total population of all the cities that meet the conditions will be calculated.

### Line 2: `FROM CITY`
- **`FROM`**: Specifies the table from which to retrieve data. Here, the query pulls data from the `CITY` table, which contains information about various cities, including their population and country codes.

### Line 3: `INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code`
- **`INNER JOIN`**: This clause combines rows from two tables based on a related column. The `INNER JOIN` ensures that only rows that have matching values in both tables will be included in the result.
- **`CITY.CountryCode = COUNTRY.Code`**: This part defines the condition for the join. The `CountryCode` column from the `CITY` table must match the `Code` column from the `COUNTRY` table. This relationship allows us to link each city to its respective country.

### Line 4: `WHERE CONTINENT = 'Asia'`
- **`WHERE`**: This clause is used to filter the results by specifying a condition.
- **`CONTINENT = 'Asia'`**: This condition filters the rows so that only cities in countries located in the continent of Asia are included in the result set. The `CONTINENT` column comes from the `COUNTRY` table, and it ensures that only cities from Asian countries are considered.

### Query Summary
This query performs the following actions:
1. It joins the `CITY` and `COUNTRY` tables using the `CountryCode` in the `CITY` table and the `Code` in the `COUNTRY` table.
2. It filters the result to only include cities that belong to countries in the continent of Asia.
3. It sums the population of all the cities that meet these criteria and returns the total population.
