<h1 align='center'>Weather - Observation - Station 2</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 2](https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/fb7c2d8d-d3b1-448d-9a49-bcf7b2075b41)
![image](https://github.com/user-attachments/assets/21c4fcd4-47d2-4dbf-9552-bd74485eaf3a)
![image](https://github.com/user-attachments/assets/62c77278-ad37-4712-b328-5ae0f78924f1)

## Problem Solution
```sql
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;
```

## Problem Solution Explanation
Let's break down the SQL query and explain each part in detail:

1. **SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)**

   - `SELECT`: This clause specifies the columns or expressions that we want to retrieve from the database. In this case, we are performing calculations using `SUM` and `ROUND` functions.
   
   - **`SUM(LAT_N)`**: 
     - This function calculates the total (or sum) of all values in the `LAT_N` column from the `STATION` table.
     - `LAT_N` might represent the latitude of stations in a database of geographical locations.
     - Example: If `LAT_N` values are `40.12`, `41.56`, and `39.78`, the sum would be `40.12 + 41.56 + 39.78 = 121.46`.

   - **`ROUND(SUM(LAT_N), 2)`**: 
     - The `ROUND` function is applied to the result of `SUM(LAT_N)`.
     - `ROUND(expression, 2)` means we are rounding the result of the sum to **2 decimal places**.
     - Example: If the sum of `LAT_N` is `121.4623`, rounding it to 2 decimal places will give `121.46`.
   
   - **`SUM(LONG_W)`**: 
     - This function calculates the total (sum) of all values in the `LONG_W` column from the `STATION` table.
     - `LONG_W` might represent the longitude of stations in a database of geographical locations.
     - Example: If `LONG_W` values are `-75.25`, `-74.89`, and `-76.14`, the sum would be `-75.25 + (-74.89) + (-76.14) = -226.28`.
   
   - **`ROUND(SUM(LONG_W), 2)`**: 
     - The `ROUND` function is applied to the result of `SUM(LONG_W)`, rounding it to 2 decimal places.
     - Example: If the sum of `LONG_W` is `-226.2756`, rounding it to 2 decimal places would give `-226.28`.

2. **FROM STATION**

   - **`FROM STATION`**: 
     - This specifies that the data should be retrieved from the `STATION` table.
     - The `STATION` table likely contains information about different stations, including their latitude (`LAT_N`) and longitude (`LONG_W`).

### Final Output:

The query will return two values:
1. The sum of all `LAT_N` values, rounded to 2 decimal places.
2. The sum of all `LONG_W` values, rounded to 2 decimal places.

### Example:

Suppose the `STATION` table contains the following data:

| Station_ID | LAT_N  | LONG_W  |
|------------|--------|---------|
| 1          | 40.12  | -75.25  |
| 2          | 41.56  | -74.89  |
| 3          | 39.78  | -76.14  |

- **SUM(LAT_N)**: 
  - 40.12 + 41.56 + 39.78 = 121.46.
  - After rounding to 2 decimal places: **121.46**.
  
- **SUM(LONG_W)**: 
  - -75.25 + (-74.89) + (-76.14) = -226.28.
  - After rounding to 2 decimal places: **-226.28**.

### Output Example:

| ROUND(SUM(LAT_N), 2) | ROUND(SUM(LONG_W), 2) |
|----------------------|-----------------------|
| 121.46               | -226.28               |

The result shows the sum of latitudes and longitudes, rounded to two decimal places.
