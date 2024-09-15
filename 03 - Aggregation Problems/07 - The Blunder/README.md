<h1 align='center'>The - Blunder</h1>

## Problem Statement

**Problem URL :** [The Blunder](https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/9a2012a2-c257-4320-aa9f-d4512d4a06b9)
![image](https://github.com/user-attachments/assets/3155d63c-6281-42f4-a8c0-0f23327e43d3)
![image](https://github.com/user-attachments/assets/85ab430d-2237-48cc-8688-aef2411032c7)

## Problem Solution
```sql
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;
```

## Problem Solution Explanation
Let's break down the query step by step:

### 1. **SELECT CEIL(...):**
   - **`SELECT`** is used to specify the data you want to retrieve from a database.
   - **`CEIL()`** is a function that rounds a number up to the nearest integer. In this case, it is applied to the result of the expression inside it.
     - If the result is a decimal (like 4.3), `CEIL()` will round it up to 5.

### 2. **AVG(Salary):**
   - **`AVG(Salary)`** calculates the **average** of the `Salary` column in the `EMPLOYEES` table.
   - This is the correct, actual average salary of all employees, with no manipulation or removal of zeros from the salary values.

### 3. **AVG(REPLACE(Salary, '0', '')):**
   - **`REPLACE(Salary, '0', '')`** removes all occurrences of the digit **`0`** in each salary value. It replaces zeros with nothing (i.e., it deletes them).
   - For example:
     - If the salary is **10500**, after applying `REPLACE()`, it would become **'155'**.
     - If the salary is **90000**, it would become **'9'**.
   - Then, the **`AVG()`** function is applied to these modified salary values (after removing zeros). This gives the incorrect average salary that Samantha calculated by excluding zeros from the salaries.

### 4. **AVG(Salary) - AVG(REPLACE(Salary, '0', '')):**
   - This part of the query computes the difference between:
     - The correct average salary (**`AVG(Salary)`**).
     - The incorrect average salary (**`AVG(REPLACE(Salary, '0', ''))`**) where zeros were removed.
   - The difference represents how much Samantha's average is off due to the blunder of removing zeros.

### 5. **CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))):**
   - Once the difference between the correct and incorrect averages is calculated, **`CEIL()`** is used to round this difference up to the nearest integer.
   - This ensures that even if the result is a fraction (like 3.4), it will be rounded up to 4.

### 6. **FROM EMPLOYEES:**
   - This specifies the table (`EMPLOYEES`) from which the data (`Salary`) is being queried.

### Final Output:
- The query calculates the **difference** between the correct and incorrect average salaries after removing zeros and returns this **difference rounded up** to the nearest integer.

### Example:
- If the correct average salary is **5000** and Samantha's incorrect average (after removing zeros) is **4500**, the query would return **CEIL(5000 - 4500) = CEIL(500) = 500**.

This explains how the query solves the problem of calculating the impact of the blunder by removing zeros from the salary values.
