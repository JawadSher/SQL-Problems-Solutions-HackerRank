<h1 align='center'>Weather - Observation - Station 11</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 11](https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/15ef1b17-a59e-4445-b276-598daff6c0eb)
![image](https://github.com/user-attachments/assets/a2cb3e8e-3517-454a-8253-5e7492230587)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LAT_N AND LONG_W;
```

## Problem Solution Explanation

Let’s break down and explain the SQL query:

### 1. `SELECT DISTINCT CITY FROM STATION`

- **`SELECT`**: This keyword specifies the columns you want to retrieve from the database.
- **`DISTINCT`**: Ensures that only unique city names are returned, removing any duplicates.
- **`CITY`**: Specifies the column from which to retrieve the city names.
- **`FROM STATION`**: Indicates the table from which to retrieve the data, in this case, `STATION`.

**Example**:
If the `STATION` table contains the following data:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| Boston    | 42.3601| -71.0589|
| Dallas    | 32.7767| -96.7970|
| Oslo      | 59.9139| 10.7522 |
| Miami     | 25.7617| -80.1918|
| Denver    | 39.7392| -104.9903|
| Seattle   | 47.6062| -122.3321|

### 2. `WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`

- **`WHERE`**: Filters the rows based on the specified conditions.
- **`RIGHT(CITY, 1)`**: Extracts the last character of the city name. For example, for 'Boston', this function returns 'n'.
- **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: Filters out cities where the last character is a vowel (a, e, i, o, u). This part ensures that the last character of the city name is not a vowel.

**Example**:
Applying `RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | Last Character | Condition Met? |
|-----------|----------------|----------------|
| **Boston**   | n              | Yes            |
| **Dallas**   | s              | Yes            |
| Oslo      | o              | No             |
| Miami     | i              | No             |
| **Denver**   | r              | Yes            |
| Seattle   | e              | No             |

Cities meeting this condition are `Boston`, `Dallas`, and `Denver`.

### 3. `OR LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`

- **`OR`**: Combines multiple conditions in the `WHERE` clause. If either condition before or after `OR` is true, the row is included in the result set.
- **`LEFT(CITY, 1)`**: Extracts the first character of the city name. For example, for 'Boston', this function returns 'B'.
- **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: Filters out cities where the first character is a vowel. This part ensures that the first character of the city name is not a vowel.

**Example**:
Applying `LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')` to the `STATION` table:

| CITY      | First Character | Condition Met? |
|-----------|-----------------|----------------|
| **Boston**   | B               | Yes            |
| **Dallas**   | D               | Yes            |
| **Oslo**     | O               | No             |
| **Miami**    | M               | Yes            |
| **Denver**   | D               | Yes            |
| **Seattle**  | S               | Yes            |

Cities meeting this condition are `Boston`, `Dallas`, `Miami`, `Denver`, and `Seattle`.

### 4. `AND LAT_N AND LONG_W`

- **`AND`**: Combines conditions with a requirement that all combined conditions must be true for a row to be included in the result set.
- **`LAT_N AND LONG_W`**: Checks that both `LAT_N` (latitude) and `LONG_W` (longitude) are non-zero and non-null. In SQL, non-zero values are considered `TRUE`, so this condition will exclude rows where either `LAT_N` or `LONG_W` is zero or null.

**Example**:
Assuming all rows in the table have valid `LAT_N` and `LONG_W` values, this condition will be met by all rows where latitude and longitude are valid.

### Summary of Potential Issues

1. **Logical Operator Issue**: The use of `OR` and `AND` might not yield the expected results due to the precedence of operators. SQL evaluates `AND` before `OR`. So the condition might be misinterpreted without proper parentheses. To ensure correct logic, you might need to use parentheses:

   ```sql
   SELECT DISTINCT CITY FROM STATION
   WHERE (RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
   OR LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u'))
   AND LAT_N IS NOT NULL AND LONG_W IS NOT NULL
   AND LAT_N != 0 AND LONG_W != 0;
   ```

   This ensures that the `AND` condition is applied after the `OR` conditions are evaluated.

### Final Explanation
The corrected query will return:
1. Cities where the last character is **not** a vowel, or the first character is **not** a vowel.
2. And where both latitude and longitude are valid (non-zero and non-null).

### Example Result
Based on the data provided and assuming valid latitude and longitude values:

| CITY    |
|---------|
| Boston  |
| Dallas  |
| Miami   |
| Denver  |
| Seattle |

These cities meet the criteria set by the query.
