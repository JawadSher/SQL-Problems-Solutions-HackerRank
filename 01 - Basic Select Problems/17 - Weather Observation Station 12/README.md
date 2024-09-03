<h1 align='center'>Weather - Observation - Station 12</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 12](https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/bdcfa416-610b-4229-ad94-64d5ef9a88b9)
![image](https://github.com/user-attachments/assets/3827bbbf-c48d-470d-8bbf-09171d451fe2)

## Problem Solution
```sql
SELECT DISTINCT CITY FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Sure! Let’s dissect and explain the SQL query in detail with examples. The query is:

### Query Breakdown

1. **`SELECT DISTINCT CITY FROM STATION`**

   - **`SELECT DISTINCT CITY`**: Retrieves unique city names from the `STATION` table. The `DISTINCT` keyword ensures that each city name appears only once in the result set, even if it appears multiple times in the table.
   - **`FROM STATION`**: Specifies the table from which to retrieve the data, which is `STATION` in this case.

**Example Data**:
Consider the following `STATION` table:

| CITY      | LAT_N  | LONG_W |
|-----------|--------|--------|
| Boston    | 42.3601| -71.0589|
| Dallas    | 32.7767| -96.7970|
| Oslo      | 59.9139| 10.7522 |
| Miami     | 25.7617| -80.1918|
| Denver    | 39.7392| -104.9903|
| Seattle   | 47.6062| -122.3321|

2. **`WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`**

   - **`WHERE`**: Filters the rows based on the given conditions.
   - **`RIGHT(CITY, 1)`**: Extracts the last character of the `CITY` name.
   - **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: Ensures the last character of the city name is **not** one of the specified vowels.

**Example**:
Evaluating `RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`:

| CITY      | Last Character | Condition Met? |
|-----------|----------------|----------------|
| Boston    | n              | Yes            |
| Dallas    | s              | Yes            |
| Oslo      | o              | No             |
| Miami     | i              | No             |
| Denver    | r              | Yes            |
| Seattle   | e              | No             |

Cities where the last character is **not** a vowel: `Boston`, `Dallas`, and `Denver`.

3. **`OR LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`**

   - **`OR`**: Combines conditions such that if either condition is true, the row is included in the result set.
   - **`LEFT(CITY, 1)`**: Extracts the first character of the `CITY` name.
   - **`NOT IN ('a', 'e', 'i', 'o', 'u')`**: Ensures the first character of the city name is **not** one of the specified vowels.

**Example**:
Evaluating `LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')`:

| CITY      | First Character | Condition Met? |
|-----------|-----------------|----------------|
| **Boston**   | B               | Yes            |
| **Dallas**   | D               | Yes            |
| Oslo      | O               | No             |
| Miami     | M               | Yes            |
| **Denver**   | D               | Yes            |
| **Seattle**  | S               | Yes            |

Cities where the first character is **not** a vowel: `Boston`, `Dallas`, `Miami`, `Denver`, and `Seattle`.

4. **`AND LAT_N AND LONG_W`**

   - **`AND`**: Combines conditions with the requirement that all combined conditions must be true.
   - **`LAT_N AND LONG_W`**: Checks that both `LAT_N` (latitude) and `LONG_W` (longitude) are non-zero and non-null. This condition is evaluated as true if both `LAT_N` and `LONG_W` are non-zero values.

**Example**:
If all cities have non-zero and non-null `LAT_N` and `LONG_W`, this condition will be met. 

### Combining Conditions

Due to the precedence of SQL operators, the `AND` operator is evaluated before the `OR` operator. This means the query effectively reads:

```sql
SELECT DISTINCT CITY FROM STATION
WHERE (RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u'))
OR (LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W);
```

- **`(RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u'))`**: This condition is applied first.
- **`(LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W)`**: This condition is applied second, but the `AND` within this clause is evaluated before it combines with the `OR`.

### Final Output

The query returns distinct city names from the `STATION` table where:
1. The last character of the city name is **not** a vowel, **or**
2. The first character of the city name is **not** a vowel **and** both latitude and longitude are valid (non-zero and non-null).

Based on the example data and assuming all `LAT_N` and `LONG_W` values are valid:

**Result Set**:

| CITY    |
|---------|
| Boston  |
| Dallas  |
| Miami   |
| Denver  |
| Seattle |

These cities meet at least one of the conditions defined in the `WHERE` clause.
