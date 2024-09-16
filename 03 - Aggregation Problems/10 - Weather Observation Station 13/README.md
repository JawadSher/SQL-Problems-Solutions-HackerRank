<h1 align='center'>Weather - Observation - Station 13</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 13](https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/750a3704-5759-4c2a-af01-2f8adbb4e01b)
![image](https://github.com/user-attachments/assets/30a9772e-0c1d-4ce5-a805-87ecb7a0ccd0)

## Problem Solution
```sql
SELECT ROUND(SUM(LAT_N), 4) FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N <137.2345;
```

## Problem Solution Explanation
Let's break down the SQL query and explain each part in detail:

1. **SELECT ROUND(SUM(LAT_N), 4)**

   - `SELECT`: This clause tells the database to retrieve specific data. In this case, it specifies that we want to compute a calculation involving the `LAT_N` column.
   
   - **`SUM(LAT_N)`**: 
     - This function computes the total sum of all values in the `LAT_N` column that meet the condition specified in the `WHERE` clause.
     - `LAT_N` typically represents the latitude values for different stations (likely geographical locations) stored in the `STATION` table.
     - Example: If `LAT_N` values are `39.50`, `40.75`, and `42.30`, the sum would be `39.50 + 40.75 + 42.30 = 122.55`.
   
   - **`ROUND(SUM(LAT_N), 4)`**: 
     - The `ROUND` function is used to round the result of `SUM(LAT_N)` to 4 decimal places.
     - `ROUND(expression, 4)` means that the value from `SUM(LAT_N)` will be rounded to exactly **4 decimal places**.
     - Example: If the sum of `LAT_N` is `122.5556`, rounding it to 4 decimal places would give `122.5556`. If the sum was `122.55567`, it would be rounded to `122.5557`.

2. **FROM STATION**

   - `FROM STATION`: 
     - This part of the query specifies that the data is being retrieved from the `STATION` table.
     - The `STATION` table likely contains information about various stations or geographical locations, including their latitude (`LAT_N`) and possibly longitude (`LONG_W`).

3. **WHERE LAT_N > 38.7880 AND LAT_N < 137.2345**

   - **`WHERE`**: 
     - The `WHERE` clause is used to filter the data based on specific conditions. It ensures that only rows (or stations) that meet certain criteria will be included in the calculation.
   
   - **`LAT_N > 38.7880 AND LAT_N < 137.2345`**:
     - This condition filters the rows by only selecting stations where the `LAT_N` value (latitude) is **greater than 38.7880** and **less than 137.2345**.
     - Only those latitude values that fall within this specified range will be considered in the sum.
     - Example: If the latitude values in the table are `39.50`, `40.75`, and `137.50`, the `WHERE` clause will only include `39.50` and `40.75` because `137.50` does not satisfy the condition of being less than `137.2345`.

### Summary of the Query:

- **Filter**: The query filters the data to only include rows where the `LAT_N` values (latitude) are greater than `38.7880` and less than `137.2345`.
- **Sum**: It then computes the sum of the selected `LAT_N` values.
- **Round**: The resulting sum is rounded to 4 decimal places.
  
### Example:

Suppose the `STATION` table contains the following data:

| Station_ID | LAT_N  |
|------------|--------|
| 1          | 39.50  |
| 2          | 40.75  |
| 3          | 137.50 |
| 4          | 136.90 |

- **Filter step**: 
  - The condition `LAT_N > 38.7880 AND LAT_N < 137.2345` excludes the latitude value `137.50`, as it is greater than `137.2345`.
  - So, the selected `LAT_N` values will be `39.50`, `40.75`, and `136.90`.

- **SUM(LAT_N)**:
  - The sum of the selected values is `39.50 + 40.75 + 136.90 = 217.15`.

- **ROUND(SUM(LAT_N), 4)**:
  - Since the sum is `217.15`, rounding it to 4 decimal places gives `217.1500`.

### Output Example:

| ROUND(SUM(LAT_N), 4) |
|----------------------|
| 217.1500             |

This would be the final output, representing the rounded sum of the `LAT_N` values that fall within the specified range.
