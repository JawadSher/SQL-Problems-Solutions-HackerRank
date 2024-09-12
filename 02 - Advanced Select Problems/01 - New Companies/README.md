<h1 align='center'>New - Companies</h1>

## Problem Statement

**Problem URL :** [New Companies](https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/2f616986-607e-4b8b-bf05-62eb30f50be3)
![image](https://github.com/user-attachments/assets/ae8c233f-6496-439b-9036-8548f7fce8ac)
![image](https://github.com/user-attachments/assets/45367f00-0fb4-4d2f-9165-34052a7c9b56)
![image](https://github.com/user-attachments/assets/c0d98460-d30d-4f21-9ebe-7e5d67ad5758)
![image](https://github.com/user-attachments/assets/8667dffc-6cbb-4178-b9d8-563c1f6046b6)
![image](https://github.com/user-attachments/assets/aef8919d-042b-47e4-843f-03114c24a876)
![image](https://github.com/user-attachments/assets/f77149a9-ed78-42a5-bc99-fd307b477743)
![image](https://github.com/user-attachments/assets/0f8f8f9e-2a03-43dd-bf26-17d1b1deb9f7)
![image](https://github.com/user-attachments/assets/5e8151ca-26d8-437b-b313-53811e898b10)
![image](https://github.com/user-attachments/assets/41aea25d-a62d-4464-a3cc-05ca0afd7d8f)
![image](https://github.com/user-attachments/assets/485faebb-6cf8-4e75-8386-8944d597b627)

## Problem Explanation
The **"New Companies"** problem from SQL on HackerRank involves analyzing the hierarchy of companies that Amber’s conglomerate corporation recently acquired. Each company has multiple layers of management, and the objective is to extract specific details about these companies. The provided dataset contains multiple tables, each representing a different level in the hierarchy, such as lead managers, senior managers, managers, and employees.

Your task is to retrieve:
1. The **company_code** (identifier for each company).
2. The **founder** of the company.
3. The **number of lead managers** for each company.
4. The **number of senior managers**.
5. The **number of managers**.
6. The **number of employees**.

## Problem Solution
```sql
SELECT c.company_code, c.founder,
       COUNT(DISTINCT l.lead_manager_code), 
       COUNT(DISTINCT s.senior_manager_code), 
       COUNT(DISTINCT m.manager_code), 
       COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager l ON c.company_code = l.company_code
LEFT JOIN Senior_Manager s ON l.lead_manager_code = s.lead_manager_code
LEFT JOIN Manager m ON s.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

```

## Problem Solution Explanation
The output must be grouped by `company_code` and ordered by `company_code` in ascending order. It’s important to handle potential duplicate records and ensure that the count for each role is distinct.

1. **`SELECT c.company_code, c.founder,`**:
   - **Purpose**: Selects the `company_code` and `founder` columns from the `Company` table.
   - **Explanation**: The `company_code` identifies each company, and the `founder` is the name of the individual who founded the company.

2. **`COUNT(DISTINCT l.lead_manager_code),`**:
   - **Purpose**: Counts the number of unique lead managers in the `Lead_Manager` table for each company.
   - **Explanation**: `DISTINCT` ensures that only unique `lead_manager_code` values are counted, avoiding duplicates in the count.

3. **`COUNT(DISTINCT s.senior_manager_code),`**:
   - **Purpose**: Counts the number of unique senior managers in the `Senior_Manager` table for each company.
   - **Explanation**: Similar to the previous count, `DISTINCT` ensures that only distinct senior managers are considered for each company.

4. **`COUNT(DISTINCT m.manager_code),`**:
   - **Purpose**: Counts the number of unique managers in the `Manager` table for each company.
   - **Explanation**: Again, `DISTINCT` ensures that only unique `manager_code` values are counted to avoid duplicates.

5. **`COUNT(DISTINCT e.employee_code)`**:
   - **Purpose**: Counts the number of unique employees in the `Employee` table for each company.
   - **Explanation**: `DISTINCT` is used here to ensure that only unique employees are counted.

6. **`FROM Company c`**:
   - **Purpose**: Specifies the base table `Company` from which the query starts.
   - **Explanation**: The `Company` table contains the basic details about each company, such as `company_code` and `founder`.

7. **`LEFT JOIN Lead_Manager l ON c.company_code = l.company_code`**:
   - **Purpose**: Performs a `LEFT JOIN` between the `Company` and `Lead_Manager` tables, matching records based on the `company_code`.
   - **Explanation**: A `LEFT JOIN` ensures that even if a company has no lead managers, it will still appear in the result set (with null values for the lead manager counts).

8. **`LEFT JOIN Senior_Manager s ON l.lead_manager_code = s.lead_manager_code`**:
   - **Purpose**: Joins the `Senior_Manager` table to the previous join result, based on `lead_manager_code`.
   - **Explanation**: This ensures that all senior managers under each lead manager are included in the count.

9. **`LEFT JOIN Manager m ON s.senior_manager_code = m.senior_manager_code`**:
   - **Purpose**: Joins the `Manager` table using `senior_manager_code` to link senior managers to their respective managers.
   - **Explanation**: This allows the query to count managers under each senior manager.

10. **`LEFT JOIN Employee e ON m.manager_code = e.manager_code`**:
    - **Purpose**: Joins the `Employee` table using `manager_code` to link employees to their respective managers.
    - **Explanation**: This ensures that all employees under each manager are included in the final count.

11. **`GROUP BY c.company_code, c.founder`**:
    - **Purpose**: Groups the results by `company_code` and `founder`.
    - **Explanation**: This is necessary to aggregate the counts for each company and its founder, ensuring that the counts are calculated for each company individually.

12. **`ORDER BY c.company_code`**:
    - **Purpose**: Orders the final output by `company_code` in ascending order.
    - **Explanation**: The problem specifies that the results must be sorted by the `company_code` in ascending order, which means the output will list companies in alphabetical order based on their codes.

---

### Summary:
This query efficiently retrieves the number of lead managers, senior managers, managers, and employees for each company by using multiple joins between related tables in a company hierarchy. The use of `DISTINCT` in the `COUNT` functions ensures that duplicates are not included, and the `LEFT JOIN` ensures that companies with missing roles still appear in the result set. Finally, the `GROUP BY` and `ORDER BY` clauses ensure the output is correctly grouped and sorted.
