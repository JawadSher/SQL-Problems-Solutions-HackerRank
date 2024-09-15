<h1 align='center'>Population - Density - Difference</h1>

## Problem Statement

**Problem URL :** [Population Density Difference](https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/bff620ab-2a23-4ea1-b488-515ced81040c)


## Problem Solution
```sql
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY
```

## Problem Solution Explanation
Let's break down the SQL query `SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY` in detail:

### 1. `SELECT MAX(POPULATION) - MIN(POPULATION)`
- **`SELECT`**: This keyword is used to specify that you're retrieving data from the database.

- **`MAX(POPULATION)`**: 
  - `MAX` is an aggregate function that returns the maximum value from a column.
  - In this case, `MAX(POPULATION)` will return the highest population value from the `POPULATION` column in the `CITY` table.

- **`MIN(POPULATION)`**: 
  - `MIN` is an aggregate function that returns the minimum value from a column.
  - Here, `MIN(POPULATION)` will return the smallest population value from the `POPULATION` column in the `CITY` table.

- **`MAX(POPULATION) - MIN(POPULATION)`**: 
  - This part of the query subtracts the smallest population (`MIN(POPULATION)`) from the largest population (`MAX(POPULATION)`).
  - The result will give the **range** of populations in the `CITY` table, i.e., the difference between the most populous and the least populous cities.

### 2. `FROM CITY`
- **`FROM CITY`**: 
  - This specifies the table from which to retrieve the data. In this case, the `CITY` table, which contains information about cities including their population, is being used.

### Putting it all together:
- The query calculates the difference between the maximum and minimum population values in the `CITY` table.
- The result will be a single number, representing the **range** of populations (i.e., how much the population of the largest city exceeds the population of the smallest city).

### Example:
If the `CITY` table has the following population data:

| Name    | Population |
|---------|------------|
| City A  | 1,000,000  |
| City B  | 500,000    |
| City C  | 5,000,000  |
| City D  | 2,000,000  |

- `MAX(POPULATION)` = 5,000,000 (City C has the largest population)
- `MIN(POPULATION)` = 500,000 (City B has the smallest population)

The result of the query would be:

```
5,000,000 - 500,000 = 4,500,000
```

So, the query would return `4,500,000`, which is the difference between the largest and smallest populations.
