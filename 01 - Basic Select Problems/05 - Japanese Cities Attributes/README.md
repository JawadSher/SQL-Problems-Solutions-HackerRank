<h1 align='center'>Japanese - Cities - Attributes</h1>

## Problem Statement

**Problem URL :** [Japanese Cities' Attributes](https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/17095222-4ca6-4db3-84dd-3c16adb9b6b5)


## Problem Solution
```sql
SELECT * FROM CITY
WHERE COUNTRYCODE='JPN'
```

## Problem Solution Explanation
Let's break down the SQL query line by line:

1. **Line 1: `SELECT *`**
   - **`SELECT`**: This keyword is used to specify the columns you want to retrieve from a database table.
   - **`*`**: The asterisk (`*`) is a wildcard character that indicates you want to select all columns from the table. This means that all the data in each column of the rows that meet the condition will be retrieved.

2. **Line 2: `FROM CITY`**
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`CITY`**: This is the name of the table from which the data will be selected. The table `CITY` likely contains data about various cities, including their names, population, and associated country codes.

3. **Line 3: `WHERE COUNTRYCODE = 'JPN';`**
   - **`WHERE`**: This keyword is used to filter the records in the table based on a specific condition.
   - **`COUNTRYCODE = 'JPN'`**: This condition filters the results to include only the rows where the `COUNTRYCODE` column has the value `'JPN'`. The `COUNTRYCODE` column likely stores the code representing the country associated with each city. In this case, `'JPN'` stands for Japan, so the query is looking for cities located in Japan.
   - **`;`**: The semicolon marks the end of the SQL statement, indicating that the query is complete and ready for execution.

### Summary:
This query selects all columns (`*`) from the `CITY` table but only for the rows where the `COUNTRYCODE` is `'JPN'`. The result will be a list of cities in Japan, with all the details from the `CITY` table for each of those cities.
