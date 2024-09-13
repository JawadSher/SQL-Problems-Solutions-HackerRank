<h1 align='center'>Type - Of - Triangle</h1>

## Problem Statement

**Problem URL :** [Type of Triangle](https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/e3727dae-36d1-4e9e-a15d-96a782cebcfb)
![image](https://github.com/user-attachments/assets/96199ab9-4fee-4d02-afee-e8cc54a42171)

## Problem Solution
```sql
SELECT CASE
    WHEN A+B <= C OR B+C <= A OR C+A <= B THEN "Not A Triangle"
    WHEN A=B AND B=C THEN "Equilateral"
    WHEN A=B OR B=C OR C=A THEN "Isosceles"
    ELSE 'Scalene'
END
FROM TRIANGLES
```

## Problem Solution Explanation
The given SQL `SELECT CASE` statement is used to classify triangles based on the lengths of their sides. The conditions check if the triangle is valid, and then determine its type—whether it's **Equilateral**, **Isosceles**, or **Scalene**. Here's a breakdown of how it works:

### SQL `SELECT CASE` Structure

The `CASE` statement evaluates different conditions and returns a specific result based on the first condition that is true. In this case, the SQL query looks at three sides of a triangle (`A`, `B`, and `C`) and classifies the triangle accordingly:

- **"Not A Triangle"**: If the given sides do not satisfy the triangle inequality theorem.
- **"Equilateral"**: If all sides are equal.
- **"Isosceles"**: If two sides are equal.
- **"Scalene"**: If all sides are different.

### Breakdown of Conditions

1. **Checking for "Not A Triangle"**:
    ```sql
    WHEN A+B <= C OR B+C <= A OR C+A <= B THEN "Not A Triangle"
    ```
    - This condition checks if the given sides violate the **triangle inequality theorem**, which states that the sum of the lengths of any two sides of a triangle must be greater than the length of the remaining side.
    - If any of these conditions hold true (i.e., the sum of two sides is less than or equal to the third side), the result is **"Not A Triangle"**.

2. **Checking for "Equilateral"**:
    ```sql
    WHEN A=B AND B=C THEN "Equilateral"
    ```
    - This condition checks if all three sides are equal, which defines an **equilateral triangle**.
    - An equilateral triangle has all three sides of equal length, and all angles are 60 degrees.

3. **Checking for "Isosceles"**:
    ```sql
    WHEN A=B OR B=C OR C=A THEN "Isosceles"
    ```
    - This condition checks if any two sides are equal, which defines an **isosceles triangle**.
    - An isosceles triangle has at least two sides of equal length and two equal angles.

4. **Otherwise, "Scalene"**:
    ```sql
    ELSE 'Scalene'
    ```
    - If none of the above conditions are met, it is a **scalene triangle**.
    - A scalene triangle has all sides of different lengths and all angles are different.

### Example Scenarios

Let's look at some examples to understand the classifications:

#### Example 1: Valid Triangle (Equilateral)
- **A = 5, B = 5, C = 5**
- **Condition**: Since `A = B = C`, it satisfies the condition for an **equilateral triangle**.
- **Result**: "Equilateral"

#### Example 2: Valid Triangle (Isosceles)
- **A = 5, B = 5, C = 7**
- **Condition**: Since `A = B`, it satisfies the condition for an **isosceles triangle**.
- **Result**: "Isosceles"

#### Example 3: Valid Triangle (Scalene)
- **A = 3, B = 4, C = 5**
- **Condition**: Since `A ≠ B ≠ C`, it satisfies the condition for a **scalene triangle**.
- **Result**: "Scalene"

#### Example 4: Not A Triangle
- **A = 1, B = 2, C = 3**
- **Condition**: Since `A + B = 3` and `C = 3`, it violates the triangle inequality theorem. Hence, it's **not a valid triangle**.
- **Result**: "Not A Triangle"

#### Example 5: Not A Triangle
- **A = 1, B = 1, C = 3**
- **Condition**: Since `A + B = 2` and `C = 3`, the sum of two sides is less than the third side, so this is **not a valid triangle**.
- **Result**: "Not A Triangle"

### Summary

- The **triangle inequality theorem** ensures the sides form a valid triangle.
- If all sides are equal, it's **equilateral**.
- If two sides are equal, it's **isosceles**.
- If all sides are different, it's **scalene**.
- If the triangle inequality fails, it's **"Not A Triangle"**. 

This SQL query uses these checks to classify the triangles based on the given side lengths (`A`, `B`, `C`).
