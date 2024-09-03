<h1 align='center'>Weather - Observation - Station 6</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 6](https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/a1a259c5-ee8c-4543-8b61-f40ac1b1233c)
![image](https://github.com/user-attachments/assets/c1d30a48-8aa7-4176-b9a9-0947a73f18d7)

## Problem Solution
```sql
SELECT CITY FROM STATION
WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u') AND LAT_N AND LONG_W;
```

## Problem Solution Explanation
Let's break down the SQL query and understand each part in detail, along with examples.


### 1. `SELECT CITY FROM STATION`
- **`SELECT CITY`**: This part of the query tells the database to retrieve the `CITY` column from the `STATION` table. The `CITY` column contains the names of cities.
  
- **`FROM STATION`**: This specifies that the data should be selected from the `STATION` table.

### 2. `WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`
- **`WHERE`**: This clause is used to filter the results based on certain conditions. Only rows that meet these conditions will be included in the result set.
  
- **`LEFT(CITY, 1)`**: The `LEFT` function extracts the leftmost characters from a string. In this case, `LEFT(CITY, 1)` extracts the first character of the `CITY` name.
  
- **`IN ('a', 'e', 'i', 'o', 'u')`**: This checks if the first character of the `CITY` name (as extracted by `LEFT(CITY, 1)`) is one of the specified vowels: 'a', 'e', 'i', 'o', or 'u'. The `IN` keyword allows us to check if a value exists within a specified set of values.

**Example**:
Suppose the `STATION` table contains the following cities:
| CITY       |
|------------|
| Amsterdam  |
| Berlin     |
| Istanbul   |
| Oslo       |
| Zurich     |

- `LEFT(CITY, 1)` will extract:
  - 'A' from 'Amsterdam'
  - 'B' from 'Berlin'
  - 'I' from 'Istanbul'
  - 'O' from 'Oslo'
  - 'Z' from 'Zurich'

The `WHERE` clause checks if these characters are in the set ('a', 'e', 'i', 'o', 'u'):
- 'Amsterdam' (first character 'A') is included because 'A' is equivalent to 'a' (case-insensitive).
- 'Istanbul' (first character 'I') is included because 'I' is equivalent to 'i'.
- 'Oslo' (first character 'O') is included because 'O' is equivalent to 'o'.

So, after this condition, the cities that remain are 'Amsterdam', 'Istanbul', and 'Oslo'.

### 3. `AND LAT_N AND LONG_W`
- **`AND`**: This is a logical operator that combines multiple conditions. Both conditions on either side of `AND` must be true for a row to be included in the result set.
  
- **`LAT_N` and `LONG_W`**: These appear to be columns in the `STATION` table. Normally, `LAT_N` could represent the latitude of the city (north coordinate), and `LONG_W` could represent the longitude of the city (west coordinate).

However, the way they are written here is unusual. Typically, you would expect conditions like `LAT_N > 0` or `LONG_W < 0`, rather than just `LAT_N AND LONG_W`. The way it's written suggests that these columns are being treated as boolean expressions. In SQL, a non-zero numeric value is considered `TRUE`, and zero is considered `FALSE`.

Thus, this condition is checking whether both `LAT_N` and `LONG_W` are non-zero (or "truthy"). If both values are non-zero, the condition is satisfied, and the row is included.

**Example**:
Assume the `STATION` table has the following data:
| CITY       | LAT_N  | LONG_W  |
|------------|--------|---------|
| Amsterdam  | 52.37  | 4.89    |
| Berlin     | 52.52  | 13.41   |
| Istanbul   | 41.01  | 28.98   |
| Oslo       | 59.91  | 10.75   |
| Zurich     | 47.38  | 8.54    |

For simplicity, let's assume that the numeric values for `LAT_N` and `LONG_W` are non-zero for all rows. This means that the `AND LAT_N AND LONG_W` condition will be `TRUE` for all rows. If any of these values were zero, the corresponding city would be excluded.

### Final Output:
Given our example data:
- Cities that start with a vowel (after checking `LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`): Amsterdam, Istanbul, Oslo.
- Assuming all have non-zero `LAT_N` and `LONG_W`, these cities will be included in the final result.

The final output will list:
| CITY      |
|-----------|
| Amsterdam |
| Istanbul  |
| Oslo      |

### Summary:
- **`LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')`** filters cities that start with a vowel.
- **`LAT_N AND LONG_W`** ensures that only cities with non-zero latitude and longitude are included.
  
The result is a list of cities that meet both conditions.
