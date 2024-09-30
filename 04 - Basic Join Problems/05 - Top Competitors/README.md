<h1 align='center'>Top - Competitors</h1>

## Problem Statement

**Problem URL :** [Top Competitors](https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/a1b9435f-df33-464d-ab53-36638d7c3459)
![image](https://github.com/user-attachments/assets/e8dee7c1-3215-472b-9149-af0f9faec791)
![image](https://github.com/user-attachments/assets/b6c67406-b5fc-41a1-a971-d00178ef649d)
![image](https://github.com/user-attachments/assets/f93c8655-e560-4c0d-97f4-e1e4f0c40b92)
![image](https://github.com/user-attachments/assets/97d9c24b-2704-4f2a-b6a4-e5371e3429bc)
![image](https://github.com/user-attachments/assets/4fc8015e-1e15-413f-9d38-3f38d8a159d1)
![image](https://github.com/user-attachments/assets/b2607c2e-0978-41f3-88a4-b2be76e51900)
![image](https://github.com/user-attachments/assets/54a9bd27-1ef4-4f8a-8087-00dc2a4b33c7)
![image](https://github.com/user-attachments/assets/daf8c550-5631-4e6c-bbf8-0d5f3ef591b5)
![image](https://github.com/user-attachments/assets/a44a8942-1716-450a-bc93-5bc6072239b4)
![image](https://github.com/user-attachments/assets/f4425aa3-ef89-4a58-b401-5da5d02e85a0)

1. **Full Score Submissions**: We need to find hackers who have achieved full scores in multiple challenges. A full score is defined as the submission score matching the challenge's maximum possible score.
2. **Grouping by Hackers**: The solution requires identifying hackers who have achieved full scores in more than one challenge.
3. **Sorting**: The hackers should be ordered by the number of full scores, and in case of a tie, by their `hacker_id`.
4. **Return Top Hackers**: Only those hackers who meet the criteria of having more than one full score should be displayed.
   
## Problem Solution
```sql
SELECT S.hacker_id, H.name FROM Submissions S

JOIN Hackers H ON S.hacker_id = H.hacker_id
JOIN Challenges C ON S.challenge_id = C.challenge_id
JOIN Difficulty D ON C.difficulty_level = D.difficulty_level

WHERE S.score = D.score
GROUP BY S.hacker_id, H.name
HAVING COUNT(S.challenge_id) > 1
ORDER BY COUNT(S.challenge_id) DESC, S.hacker_id;
```

## Problem Solution Explanation

```sql
SELECT S.hacker_id, H.name
```
- **Explanation**: This line selects two columns: the `hacker_id` and the corresponding `name` of the hacker. These are the values we want to display in the output.
- **Example**: If a hacker with `hacker_id = 101` is named "Alice", this will output `101` and "Alice".

```sql
FROM Submissions S
JOIN Hackers H ON S.hacker_id = H.hacker_id
```
- **Explanation**: This `JOIN` connects the `Submissions` table (`S`) with the `Hackers` table (`H`) using the `hacker_id` column. It allows us to get the hacker's name alongside their submission details.
- **Example**: For each submission made by a hacker, we can find their name by matching their `hacker_id` in both tables.

```sql
JOIN Challenges C ON S.challenge_id = C.challenge_id
JOIN Difficulty D ON C.difficulty_level = D.difficulty_level
```
- **Explanation**: These `JOIN`s link the `Submissions` table with the `Challenges` and `Difficulty` tables, using the `challenge_id` and `difficulty_level`. This provides the challenge and difficulty information needed to check if the submission score is a full score.
- **Example**: If a submission has a `challenge_id = 10`, we can retrieve the corresponding `difficulty_level` and challenge data.

```sql
WHERE S.score = D.score
```
- **Explanation**: This `WHERE` condition ensures that we only consider submissions where the hacker’s score equals the challenge’s maximum possible score (i.e., a full score).
- **Example**: If the difficulty level of a challenge is `5`, and the hacker's submission has a score of `5`, it counts as a full score.

```sql
GROUP BY S.hacker_id, H.name
```
- **Explanation**: This groups the results by `hacker_id` and `name`, so that we can aggregate data about each hacker’s submissions and apply functions like `COUNT()` to find how many full scores they have achieved.
- **Example**: If hacker `101` has made multiple submissions, they will be grouped under a single row to calculate the number of full scores.

```sql
HAVING COUNT(S.challenge_id) > 1
```
- **Explanation**: This ensures that only hackers with more than one full score are included in the final result. `COUNT(S.challenge_id)` counts the number of distinct full-score submissions for each hacker.
- **Example**: If hacker `101` achieved full scores in 3 different challenges, they will be included in the results.

```sql
ORDER BY COUNT(S.challenge_id) DESC, S.hacker_id
```
- **Explanation**: The results are sorted by the number of full scores in descending order (`COUNT(S.challenge_id) DESC`). If two hackers have the same number of full scores, they are further sorted by `hacker_id` in ascending order.
- **Example**: If hacker `101` has 3 full scores and hacker `102` has 2 full scores, hacker `101` will appear before hacker `102`.

---

### Overall Query Workflow:
1. **Filter full scores**: Select submissions where the hacker achieved a full score.
2. **Group by hacker**: Group submissions by `hacker_id` to count how many full-score challenges each hacker has completed.
3. **Filter hackers with multiple full scores**: Only include hackers who have more than one full score.
4. **Sort the output**: Order the hackers by the number of full scores and by `hacker_id` if there's a tie.
