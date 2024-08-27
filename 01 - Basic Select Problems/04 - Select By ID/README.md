<h1 align='center'>Select - By - ID</h1>

## Problem Statement

**Problem URL :** [Select By ID](https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/c739f5f2-198e-471a-905a-db2c3488a947)

## Problem Solution
```sql
SELECT * FROM CITY 
WHERE ID=1661
```

## Problem Solution Explanation
Let's break down the SQL query line by line:

1. **`SELECT *`**:
   - **`SELECT`**: This keyword is used to specify which columns you want to retrieve from the database.
   - **`*`**: The asterisk (`*`) is a wildcard character that tells the database to return all columns for the rows that match the condition specified in the `WHERE` clause. If you only want specific columns, you would list them instead of using `*`.

2. **`FROM CITY`**:
   - **`FROM`**: This keyword specifies the table from which you want to retrieve the data.
   - **`CITY`**: This is the name of the table from which the data will be selected. In this case, the table is named `CITY`.

3. **`WHERE ID = 1661;`**:
   - **`WHERE`**: This keyword is used to filter records based on a specific condition.
   - **`ID = 1661`**: This condition tells the database to only return the rows where the `ID` column has a value of `1661`. The `ID` column is assumed to be a unique identifier for rows in the `CITY` table.
   - The semicolon (`;`) marks the end of the SQL statement.

### Summary:
This query selects all columns (`*`) from the `CITY` table, but only for the row where the `ID` is `1661`. The result will be a single row with all the details from the `CITY` table for the city with `ID = 1661`.
