<h1 align='center'>Select - All</h1>

## Problem Statement

**Problem URL :** [Select All](https://www.hackerrank.com/challenges/select-all-sql/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/ced40185-b3f9-4334-90d5-db8a503bbe56)


## Problem Solution
```py
SELECT * FROM CITY
```

## Problem Solution Explanation
Let's break down the SQL query:

1. **`SELECT *`**:
   - **Purpose**: This specifies what data you want to retrieve from the table.
   - **Details**: The `SELECT` keyword is used to indicate that you want to retrieve data from a table. The `*` (asterisk) is a wildcard character that represents "all columns." So, `SELECT *` means "retrieve all columns" from the table specified.

2. **`FROM CITY`**:
   - **Purpose**: This specifies the table from which to retrieve the data.
   - **Details**: `CITY` is the name of the table in the database that contains information about cities. The `FROM` keyword tells the database which table to look at for the data.

### Summary:

The query retrieves all columns and all rows from the `CITY` table. 

In simpler terms, this query is asking the database to show everything in the `CITY` table without applying any filters or conditions. You will get every piece of information stored in the table for all entries.
