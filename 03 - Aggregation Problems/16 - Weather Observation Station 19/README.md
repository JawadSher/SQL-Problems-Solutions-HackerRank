<h1 align='center'>Weather - Observation - Station 19</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 19](https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/3f2ea4b1-dd62-44f5-8355-4715a7b58f78)
![image](https://github.com/user-attachments/assets/f9b2fa56-a766-4bb9-94fd-8262bb896743)

## Problem Solution
```sql
SELECT ROUND(SQRT(POWER((MIN(LAT_N) - MAX(LAT_N)), 2) + POWER((MIN(LONG_W) - MAX(LONG_W)), 2)), 4) 
FROM STATION;
```

## Problem Solution Explanation
This SQL query calculates the Euclidean distance between two points, where the minimum and maximum values of latitude (`LAT_N`) and longitude (`LONG_W`) are used as coordinates. The Euclidean distance formula is based on the Pythagorean theorem.

Let's break down the query:

1. **`SELECT`**:  
   The `SELECT` statement is used to specify the data you want to retrieve from the database.

2. **`ROUND(..., 4)`**:  
   - `ROUND` is a function used to round a number to a specified number of decimal places.
   - In this case, it rounds the result of the distance calculation to 4 decimal places.
   - The `...` inside `ROUND` is the value that will be calculated and then rounded.

3. **`SQRT(...)`**:  
   - `SQRT` stands for "square root." It calculates the square root of the value inside the parentheses.
   - The formula inside `SQRT` is essentially the Pythagorean theorem used to calculate the distance between two points on a 2D plane. The formula is `SQRT((x2 - x1)^2 + (y2 - y1)^2)`.

4. **`POWER((MIN(LAT_N) - MAX(LAT_N)), 2)`**:  
   - `MIN(LAT_N)` finds the smallest value in the `LAT_N` column.
   - `MAX(LAT_N)` finds the largest value in the `LAT_N` column.
   - `MIN(LAT_N) - MAX(LAT_N)` calculates the difference between the minimum and maximum latitude values.
   - `POWER(..., 2)` raises the difference to the power of 2, i.e., squares it. This step is essential in the Pythagorean theorem (as part of calculating the square of the difference between the coordinates).

5. **`POWER((MIN(LONG_W) - MAX(LONG_W)), 2)`**:  
   - `MIN(LONG_W)` finds the smallest value in the `LONG_W` column.
   - `MAX(LONG_W)` finds the largest value in the `LONG_W` column.
   - `MIN(LONG_W) - MAX(LONG_W)` calculates the difference between the minimum and maximum longitude values.
   - `POWER(..., 2)` raises the difference to the power of 2, squaring it.

6. **`POWER((MIN(LAT_N) - MAX(LAT_N)), 2) + POWER((MIN(LONG_W) - MAX(LONG_W)), 2)`**:  
   - This part of the query adds the squares of the latitude and longitude differences. This forms the core of the Pythagorean theorem: `a^2 + b^2`.

7. **`SQRT(...)`**:  
   - After calculating `a^2 + b^2`, the `SQRT` function computes the square root of the sum, giving the Euclidean distance between the two points with coordinates `(MIN(LAT_N), MIN(LONG_W))` and `(MAX(LAT_N), MAX(LONG_W))`.

8. **`ROUND(SQRT(...), 4)`**:  
   - The final result of the square root is rounded to 4 decimal places for precision.

9. **`FROM STATION`**:  
   - This specifies the table `STATION` from which the latitude (`LAT_N`) and longitude (`LONG_W`) values are retrieved.

### Summary
This query calculates the straight-line (Euclidean) distance between two points in a geographical space, represented by the minimum and maximum latitude and longitude values from the `STATION` table. The distance is calculated using the Pythagorean theorem, where the differences in latitude and longitude are squared, summed, and then square-rooted. The result is rounded to 4 decimal places.
