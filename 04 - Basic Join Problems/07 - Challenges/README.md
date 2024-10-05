<h1 align='center'>Challenges</h1>

## Problem Statement
The task is to identify hackers based on the number of challenges they have completed. You need to find hackers who either have created the maximum number of challenges or those who have a unique number of challenges (not shared by any other hacker). The output should display each hacker's ID, name, and the total number of challenges they have completed.

### Explanation of the Problem:
1. **Input Tables**:
   - **Hackers Table**: Contains details about hackers, including their `hacker_id` and `name`.
   - **Challenges Table**: Contains data about challenges, including `hacker_id` and `challenge_id`.

2. **Output Requirements**:
   - The output should include:
     - Hacker ID
     - Hacker Name
     - Total Challenges Completed

3. **Approach**:
   - **Count Challenges**: For each hacker, count the number of challenges they have created.
   - **Find Maximum Count**: Determine the maximum number of challenges created by any hacker.
   - **Find Unique Counts**: Identify hackers with unique counts of challenges.
   - **Filter Results**: Select hackers based on the criteria above and sort the results accordingly.


## Source Code 
```sql
WITH challenge_count AS(
    SELECT hacker_id, COUNT(challenge_id) AS total_challenges
    FROM Challenges
    GROUP BY hacker_id
),

max_count AS(
    SELECT MAX(total_challenges) AS max_challenges
    FROM challenge_count
)

SELECT H.hacker_id, H.name, CC.total_challenges
FROM Hackers H
JOIN Challenge_count CC ON H.hacker_id = CC.hacker_id
WHERE CC.total_challenges = (SELECT max_challenges FROM max_count)
OR CC.total_challenges IN (
    SELECT total_challenges FROM
    challenge_count GROUP BY total_challenges
    HAVING COUNT(*) = 1
)

ORDER BY CC.total_challenges DESC, H.hacker_id;
```

## Source Code Explanation

```sql
WITH challenge_count AS (
    SELECT hacker_id, COUNT(challenge_id) AS total_challenges
    FROM Challenges
    GROUP BY hacker_id
),
```
- **CTE (Common Table Expression)**: `challenge_count` calculates the total challenges per hacker.
- **`SELECT hacker_id, COUNT(challenge_id) AS total_challenges`**: This counts the number of challenges for each hacker.
- **`FROM Challenges`**: Indicates that the data is coming from the `Challenges` table.
- **`GROUP BY hacker_id`**: Groups the results by `hacker_id`, so each hacker has a single row with their total challenge count.

---

```sql
max_count AS (
    SELECT MAX(total_challenges) AS max_challenges
    FROM challenge_count
)
```
- **CTE `max_count`**: This finds the maximum challenge count from the previous CTE (`challenge_count`).
- **`SELECT MAX(total_challenges) AS max_challenges`**: Retrieves the highest challenge count.
- **`FROM challenge_count`**: Uses the results from the previous CTE.

---

```sql
SELECT H.hacker_id, H.name, CC.total_challenges
FROM Hackers H
JOIN challenge_count CC ON H.hacker_id = CC.hacker_id
```
- **Main Query**: Combines data from the `Hackers` table and the `challenge_count` CTE.
- **`JOIN challenge_count CC ON H.hacker_id = CC.hacker_id`**: Links each hacker with their total challenge count.

---

```sql
WHERE CC.total_challenges = (SELECT max_challenges FROM max_count)
OR CC.total_challenges IN (
    SELECT total_challenges FROM
    challenge_count GROUP BY total_challenges
    HAVING COUNT(*) = 1
)
```
- **`WHERE` Clause**: Filters the results to include:
  - **Condition 1**: Hackers who have the maximum number of challenges.
  - **Condition 2**: Hackers with unique challenge counts:
    - **Inner Query**: This selects challenge counts from `challenge_count`.
    - **`HAVING COUNT(*) = 1`**: Ensures that only counts that occur once (unique) are included.

---

```sql
ORDER BY CC.total_challenges DESC, H.hacker_id;
```
- **`ORDER BY` Clause**: Sorts the final result:
  - **Primary Sort**: By `total_challenges` in descending order (higher counts first).
  - **Secondary Sort**: By `hacker_id` for any ties in challenge counts.

### Example:
Suppose we have the following data:

**Hackers Table**:
| hacker_id | name    |
|-----------|---------|
| 1         | Alice   |
| 2         | Bob     |
| 3         | Charlie  |

**Challenges Table**:
| challenge_id | hacker_id |
|--------------|-----------|
| 101          | 1         |
| 102          | 1         |
| 103          | 2         |
| 104          | 3         |
| 105          | 3         |

- **Challenge Count Calculation**:
    - Alice (1): 2 challenges
    - Bob (2): 1 challenge
    - Charlie (3): 2 challenges

- **Max Count**: The maximum number of challenges is 2 (for Alice and Charlie).
- **Final Output**: The query will return:
    - Alice (2 challenges)
    - Charlie (2 challenges)

This explanation should give you a comprehensive understanding of the problem, the solution approach, and the SQL code implementation!
