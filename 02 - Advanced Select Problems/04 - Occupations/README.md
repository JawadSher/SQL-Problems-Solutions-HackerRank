<h1 align='center'>Occupation</h1>

## Problem Statement

**Problem URL :** [Occupations](https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/f2e80868-a1f2-44de-a6e7-fca10506b933)
![image](https://github.com/user-attachments/assets/8428b2cf-55d4-41ac-b961-5bcc243668a7)
![image](https://github.com/user-attachments/assets/1e8b0d1c-6d7c-4d06-851f-1184512c095d)

## Problem Solution
```sql
WITH MY_CTE AS (
    SELECT
    CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
    CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
    CASE WHEN Occupation = 'Singer' THEN NAME END AS Singer,
    CASE WHEN Occupation = 'Actor'  THEN Name END AS Actor,
        
    ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS R
    FROM OCCUPATIONS
)

SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor) FROM MY_CTE
GROUP BY R;
```

## Problem Solution Explanation
This SQL query involves using a **Common Table Expression (CTE)** (`MY_CTE`) and the **`ROW_NUMBER()`** window function to organize data based on different occupations. Let's break it down in detail:

### Step 1: Defining the CTE (`MY_CTE`)

```sql
WITH MY_CTE AS (
    SELECT
    CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
    CASE WHEN Occupation = 'Professor' THEN Name END AS Professor,
    CASE WHEN Occupation = 'Singer' THEN Name END AS Singer,
    CASE WHEN Occupation = 'Actor'  THEN Name END AS Actor,
        
    ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS R
    FROM OCCUPATIONS
)
```

- **`WITH MY_CTE AS (...)`**:
  - This is the definition of a **Common Table Expression (CTE)** named `MY_CTE`. A CTE is a temporary result set that can be referred to within the main query.

- **`SELECT` Statement inside the CTE**:
  - The `SELECT` statement retrieves columns from the `OCCUPATIONS` table.
  - **`CASE WHEN`** statements are used to check the `Occupation` field, and based on its value, the `Name` field is assigned to a specific alias (`Doctor`, `Professor`, `Singer`, or `Actor`). For example:
    - If the `Occupation` is 'Doctor', then the `Name` is stored in the `Doctor` column.
    - If the `Occupation` is 'Professor', then the `Name` is stored in the `Professor` column.
    - The same logic applies for 'Singer' and 'Actor'.
  - **`END AS Doctor, Professor, ...`**:
    - Each `CASE` statement creates a new column (`Doctor`, `Professor`, `Singer`, `Actor`) in the result set. Only one of these columns will have a non-null value for each row, depending on the `Occupation`.
  
- **`ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS R`**:
  - The `ROW_NUMBER()` function generates a sequential number for each row within a partition of the result set. 
  - **`PARTITION BY Occupation`**: The rows are partitioned (grouped) by the `Occupation` column (i.e., each group will contain all the rows for doctors, professors, etc.).
  - **`ORDER BY Name`**: Within each partition (occupation), the rows are ordered by the `Name` column alphabetically.
  - **`AS R`**: The generated row number for each name in its respective occupation is stored in the column `R`.

This CTE results in a table where each row contains either a value in the `Doctor`, `Professor`, `Singer`, or `Actor` columns, depending on the occupation, and each row has a unique `R` value for each occupation.

### Step 2: Main Query

```sql
SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor) FROM MY_CTE
GROUP BY R;
```

- **`SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor)`**:
  - For each value of `R`, this query retrieves the maximum value for `Doctor`, `Professor`, `Singer`, and `Actor`. Since each row from the CTE will have only one non-null value (depending on the occupation), the `MAX()` function is used to retrieve the non-null value for that row.
    - For example, if `Doctor` has a non-null value for a given row, the `MAX(Doctor)` will return that value, while the rest (Professor, Singer, Actor) will return null.
  
- **`FROM MY_CTE`**:
  - The query is selecting from the CTE `MY_CTE` defined in the first step.

- **`GROUP BY R`**:
  - The result is grouped by the `R` column, meaning that for each `R` value, there will be one row in the output. 
  - Since `R` assigns unique numbers to names within each occupation, the `GROUP BY` ensures that we are retrieving the respective `Doctor`, `Professor`, `Singer`, and `Actor` for each position (`R`).

### Explanation of the Output

The query results in a table where each row contains a name for each occupation based on their `R` value. For example:

| Doctor  | Professor | Singer  | Actor   |
|---------|-----------|---------|---------|
| Alice   | Charlie   | David   | Emma    |
| Bob     | Dan       | Edward  | Frank   |

Here, `R = 1` would correspond to the first row (the first name alphabetically for each occupation), and `R = 2` corresponds to the second row, and so on. Each row combines names from all four occupations based on the row number assigned by the `ROW_NUMBER()` function.

### Key Concepts

- **`CASE WHEN`**: Conditional logic to populate columns based on occupation.
- **`ROW_NUMBER()`**: Assigns sequential numbers to rows within each occupation.
- **`MAX()`**: Aggregation function used to select the non-null value in each row for `Doctor`, `Professor`, `Singer`, and `Actor`.
- **`GROUP BY`**: Groups rows by the row number `R` to ensure one result per row number.

The final output is a list where each row contains one doctor, one professor, one singer, and one actor, all aligned based on their names in alphabetical order.
