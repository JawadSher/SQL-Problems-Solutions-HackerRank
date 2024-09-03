<h1 align='center'>Weather - Observation - Station 9</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 9](https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/83510e16-b43e-400c-8081-3c8fd8ed255d)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Let's break down the SQL query step by step to understand its purpose and how it operates:

### 1. `SELECT DISTINCT CITY FROM STATION`

- **`SELECT`**: This keyword is used to specify the columns you want to retrieve from the database.
- **`DISTINCT`**: This ensures that the query returns only unique city names, eliminating any duplicates.
- **`CITY`**: Specifies that you want to retrieve the city names from the `STATION` table.
- **`FROM STATION`**: Specifies the table (`STATION`) from which to retrieve the data.

**Example**:
Assume the `STATION` table contains the following data:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| Boston    | 42.3601| -71.0589|
| Dallas    | 32.7767| -96.7970|
| Oslo      | 59.9139| 10.7522 |
| Miami     | 25.7617| -80.1918|
| Seattle   | 47.6062| -122.3321|

### 2. `WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`

- **`WHERE`**: This clause filters the results based on specified conditions.
- **`LEFT(CITY, 1)`**: This function extracts the first character from the `CITY` name. For example, if the city name is 'Boston', `LEFT(CITY, 1)` would return 'B'.
- **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the first character of the `CITY` name is **not** a vowel. It filters out cities whose names start with 'a', 'e', 'i', 'o', or 'u'.

**Example**:
Applying `LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | First Character | Condition Met? |
|-----------|-----------------|----------------|
| **Boston**   | B               | Yes            |
| **Dallas**   | D               | Yes            |
| Oslo      | O               | No             |
| Miami     | M               | Yes            |
| **Seattle**  | S               | Yes            |

Cities that satisfy this condition are `Boston`, `Dallas`, `Miami`, and `Seattle`.

### 3. `AND LAT_N AND LONG_W`

- **`AND LAT_N AND LONG_W`**: This condition ensures that both `LAT_N` (latitude) and `LONG_W` (longitude) are non-zero and non-null. In SQL, non-zero values are treated as `TRUE`, so this condition checks that the city has valid latitude and longitude coordinates.

**Example**:
Given that all cities in the table have valid `LAT_N` and `LONG_W` values, this condition is met for all cities that passed the previous condition.

### Final Query Explanation
The final query returns distinct city names from the `STATION` table where:
1. The city's name does **not** start with a vowel ('a', 'e', 'i', 'o', 'u').
2. The city has valid (non-zero) latitude (`LAT_N`) and longitude (`LONG_W`) values.

### Final Output
The query will return:

| CITY    |
|---------|
| Boston  |
| Dallas  |
| Miami   |
| Seattle |

These cities have names that do not start with a vowel and have valid latitude and longitude coordinates.

### Summary
- **`LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`**: Filters out cities starting with vowels.
- **`LAT_N AND LONG_W`**: Ensures cities have valid coordinates.
- The query returns all distinct city names that meet these criteria.
