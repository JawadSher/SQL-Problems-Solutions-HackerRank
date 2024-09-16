<h1 align='center'>Weather - Observation - Station 14</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 14](https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/27388f77-064d-4c24-a824-b77e56a5380a)
![image](https://github.com/user-attachments/assets/3a4e5195-cb3d-40b9-887b-7210233bd5ff)

## Problem Solution
```sql
SELECT ROUND(MAX(LAT_N), 4) FROM STATION 
WHERE LAT_N < 137.2345;
```

## Problem Solution Explanation
Let's break down the SQL query and explain each part in detail:

1. **SELECT ROUND(MAX(LAT_N), 4)**

   - `SELECT`: This clause tells the database to retrieve specific data. In this case, it specifies that we want to calculate the **maximum** value of `LAT_N` and round it to 4 decimal places.

   - **`MAX(LAT_N)`**:
     - This function finds the maximum value from the `LAT_N` column.
     - The `LAT_N` column likely represents latitude values (possibly geographical locations of stations) in the `STATION` table.
     - `MAX` selects the largest value from all rows that satisfy the `WHERE` condition.
     - Example: If `LAT_N` values are `40.12`, `41.56`, and `42.78`, the maximum value is `42.78`.
   
   - **`ROUND(MAX(LAT_N), 4)`**:
     - The `ROUND` function is used to round the maximum value of `LAT_N` to 4 decimal places.
     - `ROUND(expression, 4)` means the result from `MAX(LAT_N)` will be rounded to exactly **4 decimal places**.
     - Example: If `MAX(LAT_N)` returns `42.7865`, rounding it to 4 decimal places would give `42.7865`. If it returns `42.78654`, rounding it would give `42.7865`.

2. **FROM STATION**

   - `FROM STATION`: 
     - This part specifies the table from which we are retrieving the data.
     - The `STATION` table likely contains information about different stations or geographical locations, including their latitude (`LAT_N`) and longitude (`LONG_W`).

3. **WHERE LAT_N < 137.2345**

   - **`WHERE`**:
     - The `WHERE` clause is used to filter the rows in the `STATION` table based on specific conditions.
     - It ensures that only rows that meet the condition are included in the query.
   
   - **`LAT_N < 137.2345`**:
     - This condition filters the rows by only selecting those where the value in the `LAT_N` column (latitude) is **less than 137.2345**.
     - Only latitudes smaller than `137.2345` will be considered when finding the maximum value.
     - Example: If `LAT_N` values are `120.50`, `135.67`, and `137.50`, only `120.50` and `135.67` will be included, as `137.50` is greater than `137.2345` and is excluded.

### Summary of the Query:

- **Filter**: The query filters the data to only include rows where the `LAT_N` values (latitude) are **less than 137.2345**.
- **Max**: It then finds the maximum value among the filtered `LAT_N` values.
- **Round**: Finally, the maximum value is rounded to 4 decimal places.

### Example:

Suppose the `STATION` table contains the following data:

| Station_ID | LAT_N  |
|------------|--------|
| 1          | 120.50 |
| 2          | 135.67 |
| 3          | 137.50 |
| 4          | 136.90 |

- **Filter step**:
  - The condition `LAT_N < 137.2345` excludes the value `137.50` because it is greater than `137.2345`.
  - So, the remaining valid `LAT_N` values are `120.50`, `135.67`, and `136.90`.

- **MAX(LAT_N)**:
  - The maximum value from the filtered set (`120.50`, `135.67`, and `136.90`) is `136.90`.

- **ROUND(MAX(LAT_N), 4)**:
  - Since the maximum value is `136.90`, rounding it to 4 decimal places gives `136.9000`.

### Output Example:

| ROUND(MAX(LAT_N), 4) |
|----------------------|
| 136.9000             |

This would be the final output, representing the maximum latitude value (less than `137.2345`), rounded to 4 decimal places.
