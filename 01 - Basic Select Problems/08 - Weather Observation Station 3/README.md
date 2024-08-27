<h1 align='center'>Weather - Observation - Station 3</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 3](https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/fae8a26e-1ddb-41c8-8af2-5bffeba7b3b4)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE ID%2=0
```

## Problem Solution Explanation
Let's break down the SQL query line by line:

1. **`SELECT DISTINCT CITY`**:
   - **`SELECT`**: This keyword is used to specify the column(s) you want to retrieve from a database table.
   - **`DISTINCT`**: This keyword is used to ensure that only unique (non-duplicate) values are returned. If multiple rows have the same value in the `CITY` column, only one of those rows will be included in the result.
   - **`CITY`**: This specifies the column from which you want to retrieve data. The `CITY` column likely contains the names of cities.

2. **`FROM STATION`**:
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`STATION`**: This is the name of the table from which the data will be selected. The `STATION` table likely contains information about different stations, including their cities and other related data.

3. **`WHERE ID % 2 = 0;`**:
   - **`WHERE`**: This keyword is used to filter records in the table based on a specified condition.
   - **`ID % 2 = 0`**: This condition filters the results to include only those rows where the `ID` column is even. The expression `ID % 2 = 0` checks whether the `ID` is divisible by 2 with no remainder (i.e., whether the `ID` is even). The `%` operator is the modulus operator, which returns the remainder of a division operation.
   - **`;`**: The semicolon marks the end of the SQL statement, indicating that the query is complete and should be executed.

### Summary:
This query retrieves unique city names (`DISTINCT CITY`) from the `STATION` table, but only for rows where the `ID` is an even number (`ID % 2 = 0`). The result will be a list of unique cities associated with even `ID` values from the `STATION` table.
