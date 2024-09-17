<h1 align='center'>Weather - Observation - Station 17</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 17](https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/fd994dcd-17c2-4c56-b5fc-0ceb9022d22c)
![image](https://github.com/user-attachments/assets/499ce2d6-e5cc-446d-b41c-2fecad1b0aff)

## Problem Solution
```sql
SELECT ROUND(LONG_W, 4) FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);
```

## Problem Solution Explanation
Let's break down the SQL query step by step to explain it in detail:

### 1. **Main Query: `SELECT ROUND(LONG_W, 4)`**

- **`SELECT`**: This is the SQL command that specifies which columns or expressions we want to retrieve from the database.
- **`ROUND(LONG_W, 4)`**:
  - **`LONG_W`** refers to the column that stores longitude values in the `STATION` table.
  - **`ROUND(LONG_W, 4)`** rounds the `LONG_W` value to 4 decimal places. For example, if `LONG_W` is `45.67891234`, it will be rounded to `45.6789`.
  
#### This part of the query means:
- We are selecting the longitude (`LONG_W`) of a station and rounding it to four decimal places.

### 2. **FROM STATION**

- **`FROM STATION`**: This indicates that the data is being retrieved from the `STATION` table.

### 3. **WHERE LAT_N = (...)**

- **`WHERE LAT_N =`**: This is a condition that filters the rows in the `STATION` table. 
  - It specifies that we only want to retrieve the longitude (`LONG_W`) for the station where the latitude (`LAT_N`) matches a specific value.
  - The value of `LAT_N` is determined by a subquery (the query inside the parentheses).

### 4. **Subquery: `(SELECT MIN(LAT_N) ... WHERE LAT_N > 38.7780)`**

- **`(SELECT MIN(LAT_N)`**: 
  - This is a **subquery** (a query inside another query).
  - **`MIN(LAT_N)`** is an aggregate function that retrieves the smallest latitude (`LAT_N`) value from the rows that meet the condition specified in the `WHERE` clause of the subquery.
  
#### What does `MIN(LAT_N)` do?
- It calculates the minimum (smallest) latitude (`LAT_N`) among the stations that meet the condition (`LAT_N > 38.7780`).

- **FROM STATION**: This specifies that the data for the subquery is also coming from the `STATION` table.
  
- **WHERE LAT_N > 38.7780**: 
  - This condition filters the rows to only include those where the latitude (`LAT_N`) is **greater than 38.7780**.
  - The subquery will only consider rows where `LAT_N > 38.7780` when calculating the minimum value.

### 5. **How the Subquery Works**

- The subquery retrieves the **smallest latitude** (`LAT_N`) that is greater than `38.7780` from the `STATION` table.
- The result of the subquery is a single value (the minimum latitude), which is then used in the main query's `WHERE` condition to find the station with that latitude.

### 6. **Putting It All Together**

- **The subquery** `(SELECT MIN(LAT_N) ... WHERE LAT_N > 38.7780)` finds the smallest latitude that is **greater than 38.7780**.
- **The main query** then retrieves the longitude (`LONG_W`) of the station whose latitude matches that value.
- **The `ROUND(LONG_W, 4)` function** ensures that the retrieved longitude is rounded to 4 decimal places before being returned.

### Example Scenario

Let's assume the `STATION` table contains the following data:

| LAT_N   | LONG_W |
|---------|--------|
| 38.5000 | 12.3456|
| 39.1234 | 23.4567|
| 40.5678 | 34.5678|
| 37.7890 | 45.6789|

- The **subquery** `SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780` will return `39.1234`, because it is the smallest latitude that is greater than `38.7780`.
  
- The **main query** will then retrieve the `LONG_W` (longitude) where `LAT_N = 39.1234`. From the table, the corresponding longitude is `23.4567`.

- Finally, the **`ROUND(LONG_W, 4)`** function rounds the longitude value `23.4567` to four decimal places. Since it already has four decimal places, the result remains `23.4567`.

### Final Result

The final result of this query would be `23.4567`, which is the longitude of the station with the smallest latitude greater than `38.7780`.
