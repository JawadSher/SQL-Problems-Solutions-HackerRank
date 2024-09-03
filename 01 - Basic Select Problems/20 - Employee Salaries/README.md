<h1 align='center'>Employee - Salaries</h1>

## Problem Statement

**Problem URL :** [Employee Salaries](https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/c8af82ea-b029-4465-bbd6-fabeca0ba20f)
![image](https://github.com/user-attachments/assets/72c91cfa-e992-4854-9791-def506df07fe)
![image](https://github.com/user-attachments/assets/fc117ece-8bd4-410c-9d87-dd6ed570e76a)
![image](https://github.com/user-attachments/assets/96ce5c37-a4c2-409d-830c-a6c6cee4c1f7)

## Problem Solution
```sql
SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;
```

## Problem Solution Explanation
Let's break down the SQL query line by line:

1. **`SELECT NAME`**:
   - **Purpose**: This specifies that the query will retrieve the `NAME` column from the `EMPLOYEE` table.
   - **Example**: If the `EMPLOYEE` table has columns `ID`, `NAME`, `SALARY`, `MONTHS`, and `EMPLOYEE_ID`, this line ensures only the `NAME` values are included in the output.

2. **`FROM EMPLOYEE`**:
   - **Purpose**: This clause indicates the source of the data, which is the `EMPLOYEE` table.
   - **Example**: The query will be executed on the `EMPLOYEE` table, which contains the columns `ID`, `NAME`, `SALARY`, `MONTHS`, and `EMPLOYEE_ID`.

3. **`WHERE SALARY > 2000 AND MONTHS < 10`**:
   - **Purpose**: This is a filter condition that restricts the rows to only those that meet both criteria:
     - `SALARY > 2000`: Only include employees whose salary is greater than 2000.
     - `MONTHS < 10`: Only include employees who have been employed for less than 10 months.
   - **Example**: If the `EMPLOYEE` table contains the following data:

     | ID | NAME   | SALARY | MONTHS | EMPLOYEE_ID |
     |----|--------|--------|--------|-------------|
     | 1  | Alice  | 2500   | 5      | 101         |
     | 2  | Bob    | 1800   | 8      | 102         |
     | 3  | Charlie| 2200   | 12     | 103         |
     | 4  | David  | 3000   | 9      | 104         |
     | 5  | Eve    | 2700   | 7      | 105         |

     Applying the `WHERE` clause would yield:

     | ID | NAME   | SALARY | MONTHS | EMPLOYEE_ID |
     |----|--------|--------|--------|-------------|
     | 1  | Alice  | 2500   | 5      | 101         |
     | 4  | David  | 3000   | 9      | 104         |
     | 5  | Eve    | 2700   | 7      | 105         |

4. **`ORDER BY EMPLOYEE_ID ASC`**:
   - **Purpose**: This specifies that the results should be sorted in ascending order based on the `EMPLOYEE_ID` column. `ASC` stands for "ascending" and is the default sorting order. This clause ensures that the output is sorted by `EMPLOYEE_ID` from the smallest to the largest value.
   - **Example**: From the filtered results, sorting by `EMPLOYEE_ID` in ascending order would result in:

     | NAME  |
     |-------|
     | Alice |
     | David |
     | Eve   |

### Final Output

Given the example data and applying the `WHERE` and `ORDER BY` clauses, the final output will be:

```plaintext
Alice
David
Eve
```

### Summary

- **`SELECT NAME`**: Retrieves the `NAME` column.
- **`FROM EMPLOYEE`**: Specifies the `EMPLOYEE` table.
- **`WHERE SALARY > 2000 AND MONTHS < 10`**: Filters rows where `SALARY` is greater than 2000 and `MONTHS` is less than 10.
- **`ORDER BY EMPLOYEE_ID ASC`**: Sorts the result by `EMPLOYEE_ID` in ascending order.

This query effectively selects employees who meet the salary and tenure criteria and then sorts them by their `EMPLOYEE_ID` in ascending order.
