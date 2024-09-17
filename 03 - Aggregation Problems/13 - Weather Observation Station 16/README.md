<h1 align='center'>Weather - Observation - Station 16</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 16](https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/bb9e174b-8f20-4435-bdcf-38b430808fdf)
![image](https://github.com/user-attachments/assets/17c09cd7-c714-474e-b8f8-c6531caebdc5)

## Problem Solution
```sql
SELECT ROUND(MIN(LAT_N), 4) FROM STATION
WHERE LAT_N > 38.7780
```

## Problem Solution Explanation
Let's break down this SQL query step by step:

### 1. **Main Query: `SELECT ROUND(MIN(LAT_N), 4)`**

- **`SELECT`**: This is the SQL keyword that specifies which columns or expressions we want to retrieve from the database.
- **`MIN(LAT_N)`**: 
  - **`MIN(LAT_N)`** is an **aggregate function** that finds the **minimum value** of the `LAT_N` (latitude) column from the rows that meet the conditions specified.
  - The **`MIN`** function returns the smallest value of `LAT_N` for the set of data that satisfies the condition in the `WHERE` clause (which we will explain next).
- **`ROUND(MIN(LAT_N), 4)`**:
  - **`ROUND`** is a function used to round numerical values.
  - **`ROUND(MIN(LAT_N), 4)`** rounds the result of the **`MIN(LAT_N)`** expression to 4 decimal places.
  
#### What this part means:
- This expression selects the minimum latitude (`LAT_N`), then rounds that minimum value to 4 decimal places.

### 2. **FROM STATION**

- **`FROM STATION`**: This specifies the table from which the data is being retrieved. In this case, the table is called `STATION`.

### 3. **WHERE LAT_N > 38.7780**

- **`WHERE LAT_N > 38.7780`**:
  - The **`WHERE`** clause filters the rows to only include those where the latitude (`LAT_N`) is **greater than `38.7780`**.
  - This condition ensures that we only consider rows where the latitude value is **larger** than `38.7780`.

#### What does this part do?
- It selects only the rows from the `STATION` table where the latitude (`LAT_N`) is greater than `38.7780`.

### 4. **Putting It All Together**

- The query first filters the rows where `LAT_N > 38.7780`. 
- From these filtered rows, it finds the **smallest `LAT_N`** using `MIN(LAT_N)`.
- Then, it **rounds that minimum latitude to 4 decimal places** using the `ROUND(MIN(LAT_N), 4)` function.
- Finally, the rounded minimum latitude value is returned.

### Example Scenario

Let's assume the `STATION` table contains the following data:

| LAT_N   | LONG_W |
|---------|--------|
| 39.1234 | 12.3456|
| 40.5678 | 23.4567|
| 37.7890 | 34.5678|
| 38.9999 | 45.6789|

- The **`WHERE LAT_N > 38.7780`** clause filters out rows where `LAT_N <= 38.7780`. So, it removes the row with `LAT_N = 37.7890`.
- The remaining rows have latitudes: `39.1234`, `40.5678`, and `38.9999`.
- The **`MIN(LAT_N)`** function finds the smallest value among these latitudes, which is `38.9999`.
- The **`ROUND(38.9999, 4)`** function rounds this value to four decimal places, so it remains `38.9999`.

Therefore, the final result of the query would be `38.9999`.
