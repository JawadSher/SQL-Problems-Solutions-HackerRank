<h1 align='center'>The - PADS</h1>

## Problem Statement

**Problem URL :** [The PADS](https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/e63ab53e-1ae6-4f9a-acbd-57154446e8ce)
![image](https://github.com/user-attachments/assets/21556b47-242d-4f32-83b0-3e87a548f442)
![image](https://github.com/user-attachments/assets/7e0954b0-37e3-4345-9eb7-434965f03a00)

## Problem Solution
```sql
SELECT CONCAT(NAME, '(',SUBSTR(Occupation, 1,1),')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;
```

## Problem Solution Explanation
These two SQL queries are related to a table called `OCCUPATIONS`, which contains columns like `NAME` (presumably the name of a person) and `Occupation` (the occupation of that person). The queries perform operations like concatenating strings, counting the number of people with each occupation, and organizing the data in a specific order. Here's a detailed explanation of each query:

### Query 1: Display Names with Occupation Abbreviation

```sql
SELECT CONCAT(NAME, '(', SUBSTR(Occupation, 1,1), ')')
FROM OCCUPATIONS
ORDER BY NAME;
```

#### Breakdown:

- **`CONCAT(NAME, '(', SUBSTR(Occupation, 1,1), ')')`**:
  - This part constructs a string by concatenating:
    1. `NAME`: The name of the person from the `OCCUPATIONS` table.
    2. `'('`: A literal opening parenthesis.
    3. `SUBSTR(Occupation, 1, 1)`: The first letter of the person's occupation, extracted using the `SUBSTR` function, which takes the string `Occupation` and starts from position 1, extracting 1 character.
    4. `')'`: A closing parenthesis.
  - Essentially, this concatenates the person's name with the first letter of their occupation in parentheses.
  
  Example:
  - If the `NAME` is **"John"** and `Occupation` is **"Doctor"**, the result will be **"John(D)"**.
  - If the `NAME` is **"Alice"** and `Occupation` is **"Engineer"**, the result will be **"Alice(E)"**.

- **`ORDER BY NAME`**:
  - This sorts the output alphabetically by `NAME`, so the results are displayed in ascending order by name.

#### Example Output:
Assuming we have the following entries in the `OCCUPATIONS` table:

| NAME   | Occupation  |
|--------|-------------|
| John   | Doctor      |
| Alice  | Engineer    |
| Bob    | Artist      |
| Charlie| Doctor      |

The result of the query would be:

| Result        |
|---------------|
| Alice(E)      |
| Bob(A)        |
| Charlie(D)    |
| John(D)       |

---

### Query 2: Count People in Each Occupation Group

```sql
SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;
```

#### Breakdown:

- **`CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')`**:
  - This concatenates multiple parts to form a sentence-like output:
    1. `'There are a total of '` is a static string.
    2. `COUNT(*)` counts the number of rows (people) with the same occupation.
    3. `' '` is a space to separate words.
    4. `LOWER(Occupation)` converts the occupation name to lowercase to make the output look more natural.
    5. `'s.'` adds an "s" at the end of the occupation to pluralize it and finishes the sentence with a period.

  Example:
  - If there are 3 doctors, the result would be: **"There are a total of 3 doctors."**
  - If there are 2 engineers, the result would be: **"There are a total of 2 engineers."**

- **`GROUP BY Occupation`**:
  - This groups the rows by `Occupation`, so that `COUNT(*)` will be applied to each occupation separately. Essentially, it counts how many people have the same occupation.

- **`ORDER BY COUNT(*), Occupation`**:
  - This orders the result by the count of people in each occupation, in ascending order. If two occupations have the same count, it orders them alphabetically by occupation.

#### Example Output:
Assuming we have the following data in the `OCCUPATIONS` table:

| NAME    | Occupation |
|---------|------------|
| John    | Doctor     |
| Alice   | Engineer   |
| Bob     | Artist     |
| Charlie | Doctor     |
| Dave    | Engineer   |
| Eve     | Artist     |
| Frank   | Engineer   |

In this case, there are:
- 2 artists
- 3 engineers
- 2 doctors

So the query result would be:

| Result                          |
|----------------------------------|
| There are a total of 2 artists.  |
| There are a total of 2 doctors.  |
| There are a total of 3 engineers.|

The results are first sorted by the count of people (ascending) and then by the occupation name in case of ties.

---

### Summary of the Queries:

- **Query 1**: Displays names with the first letter of their occupation, sorted alphabetically by name.
- **Query 2**: Counts the number of people for each occupation, formats the count into a readable sentence, and orders the results by the number of people in each occupation and then alphabetically by occupation.

These queries provide both individual formatting and aggregate information in a structured and user-friendly format.
