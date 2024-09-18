<h1 align='center'>Weather - Observation - Station 18</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 18](https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/d78bdf21-bda9-49e8-a01d-a04d0eb64b41)
![image](https://github.com/user-attachments/assets/a1a431f8-fb95-4e6f-b92b-1acfa900312f)

## Problem Solution
```sql
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;
```

## Problem Solution Explanation

1. **`SELECT`**:  
   This keyword initiates a query to retrieve data from a database. Here, it is used to specify what we want to select and how to process the data.

2. **`ROUND(..., 4)`**:  
   - The `ROUND` function is used to round a numeric value to a specified number of decimal places. In this case, it rounds the result to 4 decimal places.
   - The `...` inside `ROUND` represents the value that will be rounded.

3. **`ABS(MIN(LAT_N) - MAX(LAT_N))`**:  
   - `MIN(LAT_N)`: Finds the smallest value in the `LAT_N` column (latitude values).
   - `MAX(LAT_N)`: Finds the largest value in the `LAT_N` column.
   - `MIN(LAT_N) - MAX(LAT_N)`: Calculates the difference between the minimum and maximum latitude values. This could be a negative value.
   - `ABS(...)`: The `ABS` function returns the absolute value of its argument, which converts any negative difference into a positive value. This represents the range of latitude values.

4. **`ABS(MIN(LONG_W) - MAX(LONG_W))`**:  
   - `MIN(LONG_W)`: Finds the smallest value in the `LONG_W` column (longitude values).
   - `MAX(LONG_W)`: Finds the largest value in the `LONG_W` column.
   - `MIN(LONG_W) - MAX(LONG_W)`: Calculates the difference between the minimum and maximum longitude values. This could be a negative value.
   - `ABS(...)`: Returns the absolute value of this difference, representing the range of longitude values.

5. **`ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W))`**:  
   - Adds the absolute difference of latitude and longitude ranges. This represents the total span of values covered by the latitude and longitude data.

6. **`FROM STATION`**:  
   - Specifies the table from which to retrieve the data. In this case, it's the `STATION` table.

### Summary
The query calculates the absolute difference between the minimum and maximum latitude and longitude values in the `STATION` table. It then adds these differences together and rounds the final result to 4 decimal places. The result represents the combined range of latitude and longitude values from the dataset, rounded for precision.
