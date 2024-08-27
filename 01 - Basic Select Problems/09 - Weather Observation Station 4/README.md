<h1 align='center'>Weather - Observation - Station 4</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 4](https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/1835ef77-6b32-4af4-b4ec-fa364d079f3b)
![image](https://github.com/user-attachments/assets/73aab2ca-0ca1-48a9-8499-62d7689ec397)

## Problem Solution
```sql
SELECT COUNT(CITY) - COUNT(DISTINCT(CITY)) FROM STATION
```

## Problem Solution Explanation

Let's break down the SQL query line by line:

1. **`SELECT COUNT(CITY) - COUNT(DISTINCT CITY)`**:
   - **`COUNT(CITY)`**: The `COUNT()` function counts the number of rows where the `CITY` column is not `NULL`. This will return the total number of city entries in the `CITY` column, including duplicates.
   - **`COUNT(DISTINCT CITY)`**: The `COUNT(DISTINCT CITY)` function counts the number of unique city names in the `CITY` column. This will return the number of different city names, ignoring duplicates.
   - **`COUNT(CITY) - COUNT(DISTINCT CITY)`**: This expression subtracts the count of distinct city names from the total count of city entries. The result will be the number of duplicate city names in the `CITY` column.

2. **`FROM STATION`**:
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`STATION`**: This is the name of the table from which the data will be selected. The `STATION` table likely contains records of different stations, including their associated city names.

3. **`;`**:
   - The semicolon marks the end of the SQL statement, indicating that the query is complete and should be executed.

### Summary:
This query calculates the number of duplicate city names in the `STATION` table. Here's how it works:
- **`COUNT(CITY)`** counts all city entries, including duplicates.
- **`COUNT(DISTINCT CITY)`** counts only the unique city names.
- By subtracting the count of unique city names from the total count, the query returns the number of duplicate city names in the `CITY` column. This result tells you how many city names appear more than once in the `STATION` table.
