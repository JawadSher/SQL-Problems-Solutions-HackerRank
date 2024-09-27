<h1 align='center'>The Report</h1>

## Problem Statement

**Problem URL :** [The Report](https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/410d323c-6c1a-4d4a-ae12-29e792ef31fd)
![image](https://github.com/user-attachments/assets/e789b0a7-3a1e-4515-9a45-56f1382ea6c2)
![image](https://github.com/user-attachments/assets/a8f4a156-f5c2-4744-8088-c4716edfe395)
![image](https://github.com/user-attachments/assets/9883239f-9ac4-4980-a926-4a4dfef42636)
![image](https://github.com/user-attachments/assets/c18e8ce7-6196-4e84-8414-59c8111f6599)
![image](https://github.com/user-attachments/assets/a97da54f-dc50-4d38-885b-19d86ac966d5)
![image](https://github.com/user-attachments/assets/10cd50e1-690a-4117-8cc4-2b1b6e532620)

## Problem Explanation
You are provided with two tables:

1. **Students** table:
   - Contains columns: `ID`, `Name`, and `Marks`.
   - Represents students' names and their respective marks.

2. **Grades** table:
   - Contains columns: `Grade`, `Min_Mark`, and `Max_Mark`.
   - Represents the grading scale, where each grade is associated with a range of marks (`Min_Mark` and `Max_Mark`).

### Your Task:
- Generate a report that shows **three columns**: `Name`, `Grade`, and `Marks`.
- **Conditions**:
  1. If a student's grade is **greater than or equal to 8**, display their `Name` in the output.
  2. If a student's grade is **less than 8**, replace their `Name` with `NULL`.
  3. You must join the `Students` table with the `Grades` table based on the `Marks` range, where `Marks` fall between `Min_Mark` and `Max_Mark`.
  4. Sort the final result by:
     - `Grade` in descending order.
     - If the `Grade` is the same, sort by `Name` alphabetically (ascending).
     - If the `Name` is `NULL`, sort by `Marks` in ascending order.

## Problem Solution
```sql
SELECT
    CASE 
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
    END AS Name,
G.Grade, S.Marks FROM Students S
JOIN Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, Name ASC, S.Marks ASC;
```

## Problem Solution Explanation

### 1. `SELECT`

The `SELECT` clause defines what data you want to retrieve and display in your result. In this query, we want to show three columns:

- **`Name`**: The student's name, but with a condition attached (explained below).
- **`Grade`**: The grade the student has based on their marks.
- **`Marks`**: The student's actual marks from the `Students` table.

---

### 2. `CASE WHEN G.Grade >= 8 THEN S.Name ELSE NULL END AS Name`

- **`CASE WHEN`**: This is a conditional expression.
  - **Condition**: If the student's `Grade` (from the `Grades` table, aliased as `G`) is **greater than or equal to 8**, then display the student's `Name` (from the `Students` table, aliased as `S`).
  - **Else**: If the `Grade` is less than 8, return `NULL` instead of the name.
  
  **Example**:
  - If the student's marks give them a grade of 9, their name will be displayed (e.g., **Alice**).
  - If the student's marks give them a grade of 7, their name will be `NULL`.

---

### 3. `G.Grade`

This selects the **`Grade`** column from the `Grades` table (aliased as `G`). It represents the student's grade based on their marks.

**Example**:
- For a student with 85 marks, if the grade boundaries are as follows:
  - `Min_Mark = 80, Max_Mark = 100, Grade = 9`, the student will receive a grade of 9.

---

### 4. `S.Marks`

This selects the **`Marks`** column from the `Students` table (aliased as `S`). It represents the student's marks.

**Example**:
- A student with 72 marks will have `Marks = 72` in the output.

---

### 5. `FROM Students S`

This specifies that the main data will come from the **`Students`** table (aliased as `S`). All rows from this table will be included in the query unless filtered out by a `JOIN` or `WHERE` condition.

---

### 6. `JOIN Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark`

- **`JOIN`**: This performs an **INNER JOIN** between the `Students` table and the `Grades` table. An **INNER JOIN** only includes rows where there is a match in both tables.
- **Condition**: The join condition is specified using `ON`, which checks whether a student's `Marks` (from the `Students` table) fall between `Min_Mark` and `Max_Mark` (from the `Grades` table).
  - This matches each student's marks to the correct grade range from the `Grades` table.

**Example**:
- If a student has 85 marks, and the range in the `Grades` table is:
  - `Min_Mark = 80`, `Max_Mark = 90`, and `Grade = 9`, the student will be assigned `Grade = 9`.

---

### 7. `ORDER BY G.Grade DESC, Name ASC, S.Marks ASC`

This clause sorts the results in the specified order:

- **`G.Grade DESC`**: Sorts by `Grade` in **descending order** (highest to lowest). Students with the highest grades will appear first.
  
  **Example**:
  - A student with `Grade = 9` will appear before a student with `Grade = 7`.

- **`Name ASC`**: For students with the same grade, sorts by their `Name` in **alphabetical order** (ascending). If the name is `NULL`, the sorting treats `NULL` appropriately.

  **Example**:
  - If two students both have `Grade = 9`, their names will be displayed in alphabetical order (e.g., **Alice** before **John**).

- **`S.Marks ASC`**: Finally, if the grades and names are the same (or `NULL` for the name), the query sorts by `Marks` in ascending order.

  **Example**:
  - For students with the same `Grade` and `NULL` for the `Name`, those with fewer marks will appear first (e.g., **Marks = 60** before **Marks = 70**).

---

### Example Data and Output:

#### **Students Table:**
| ID  | Name  | Marks |
|-----|-------|-------|
| 1   | Alice | 85    |
| 2   | Bob   | 60    |
| 3   | John  | 92    |

#### **Grades Table:**
| Grade | Min_Mark | Max_Mark |
|-------|----------|----------|
| 9     | 80       | 100      |
| 7     | 60       | 79       |

#### **Resulting Output:**
| Name  | Grade | Marks |
|-------|-------|-------|
| John  | 9     | 92    |
| Alice | 9     | 85    |
| NULL  | 7     | 60    |

#### Explanation:
- **John** and **Alice** both have grades of 9, so their names are displayed.
- **Bob** has a grade of 7, so his name is replaced with `NULL`.
- The output is sorted by grade (highest first), then name (alphabetically), and finally by marks in ascending order when grades are the same.

---

### Summary:
- The `CASE` statement handles the condition of showing names only for students with grades 8 or higher.
- The `JOIN` condition ensures that each student's marks are matched with the correct grade range.
- The `ORDER BY` clause sorts the results according to the problem's requirements, ensuring correct display order.
