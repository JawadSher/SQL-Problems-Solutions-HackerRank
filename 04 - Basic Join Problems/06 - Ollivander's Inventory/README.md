<h1 align='center'>Ollivander's - Inventory</h1>

## Problem Statement

**Problem URL :** [Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true)

The problem titled **"Harry Potter and the Wands"** on HackerRank is part of the SQL domain. Here's a breakdown of the problem:

### Problem Statement:

In the Harry Potter universe, there is a famous shop called **Ollivander's** that sells magical wands. Every wand has certain properties associated with it:
- **id**: a unique identifier for each wand.
- **age**: the age of the wandmaker who created the wand.
- **coins_needed**: the number of coins needed to purchase the wand.
- **power**: the power level of the wand.

You are provided with two tables:
1. **Wands**:
   - `code`: the unique wand identifier.
   - `coins_needed`: the cost to buy the wand.
   - `power`: the power level of the wand.
   
2. **Wands_Property**:
   - `code`: the wand identifier (which matches with the `code` in the Wands table).
   - `age`: the age of the wandmaker.
   - `is_evil`: specifies whether the wand is evil (1 for true, 0 for false).

### Task:
Write a SQL query to find the details of the **most powerful wands** (`max(power)`) that can be bought with the minimum number of coins (`coins_needed`) for each age group of wandmakers who are not evil (`is_evil = 0`).

You are required to:
- Return the result ordered by `age` in ascending order, and if two or more wands share the same `age`, order them by `power` in descending order.

### Expected Output:
- `age`: the age of the wandmaker.
- `coins_needed`: the number of coins needed to buy the wand.
- `power`: the power level of the wand.

### Solution Approach:
1. **Join the Tables**: You'll need to join the `Wands` and `Wands_Property` tables using the common `code`.
   
2. **Filter Out Evil Wands**: Only consider wands where `is_evil = 0`.

3. **Find the Most Powerful Wand per Age Group**: For each wandmaker's `age`, find the wand with the maximum `power`. However, if multiple wands have the same `power`, the one with the minimum `coins_needed` should be selected.

4. **Sort the Output**: The final result should be sorted by `age` in ascending order and `power` in descending order if ages are the same.


## Problem Solution
```sql
SELECT 
  wand.id, 
  wandP.age, 
  wand.coins_needed, 
  wand.power 
FROM 
  Wands wand 
  JOIN Wands_Property wandP ON wand.code = wandP.code 
WHERE 
  is_evil = 0 
  AND coins_needed = (
    SELECT 
      MIN(w.coins_needed) 
    FROM 
      Wands as w 
      JOIN Wands_Property as wp ON w.code = wp.code 
    WHERE 
      w.power = wand.power 
      AND wp.age = wandP.age
  ) 
ORDER BY 
  wand.power DESC, 
  wandP.age DESC;

```

## Problem Solution Explanation

Let's break down your SQL query step by step, explaining how each part works and the overall approach. The goal of this query is to select information about non-evil wands with the minimum required coins for a specific combination of power and age.

#### 1. `SELECT wand.id, wandP.age, wand.coins_needed, wand.power`

This line specifies the columns you want to retrieve from the result set:
- **`wand.id`**: The unique identifier of the wand.
- **`wandP.age`**: The age of the wand from the `Wands_Property` table.
- **`wand.coins_needed`**: The number of coins required to buy the wand from the `Wands` table.
- **`wand.power`**: The power of the wand from the `Wands` table.

### Example:
Imagine there are wands like this:
```
wand.id | wand.coins_needed | wand.power
1       | 10                | 50
2       | 15                | 40
```
And properties like this:
```
wandP.age | wand.code
20        | 1
30        | 2
```
This will return the `id`, `age`, `coins_needed`, and `power` of non-evil wands (filtered in the next steps).

#### 2. `FROM Wands wand JOIN Wands_Property wandP ON wand.code = wandP.code`

This line specifies the tables you're working with (`Wands` and `Wands_Property`) and how to join them:
- **`JOIN`**: You're joining the `Wands` and `Wands_Property` tables based on the common column `code`.
- The `JOIN` means for each row in `Wands`, it finds a matching row in `Wands_Property` where the `code` is the same, creating a combined dataset.

### Example:
If `Wands` has a wand with `code = 1` and `Wands_Property` has a matching row with `code = 1`, it will combine these rows into one result. For example:
```
wand.code = 1 and wandP.code = 1 -> Combined result: {id, age, coins_needed, power}
```

#### 3. `WHERE is_evil = 0`

This line filters the data:
- **`is_evil = 0`**: Only non-evil wands are included in the result set. The `is_evil` column indicates whether the wand is evil (1) or not evil (0).

### Example:
If the `Wands` table contains a wand with `is_evil = 1`, it will be excluded from the results. Only wands with `is_evil = 0` will remain in the result.

#### 4. `AND coins_needed = (...)`

This condition ensures that only wands with the minimum required coins for a specific combination of power and age are selected. The **subquery** is used to determine the minimum value of `coins_needed`.

### Subquery Explanation:

#### 5. `(SELECT MIN(w.coins_needed) FROM Wands as w JOIN Wands_Property as wp ON w.code = wp.code WHERE w.power = wand.power AND wp.age = wandP.age)`

This subquery finds the minimum value of `coins_needed` for wands that have:
- The same **power** as the outer query's `wand.power`.
- The same **age** as the outer query's `wandP.age`.

- **`SELECT MIN(w.coins_needed)`**: This selects the minimum number of coins needed to purchase a wand that meets the specified conditions.
  
- **`JOIN`**: The same join as in the main query, linking `Wands` and `Wands_Property` on `code`.

- **`WHERE w.power = wand.power`**: Ensures the subquery filters for wands with the same power as the current wand in the outer query.

- **`AND wp.age = wandP.age`**: Ensures the subquery filters for wands with the same age as the current wand in the outer query.

### Example:
Suppose you are currently looking at a wand with `power = 50` and `age = 20`. The subquery will find the minimum `coins_needed` for wands that also have `power = 50` and `age = 20` from the dataset.

#### 6. `ORDER BY wand.power DESC, wandP.age DESC`

After filtering for the wands with the minimum `coins_needed`, the results are ordered:
- **`wand.power DESC`**: Sorts the results in descending order by the wand's power. Wands with higher power will appear first.
- **`wandP.age DESC`**: If two wands have the same power, they will be further sorted by age in descending order. Older wands will appear first.

### Example:
If the resulting dataset looks like this:
```
wand.id | wandP.age | wand.coins_needed | wand.power
1       | 30        | 15                | 50
2       | 20        | 10                | 40
```
After applying the `ORDER BY` clause, the rows will be ordered by power and then by age, like this:
```
wand.id | wandP.age | wand.coins_needed | wand.power
1       | 30        | 15                | 50
2       | 20        | 10                | 40
```

### Overall Approach:
1. **Filter non-evil wands**: The query starts by filtering out evil wands using `WHERE is_evil = 0`.
2. **Join the `Wands` and `Wands_Property` tables**: It joins these two tables on the `code` column to bring together information about wands and their properties.
3. **Find minimum coins needed**: The subquery ensures that for each wand, you only select those with the minimum number of coins needed for wands with the same power and age.
4. **Sort by power and age**: Finally, the results are sorted by wand power (high to low) and age (old to young).

The query efficiently retrieves the wands that are non-evil, filters out those that don't have the minimum `coins_needed` for a given power-age combination, and orders the results for display.
