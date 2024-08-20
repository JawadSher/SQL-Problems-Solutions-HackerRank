<h1 align='center'>Revising - The - Select - Query - II</h1>

## Problem Statement

**Problem URL :** [Revising The Select Query II](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/f6a32d21-558d-46d5-87a9-1f0475a9e6a0)


## Problem Solution
```sql
SELECT NAME FROM CITY 
WHERE POPULATION>120000 AND COUNTRYCODE='USA'
```

## Problem Solution Explanation

Let's break down this SQL query step by step:


1. **`SELECT NAME`**:
   - **Purpose**: This part of the query specifies which data to retrieve.
   - **Details**: The `SELECT` keyword is used to choose the columns you want to display in the result. In this case, `NAME` refers to a column in the `CITY` table. So, `SELECT NAME` means "retrieve the values in the `NAME` column."

2. **`FROM CITY`**:
   - **Purpose**: This specifies the table from which to get the data.
   - **Details**: `CITY` is the name of the table that contains information about cities. The `FROM` keyword tells the database which table to search.

3. **`WHERE POPULATION > 120000`**:
   - **Purpose**: This sets a condition to filter the rows.
   - **Details**: The `WHERE` keyword is used to specify the criteria that the data must meet to be included in the results. `POPULATION > 120000` is the condition, which means "only include rows where the value in the `POPULATION` column is greater than 120,000."

4. **`AND COUNTRYCODE = 'USA'`**:
   - **Purpose**: This adds an additional condition that must also be met.
   - **Details**: The `AND` keyword combines multiple conditions, meaning both conditions must be true for a row to be included in the results. `COUNTRYCODE = 'USA'` specifies that only rows where the `COUNTRYCODE` column has the value 'USA' should be included. The `COUNTRYCODE` column represents the country of the city.

### Summary:

The query retrieves the names of cities from the `CITY` table where the population is greater than 120,000 and the country code is 'USA'. 

In simpler terms, this query is asking the database to provide a list of city names in the U.S. where each city's population exceeds 120,000.
