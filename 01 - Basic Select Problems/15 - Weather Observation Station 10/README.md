<h1 align='center'>Weather - Observation - Station 10</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 10](https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/9791dab0-e9a6-4a4b-8c78-66a822c4960a)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Let's go through the SQL query step by step to understand its function and see examples of how it works.

### 1. `SELECT DISTINCT CITY FROM STATION`

- **`SELECT`**: This keyword specifies the columns you want to retrieve from the database.
- **`DISTINCT`**: Ensures that the query returns only unique city names, eliminating any duplicates.
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
| Denver    | 39.7392| -104.9903|
| Seattle   | 47.6062| -122.3321|

### 2. `WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`

- **`WHERE`**: This clause filters the results based on specified conditions.
- **`RIGHT(CITY, 1)`**: This function extracts the last character from the `CITY` name. For example, if the city name is 'Boston', `RIGHT(CITY, 1)` would return 'n'.
- **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the last character of the `CITY` name is **not** a vowel. It filters out cities whose names end with 'a', 'e', 'i', 'o', or 'u'.

**Example**:
Applying `RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | Last Character | Condition Met? |
|-----------|----------------|----------------|
| **Boston**   | n              | Yes            |
| Dallas    | s              | Yes            |
| Oslo      | o              | No             |
| Miami     | i              | No             |
| **Denver**   | r              | Yes            |
| Seattle   | e              | No             |

Cities that satisfy this condition are `Boston`, `Dallas`, and `Denver`.

### 3. `AND LAT_N AND LONG_W`

- **`AND LAT_N AND LONG_W`**: This condition ensures that both `LAT_N` (latitude) and `LONG_W` (longitude) are non-zero and non-null. In SQL, non-zero values are treated as `TRUE`, so this condition checks that the city has valid latitude and longitude coordinates.

**Example**:
Given that all cities in the table have valid `LAT_N` and `LONG_W` values, this condition is met for all cities that passed the previous condition.

### Final Query Explanation
The final query returns distinct city names from the `STATION` table where:
1. The city's name does **not** end with a vowel (`a`, `e`, `i`, `o`, `u`).
2. The city has valid (non-zero) latitude (`LAT_N`) and longitude (`LONG_W`) values.

### Final Output
The query will return:

| CITY    |
|---------|
| Boston  |
| Dallas  |
| Denver  |

These cities have names that do not end with a vowel and have valid latitude and longitude coordinates.

### Summary
- **`RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`**: Filters out cities ending with vowels.
- **`LAT_N AND LONG_W`**: Ensures cities have valid coordinates.
- The query returns all distinct city names that meet these criteria.
