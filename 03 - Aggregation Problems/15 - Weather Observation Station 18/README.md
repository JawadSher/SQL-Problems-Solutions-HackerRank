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
