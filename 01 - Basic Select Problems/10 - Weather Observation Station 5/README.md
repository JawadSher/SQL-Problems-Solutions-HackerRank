<h1 align='center'>Weather - Observation - Station 5</h1>

## Problem Statement

**Problem URL :** [Weather Observation Station 5](https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/09759743-31b9-41ca-840b-0f4cef46ba0a)
![image](https://github.com/user-attachments/assets/2f23eefe-d289-4e14-9818-e616a432a77d)

## Problem Solution
```sql
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
```

## Problem Solution Explanation
Let's break down and explain these two SQL queries step by step.

### 1. Query 1: 
```sql
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY LIMIT 1;
```

#### Explanation:

- **`SELECT CITY, LENGTH(CITY)`**:
  - `CITY` is a column from the `STATION` table.
  - `LENGTH(CITY)` calculates the length of the string in the `CITY` column. For example, if the city name is "Paris", `LENGTH(CITY)` would return 5.
  - The `SELECT` clause here is retrieving the city names along with their lengths.

- **`FROM STATION`**:
  - This specifies that the data should be fetched from the `STATION` table.

- **`ORDER BY LENGTH(CITY), CITY`**:
  - `ORDER BY` sorts the result set.
  - `LENGTH(CITY)` sorts the results primarily by the length of the city names, in ascending order by default (shortest names first).
  - `CITY` is a secondary sort criterion that sorts the cities alphabetically in ascending order for those with the same length.
  - For example, if there are cities "LA", "New York", "Beijing", "Paris", and "Al", they would be sorted as follows:
    - Length of "Al" = 2
    - Length of "LA" = 2
    - Length of "Paris" = 5
    - Length of "Beijing" = 7
    - Length of "New York" = 8
    - After sorting by length and then by alphabetical order:
      - "Al" (length 2)
      - "LA" (length 2)
      - "Paris" (length 5)
      - "Beijing" (length 7)
      - "New York" (length 8)

- **`LIMIT 1`**:
  - This limits the result to only the first row of the sorted result set.
  - Given our example, the query will return "Al" since it has the shortest length and is alphabetically first among cities of the same length.

#### Result Example:
- If the table contains cities like "LA", "New York", "Paris", "Beijing", and "Al", the query would return:
  ```
  Al | 2
  ```

### 2. Query 2: 
```sql
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
```

#### Explanation:

- **`SELECT CITY, LENGTH(CITY)`**:
  - Similar to the first query, this selects the city name and its length.

- **`FROM STATION`**:
  - Specifies that the data should be fetched from the `STATION` table.

- **`ORDER BY LENGTH(CITY) DESC, CITY`**:
  - `ORDER BY` sorts the result set.
  - `LENGTH(CITY) DESC` sorts the results by the length of the city names in descending order (longest names first).
  - `CITY` again serves as a secondary criterion that sorts the cities alphabetically in ascending order for those with the same length.
  - Continuing from the previous example, after sorting by descending length and then alphabetically, the cities would be:
    - "New York" (length 8)
    - "Beijing" (length 7)
    - "Paris" (length 5)
    - "Al" (length 2)
    - "LA" (length 2)
    - After sorting by length (longest first) and alphabetically:
      - "New York" (length 8)
      - "Beijing" (length 7)
      - "Paris" (length 5)
      - "Al" (length 2)
      - "LA" (length 2)

- **`LIMIT 1`**:
  - This limits the result to only the first row of the sorted result set.
  - In our example, the query will return "New York" because it has the longest length.

#### Result Example:
- If the table contains cities like "LA", "New York", "Paris", "Beijing", and "Al", the query would return:
  ```
  New York | 8
  ```

### Summary:

- **Query 1**: Finds the city with the shortest name (and returns the alphabetically first if there is a tie).
- **Query 2**: Finds the city with the longest name (and returns the alphabetically first if there is a tie).
