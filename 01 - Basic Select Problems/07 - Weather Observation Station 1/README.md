<h1 align='center'>Weather - Observation - Station 1</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 1](https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/ae3f48b4-0915-48ec-9302-3ba7d7d5cfd1)


## Problem Solution
```sql
SELECT CITY, STATE FROM STATION
```

## Problem Solution Explanation

Let's break down the SQL query line by line:

1. **`SELECT CITY, STATE`**:
   - **`SELECT`**: This keyword is used to specify the columns you want to retrieve from a database table.
   - **`CITY, STATE`**: These are the specific columns that you want to retrieve. The `CITY` column likely contains the names of cities, and the `STATE` column likely contains the names or codes of the states corresponding to those cities.

2. **`FROM STATION`**:
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`STATION`**: This is the name of the table from which the data will be selected. The `STATION` table likely contains records related to different stations, including their cities and states.

3. **`;`**:
   - The semicolon marks the end of the SQL statement, indicating that the query is complete and should be executed.

### Summary:
This query retrieves data from the `CITY` and `STATE` columns in the `STATION` table. The result will be a list of all cities and their corresponding states from the `STATION` table.
