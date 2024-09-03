<h1 align='center'>Weather - Observation - Station 7</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 7](https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/f947ba5e-be0c-4018-84f0-213ce1762e57)


## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Let's break down the SQL query you provided step by step:


### 1. `SELECT DISTINCT CITY FROM STATION`

- **`SELECT`**: This keyword is used to specify the columns you want to retrieve from the database.
- **`DISTINCT`**: This keyword ensures that the query returns only unique city names, eliminating any duplicates.
- **`CITY`**: Specifies that you want to retrieve the city names from the `STATION` table.
- **`FROM STATION`**: This specifies the table (`STATION`) from which to retrieve the data.

**Example**:
Let's say the `STATION` table has the following data:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| Atlanta   | 33.7490| -84.3880|
| Seattle   | 47.6062| -122.3321|
| Chicago   | 41.8781| -87.6298|
| Tokyo     | 35.6895| 139.6917|
| Houston   | 29.7604| -95.3698|
| San Diego | 32.7157| -117.1611|

### 2. `WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`

- **`WHERE`**: This clause is used to filter the results based on specific conditions.
- **`RIGHT(CITY, 1)`**: This function extracts the last character from the `CITY` name. For example, if the city name is 'Atlanta', `RIGHT(CITY, 1)` would return 'a'.
- **`IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the last character of the `CITY` name is one of the vowels: 'a', 'e', 'i', 'o', 'u'. The condition is case-insensitive.

**Example**:
If we apply `RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| **Atlanta**   | 33.7490| -84.3880|
| **Seattle**   | 47.6062| -122.3321|
| Chicago   | 41.8781| -87.6298|
| **Tokyo**     | 35.6895| 139.6917|
| Houston   | 29.7604| -95.3698|
| San Diego | 32.7157| -117.1611|

The cities `Atlanta`, `Seattle`, and `Tokyo` have names that end with a vowel ('a', 'e', 'o'), so they match this condition.

### 3. `AND LAT_N AND LONG_W`

- **`AND`**: This is a logical operator used to combine multiple conditions. Both conditions must be true for the row to be selected.
- **`LAT_N`**: Refers to the latitude of the city. In this context, it's interpreted as a boolean expression.
- **`LONG_W`**: Refers to the longitude of the city. Similarly, it's interpreted as a boolean expression.

### Understanding `LAT_N AND LONG_W`

- In SQL, numerical values are treated as `TRUE` if they are non-zero, and `FALSE` if they are zero.
- So, `LAT_N AND LONG_W` will be `TRUE` only if both `LAT_N` and `LONG_W` are non-zero values.

### Final Query Breakdown:

The query selects unique city names from the `STATION` table where:
1. The city's name ends with a vowel (`a`, `e`, `i`, `o`, `u`).
2. Both `LAT_N` and `LONG_W` are non-zero (indicating the city has valid latitude and longitude coordinates).

**Example with Filter Applied**:
Given the previous example data:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| **Atlanta**   | 33.7490| -84.3880|
| **Seattle**   | 47.6062| -122.3321|
| **Tokyo**     | 35.6895| 139.6917|

- **Atlanta**, **Seattle**, and **Tokyo** would be included in the result because they meet all the conditions (end with a vowel and have non-zero `LAT_N` and `LONG_W` values).

### Final Output:
The query returns:

| CITY    |
|---------|
| Atlanta |
| Seattle |
| Tokyo   |

These cities have names that end with a vowel and have non-zero `LAT_N` and `LONG_W` values.
