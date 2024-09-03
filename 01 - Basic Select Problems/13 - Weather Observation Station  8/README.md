<h1 align='center'>Weather - Observation - Station 8</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 8](https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/a21f0778-6ccb-41ea-9e07-31ccf809f236)
![image](https://github.com/user-attachments/assets/ebe7beda-2762-41c7-9d02-b21fe9ea6346)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')
AND LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u') 
AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Let's break down the SQL query you've provided and explain it in detail with examples:

### 1. `SELECT DISTINCT CITY FROM STATION`

- **`SELECT`**: This keyword is used to specify the columns you want to retrieve from the database.
- **`DISTINCT`**: This keyword ensures that the query returns only unique city names, eliminating any duplicates.
- **`CITY`**: Specifies that you want to retrieve the city names from the `STATION` table.
- **`FROM STATION`**: Specifies the table (`STATION`) from which to retrieve the data.

**Example**:
Let's say the `STATION` table has the following data:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| Atlanta   | 33.7490| -84.3880|
| Seattle   | 47.6062| -122.3321|
| Austin    | 30.2672| -97.7431|
| Chicago   | 41.8781| -87.6298|
| Oslo      | 59.9139| 10.7522 |
| Miami     | 25.7617| -80.1918|

### 2. `WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`

- **`WHERE`**: This clause filters the results based on specified conditions.
- **`RIGHT(CITY, 1)`**: This function extracts the last character from the `CITY` name. For example, if the city name is 'Atlanta', `RIGHT(CITY, 1)` would return 'a'.
- **`IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the last character of the `CITY` name is one of the vowels: 'a', 'e', 'i', 'o', 'u'.

**Example**:
Applying `RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | Last Character | Condition Met? |
|-----------|----------------|----------------|
| Atlanta   | a              | Yes            |
| Seattle   | e              | Yes            |
| Austin    | n              | No             |
| Chicago   | o              | Yes            |
| Oslo      | o              | Yes            |
| Miami     | i              | Yes            |

Cities that satisfy this condition are `Atlanta`, `Seattle`, `Chicago`, `Oslo`, and `Miami`.

### 3. `AND LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`

- **`LEFT(CITY, 1)`**: This function extracts the first character from the `CITY` name. For example, if the city name is 'Atlanta', `LEFT(CITY, 1)` would return 'A'.
- **`IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the first character of the `CITY` name is a vowel. SQL is typically case-insensitive by default, so this works with both uppercase and lowercase letters.

**Example**:
Applying `LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')` to the previously filtered cities:

| CITY      | First Character | Condition Met? |
|-----------|-----------------|----------------|
| **Atlanta**   | A               | Yes            |
| Seattle   | S               | No             |
| Austin    | A               | Yes            |
| **Chicago**   | C               | No             |
| **Oslo**      | O               | Yes            |
| Miami     | M               | No             |

Cities that now satisfy both conditions (first and last characters are vowels) are `Atlanta`, `Oslo`.

### 4. `AND LAT_N AND LONG_W`

- **`AND LAT_N AND LONG_W`**: This checks that both `LAT_N` (latitude) and `LONG_W` (longitude) are non-zero and non-null. In SQL, non-zero numerical values are treated as `TRUE`, so this condition ensures that both latitude and longitude are valid (non-zero) coordinates.

**Example**:
Given that all cities have valid `LAT_N` and `LONG_W` values in the example table, this condition is met for all cities that pass the previous conditions.

### Final Query Explanation
The final query returns distinct city names from the `STATION` table where:
1. The city's name ends with a vowel (`a`, `e`, `i`, `o`, `u`).
2. The city's name starts with a vowel (`a`, `e`, `i`, `o`, `u`).
3. Both `LAT_N` and `LONG_W` are non-zero (indicating valid latitude and longitude coordinates).

### Final Output
The query will return:

| CITY    |
|---------|
| Atlanta |
| Oslo    |

These cities have names that start and end with a vowel, and both have valid latitude and longitude values.
