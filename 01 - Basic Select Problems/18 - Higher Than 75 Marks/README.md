<h1 align='center'>Higher - Than - 75 - Marks</h1>

## Problem Statement

**Problem URL :** [Higher Than 75 Marks](https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/d446c274-b924-471f-bc9a-153ed2225701)
![image](https://github.com/user-attachments/assets/751936a5-b9fd-4239-a8d3-46f756182df0)

## Problem Solution
```sql
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID;

```

## Problem Solution Explanation
The SQL query you provided performs the following actions on a table named `STUDENTS`:

Let's break down this query step-by-step:

1. **SELECT NAME**: This specifies that the query will return only the `NAME` column from the `STUDENTS` table.

2. **FROM STUDENTS**: This indicates that the data is being retrieved from the table named `STUDENTS`.

3. **WHERE MARKS > 75**: This is a filter condition that ensures only students with marks greater than 75 are considered in the result set.

4. **ORDER BY RIGHT(NAME, 3), ID**: This specifies how the result set should be ordered. The `ORDER BY` clause sorts the results based on the following:
   - **RIGHT(NAME, 3)**: This extracts the last 3 characters of the `NAME` column and sorts the result set based on these characters.
   - **ID**: If there are multiple names with the same last 3 characters, the `ID` column is used as a secondary sorting criterion.

### Detailed Example

Suppose we have the following data in the `STUDENTS` table:

| ID | NAME     | MARKS |
|----|----------|-------|
| 1  | Alice    | 85    |
| 2  | Bob      | 90    |
| 3  | Charlie  | 80    |
| 4  | David    | 78    |
| 5  | Eve      | 82    |
| 6  | Frank    | 70    |

**Step-by-Step Execution:**

1. **Filtering**:
   - We apply the condition `MARKS > 75`, which results in the following rows:
   
   | ID | NAME     | MARKS |
   |----|----------|-------|
   | 1  | Alice    | 85    |
   | 2  | Bob      | 90    |
   | 3  | Charlie  | 80    |
   | 4  | David    | 78    |
   | 5  | Eve      | 82    |

2. **Sorting**:
   - The `RIGHT(NAME, 3)` function extracts the last 3 characters from each name:
   
     - `Alice` -> `ice`
     - `Bob` -> `Bob`
     - `Charlie` -> `lie`
     - `David` -> `vid`
     - `Eve` -> `eve`
   
   - Sorting these last 3 characters alphabetically gives us the order: `Bob`, `eve`, `ice`, `lie`, `vid`.

   - Within each group of names with the same last 3 characters, the results are further ordered by the `ID` column. However, in this case, all names are unique in their last 3 characters, so sorting by `ID` is not applied.

   The sorted result based on the `RIGHT(NAME, 3)` and `ID` would be:

   | NAME    |
   |---------|
   | Bob     |
   | Eve     |
   | Alice   |
   | Charlie |
   | David   |

### Final Output

After applying the sorting criteria, the final output of the query will be:

```plaintext
Bob
Eve
Alice
Charlie
David
```

This output is derived from first sorting the names based on the last 3 characters and then using the `ID` as a secondary criterion (though in this example, it does not affect the result because the last 3 characters are unique).
