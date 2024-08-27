<h1 align='center'>Japanese - Cities - Names</h1>

## Problem Statement

**Problem URL :** [Japanese Cities' Names](https://www.hackerrank.com/challenges/japanese-cities-name/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/f167cdfb-4e46-4ce5-a97a-df9a76f35479)

## Problem Solution
```sql
SELECT NAME FROM CITY
WHERE COUNTRYCODE='JPN'
```

## Problem Solution Explanation

Let's break down the SQL query line by line:

1. **`SELECT NAME`**:
   - **`SELECT`**: This keyword is used to specify the column(s) you want to retrieve from a database table.
   - **`NAME`**: This indicates that you want to retrieve data from the `NAME` column only. The `NAME` column likely contains the names of the cities.

2. **`FROM CITY`**:
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`CITY`**: This is the name of the table from which the data will be selected. The `CITY` table likely contains records about various cities, including their names, populations, and associated country codes.

3. **`WHERE COUNTRYCODE = 'JPN';`**:
   - **`WHERE`**: This keyword is used to filter records in the table based on a specified condition.
   - **`COUNTRYCODE = 'JPN'`**: This condition filters the results to include only those rows where the `COUNTRYCODE` column has the value `'JPN'`. The `COUNTRYCODE` column stores a code representing the country associated with each city. In this case, `'JPN'` stands for Japan, so the query will return the names of cities located in Japan.
   - **`;`**: The semicolon marks the end of the SQL statement, indicating that the query is complete and should be executed.

### Summary:
This query retrieves the names of all cities from the `CITY` table where the `COUNTRYCODE` is `'JPN'`. The result will be a list of city names in Japan.
