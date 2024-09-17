<h1 align='center'>Weather - Observation - Station 15</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 15](https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/bc5d0b8c-b9c0-4c9e-9b92-5f9d84de461f)
![image](https://github.com/user-attachments/assets/3d3f2eff-417d-4df1-8890-6469978bdd23)

## Problem Solution
```sql
SELECT ROUND(LONG_W, 4) FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
```

## Problem Solution Explanation
Let's break down the SQL query step by step:

### 1. **Main Query: `SELECT ROUND(LONG_W, 4)`**

- **`SELECT`**: This is used to specify which columns or expressions we want to retrieve from the database.
- **`ROUND(LONG_W, 4)`**: 
  - **`LONG_W`** refers to the longitude of the stations in the table `STATION`.
  - **`ROUND(LONG_W, 4)`** rounds the `LONG_W` value to four decimal places. For example, if `LONG_W` was `45.67891234`, it would be rounded to `45.6789`.
- **This part of the query means**: We are selecting the longitude (`LONG_W`) of a particular station and rounding it to 4 decimal places.

### 2. **FROM STATION**

- **`FROM STATION`**: This indicates that we are retrieving data from the `STATION` table.

### 3. **WHERE LAT_N = (SELECT MAX(LAT_N)...)**

- **`WHERE LAT_N =`**: This clause specifies a condition that filters rows. In this case, we are looking for the row where `LAT_N` (latitude) is equal to a specific value.

#### 4. **Subquery: `(SELECT MAX(LAT_N) ... WHERE LAT_N < 137.2345)`**

- **`(SELECT MAX(LAT_N)`**: This is a subquery (a query within a query). It selects the maximum value of `LAT_N` (latitude) from the `STATION` table.
- **FROM STATION**: This specifies that the data for this subquery is coming from the `STATION` table.
- **WHERE LAT_N < 137.2345**: This condition ensures that we are only considering latitude values that are **less than `137.2345`**.

#### What does this subquery do?
- It finds the largest latitude (`LAT_N`) that is **less than `137.2345`**. The result of this subquery will be a single number, which is the highest latitude smaller than `137.2345`.

### 5. **Putting It All Together**

- **The subquery `(SELECT MAX(LAT_N) ...)`** retrieves the largest latitude (`LAT_N`) from the `STATION` table that is less than `137.2345`.
- The **main query** then retrieves the longitude (`LONG_W`) of the station that has this latitude (`LAT_N`), rounds it to four decimal places, and returns the result.

### Example Scenario

Let's assume the `STATION` table contains the following data:

| LAT_N   | LONG_W |
|---------|--------|
| 137.0000| 12.3456|
| 136.5000| 23.4567|
| 135.0000| 34.5678|
| 134.5000| 45.6789|

- The subquery `SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345` would return `137.0000`, because it is the largest latitude that is smaller than `137.2345`.
- Then, the main query retrieves the `LONG_W` for the row where `LAT_N = 137.0000`, which is `12.3456`.
- Finally, it rounds `12.3456` to 4 decimal places (which remains `12.3456`) and returns that value. 

So the final result would be `12.3456`.
