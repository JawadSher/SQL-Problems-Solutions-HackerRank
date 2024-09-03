<h1 align='center'>Employee - Names</h1>

## Problem Statement

**Problem URL :** [Employee Names](https://www.hackerrank.com/challenges/name-of-employees/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/b9f35285-3461-4e21-b22c-7a4e3af92d41)
![image](https://github.com/user-attachments/assets/4b459beb-92c1-4d21-b6ba-388a5947a57f)
![image](https://github.com/user-attachments/assets/681b04de-7242-4afc-a245-3f8625a5432f)
![image](https://github.com/user-attachments/assets/fffd3c20-a7d0-40e4-bf6a-394412454444)

## Problem Solution
```sql
SELECT NAME FROM EMPLOYEE
ORDER BY NAME ASC;
```

## Problem Solution Explanation
The SQL query you provided:

```sql
SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC;
```

is used to retrieve and sort the names of employees from a table named `EMPLOYEE`. Here's a detailed breakdown of this query:

### Breakdown of the Query

1. **`SELECT NAME`**:
   - This part of the query specifies that only the `NAME` column from the `EMPLOYEE` table should be retrieved.

2. **`FROM EMPLOYEE`**:
   - This indicates that the data is coming from the table named `EMPLOYEE`.

3. **`ORDER BY NAME ASC`**:
   - This clause specifies that the results should be ordered based on the `NAME` column in ascending order (alphabetical order). `ASC` stands for "ascending" and is the default sorting order in SQL, so it's optional but included here for clarity.

### Example

Let's assume we have the following data in the `EMPLOYEE` table:

| ID | NAME       |
|----|------------|
| 1  | Alice      |
| 2  | Charlie    |
| 3  | Bob        |
| 4  | David      |
| 5  | Eve        |

**Execution Steps:**

1. **Selecting**:
   - The query retrieves only the `NAME` column from the table. The result before sorting would be:

   | NAME   |
   |--------|
   | Alice  |
   | Charlie|
   | Bob    |
   | David  |
   | Eve    |

2. **Sorting**:
   - The `ORDER BY NAME ASC` clause sorts the names in alphabetical order:
     - `Alice`
     - `Bob`
     - `Charlie`
     - `David`
     - `Eve`
   
   The sorting is performed in ascending alphabetical order.

### Final Output

After applying the sorting criteria, the final output of the query will be:

```plaintext
Alice
Bob
Charlie
David
Eve
```

### Detailed Explanation

- **Ascending Order**: Sorting in ascending order means that names are listed from A to Z. In alphabetical sorting, uppercase letters are usually ordered before lowercase letters if the collation settings of the database do not specify otherwise.
- **No Additional Criteria**: Since there is no additional criteria or secondary sort, names are simply sorted alphabetically without considering any other columns or conditions.

This query is straightforward and commonly used to display data in a sorted manner based on a specific column.
