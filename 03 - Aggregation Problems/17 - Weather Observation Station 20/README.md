<h1 align='center'>Weather - Observation - Station 20</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/3bb29be3-7d1d-42a4-97e1-c16b6044ebbe)
![image](https://github.com/user-attachments/assets/781651a8-e2ac-4300-949b-e14aa91c3dd7)

## Problem Solution
```sql
WITH LAT AS( SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N DESC) AS RN FROM STATION )
SELECT ROUND(LAT_N,4) FROM LAT WHERE RN = (SELECT CEIL(MAX(RN)/2) FROM LAT)

```

## Problem Solution Explanation
Let's break down the SQL query step by step to understand how it works.

### Overall Purpose:
This query finds the median latitude value (`LAT_N`) from the `STATION` table. It does this by first assigning row numbers to the latitudes, ordering them in descending order, and then selecting the middle row (the median).

### Part 1: `WITH` Clause (Common Table Expression - CTE)

```sql
WITH LAT AS (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N DESC) AS RN 
    FROM STATION
)
```

1. **`WITH LAT AS (...)`**:  
   This introduces a Common Table Expression (CTE) named `LAT`. It allows you to define a temporary result set, which can be referenced in the main query.

2. **`SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N DESC) AS RN`**:  
   - `LAT_N`: This column contains latitude values from the `STATION` table.
   - `ROW_NUMBER() OVER (ORDER BY LAT_N DESC)`:  
     - `ROW_NUMBER()` is a window function that assigns a unique row number to each row in the result set. 
     - `ORDER BY LAT_N DESC` sorts the rows based on the latitude (`LAT_N`) values in descending order, meaning the largest latitude will have row number 1.
     - `AS RN`: This aliases the generated row number as `RN` (Row Number).

3. **`FROM STATION`**:  
   The data is selected from the `STATION` table, which contains latitude (`LAT_N`) values.

At this point, the CTE `LAT` contains two columns:
- `LAT_N`: The latitude values.
- `RN`: The row numbers corresponding to each latitude, ordered by latitude in descending order.

### Part 2: Main Query

```sql
SELECT ROUND(LAT_N, 4) 
FROM LAT 
WHERE RN = (SELECT CEIL(MAX(RN)/2) FROM LAT)
```

1. **`SELECT ROUND(LAT_N, 4)`**:  
   - This selects the `LAT_N` value from the `LAT` CTE.
   - `ROUND(LAT_N, 4)`: The `LAT_N` value is rounded to 4 decimal places using the `ROUND` function.

2. **`FROM LAT`**:  
   - Data is retrieved from the CTE `LAT`, which holds the latitude values and their corresponding row numbers.

3. **`WHERE RN = (SELECT CEIL(MAX(RN)/2) FROM LAT)`**:  
   - This condition filters the rows to select the one where the row number (`RN`) is equal to a calculated value.
   - **Subquery Explanation**:
     - `SELECT MAX(RN)`: Finds the highest row number in the CTE, which corresponds to the total number of rows in the dataset.
     - `MAX(RN)/2`: Divides the maximum row number by 2 to find the position of the middle row (which is the median position). If there is an odd number of rows, this would return a fractional value.
     - `CEIL(...)`: The `CEIL` function rounds up the result to the nearest whole number. This is used to handle cases where the number of rows is odd (e.g., `CEIL(3/2)` results in 2).

4. **The Subquery's Purpose**:  
   The subquery `(SELECT CEIL(MAX(RN)/2) FROM LAT)` calculates the row number of the middle latitude. This value is then used in the `WHERE` clause to filter and select the latitude value at that specific row number.

### Summary
1. The `WITH` clause creates a temporary table (`LAT`) where each row has a latitude (`LAT_N`) and a row number (`RN`), with latitudes ordered in descending order.
2. The main query selects the middle latitude value (the median) from this list, rounding it to 4 decimal places.
3. The median is found by calculating the row number that corresponds to the middle of the ordered list using `CEIL(MAX(RN)/2)`, ensuring that the query works for both even and odd numbers of rows.

In essence, this query finds and returns the median latitude from the `STATION` table, rounded to 4 decimal places.
