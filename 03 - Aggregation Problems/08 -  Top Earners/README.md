<h1 align='center'>Top - Earners</h1>

## Problem Statement

**Problem URL :** [Top Earners](https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/673586f9-e881-4b2e-8297-de4f7b188ba3)
![image](https://github.com/user-attachments/assets/3300d7b4-0994-4f49-a2e0-77161d2217a7)
![image](https://github.com/user-attachments/assets/52defd81-8ba2-44ca-bc70-62c6663a2e37)
![image](https://github.com/user-attachments/assets/e5889f2d-d4e1-4795-846c-a1aaa4be9f90)
![image](https://github.com/user-attachments/assets/1d46ac9a-6e37-4e1b-b746-9bbfbb06a838)
![image](https://github.com/user-attachments/assets/43679cac-1528-4836-9547-2a1d9d43b8b3)
![image](https://github.com/user-attachments/assets/a294248e-34a5-4ad0-9ef8-086ca416957d)


## Problem Solution
```sql
SELECT MAX(months * salary), COUNT(*) FROM Employee 
WHERE (months * salary) = ( SELECT MAX(months * salary) FROM Employee );
```

## Problem Solution Explanation
Let's break down the SQL query line by line and explain how it works:

1. **Outer Query - `SELECT MAX(months * salary), COUNT(*)`**
   - `SELECT`: This part of the query specifies what columns or calculations we want to retrieve from the `Employee` table.
   - `MAX(months * salary)`: This calculates the maximum value of the product of `months` and `salary`. For each employee, the product of `months` and `salary` is computed, and the largest value is returned.
     - Example: If `months = 12` and `salary = 3000`, then `months * salary = 12 * 3000 = 36000`.
   - `COUNT(*)`: This counts the number of rows that satisfy the condition in the `WHERE` clause. The `*` means to count all rows.
     - It will return the count of employees who have the maximum `months * salary` value.

2. **FROM Employee**
   - `FROM Employee`: This specifies that we are querying data from the `Employee` table. The table contains details of employees, such as `months` (the number of months an employee has worked) and `salary` (the employee's salary).

3. **WHERE (months * salary) = (SELECT MAX(months * salary) FROM Employee)**
   - `WHERE`: This clause filters the rows that meet a specific condition. In this case, we want to filter employees whose `months * salary` is equal to the maximum `months * salary` from all employees.
   - `(months * salary)`: For each employee, it calculates the product of their `months` and `salary`.
   - `= (SELECT MAX(months * salary) FROM Employee)`: This is a subquery. It calculates the maximum value of `months * salary` from the entire `Employee` table.
     - The subquery runs first, fetching the maximum `months * salary` value.
     - The outer query then uses this value to filter only the employees whose `months * salary` matches the maximum value.

4. **Subquery - `SELECT MAX(months * salary) FROM Employee`**
   - `SELECT MAX(months * salary)`: This part of the subquery calculates the maximum value of `months * salary` across all rows in the `Employee` table.
     - This will return a single value, which is the highest value of `months * salary` among all employees.
   - `FROM Employee`: This specifies that we are querying from the `Employee` table.

### Final Output:
- **`MAX(months * salary)`**: This will return the highest `months * salary` value from the employees who match the maximum value.
- **`COUNT(*)`**: This will return the number of employees who have this maximum `months * salary` value. If more than one employee has this maximum value, it will count all of them.

### Example:
Suppose we have the following `Employee` table:

| ID   | Name   | Months | Salary |
|------|--------|--------|--------|
| 1    | John   | 10     | 5000   |
| 2    | Jane   | 12     | 4500   |
| 3    | Alice  | 10     | 6000   |

- The `months * salary` for each employee is:
  - John: 10 * 5000 = 50000
  - Jane: 12 * 4500 = 54000
  - Alice: 10 * 6000 = 60000
  
- The **maximum value of `months * salary`** is 60000 (Alice's value).
- The query will select the employee(s) whose `months * salary` equals 60000 and return:
  - The **maximum value** (60000), and
  - The **count of employees** with this maximum value (in this case, just Alice, so the count is 1).

### Output Example:
| MAX(months * salary) | COUNT(*) |
|----------------------|----------|
| 60000                | 1        |
