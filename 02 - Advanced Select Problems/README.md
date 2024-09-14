<h1 align='center'>Binary - Tree - Nodes</h1>

## Problem Statement

**Problem URL :** [Binary Tree Nodes](https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/e1892df0-f395-460a-be82-a0940515a400)
![image](https://github.com/user-attachments/assets/486d80db-5f0e-42f0-81b7-e24b8bb9bbc3)
![image](https://github.com/user-attachments/assets/a2790183-c56f-4897-8105-aa1d0fc0eecb)

## Problem Solution
```sql
SELECT N,
    CASE
    WHEN P IS NULL THEN 'Root'
    WHEN (P IS NOT NULL) AND N IN (SELECT DISTINCT P FROM BST)THEN 'Inner'
    ELSE 'Leaf'
    END
FROM BST
ORDER BY N
```

## Problem Solution Explanation
This SQL query involves a table `BST` (likely representing a **Binary Search Tree**) with two columns: `N` (node) and `P` (parent). The goal of the query is to classify each node as a **'Root'**, **'Inner'**, or **'Leaf'**, based on the relationship between nodes and their parent nodes, and then order the results by the node value (`N`). Let's break down the query step by step.

### Query Explanation

```sql
SELECT N,
    CASE
    WHEN P IS NULL THEN 'Root'
    WHEN (P IS NOT NULL) AND N IN (SELECT DISTINCT P FROM BST)THEN 'Inner'
    ELSE 'Leaf'
    END
FROM BST
ORDER BY N;
```

### Step 1: `SELECT N,`

- **`SELECT N,`**: This part of the query retrieves the `N` column from the `BST` table. `N` represents a node in the binary search tree. For each node `N`, the query will evaluate what type of node it is (Root, Inner, or Leaf).

### Step 2: `CASE` Statement

The `CASE` statement evaluates the type of the node (`N`) based on its relationship to the parent node (`P`).

#### 1. **When `P IS NULL THEN 'Root'`:**

- **`WHEN P IS NULL THEN 'Root'`**:
  - If the parent node (`P`) is `NULL`, then the node (`N`) is classified as a **Root**.
  - In a binary search tree, the root node is the top-most node and doesn't have a parent, hence `P` is `NULL`.

#### 2. **When `P IS NOT NULL` and `N` is a Parent:**

- **`WHEN (P IS NOT NULL) AND N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'`**:
  - This condition is used to identify **Inner** nodes.
  - It checks two things:
    1. **`P IS NOT NULL`**: The node (`N`) has a parent, so it's not the root.
    2. **`N IN (SELECT DISTINCT P FROM BST)`**: This subquery checks if the node `N` appears as a parent node (`P`) for other nodes in the `BST`. If `N` is a parent node for any other nodes, it is classified as an **Inner** node.
      - The **`SELECT DISTINCT P FROM BST`** part retrieves all unique parent nodes from the `BST` table. If `N` is found in this list, it means that `N` has children, and thus it's an inner node.

#### 3. **Else `Leaf`:**

- **`ELSE 'Leaf'`**:
  - If neither of the above conditions are true, the node is classified as a **Leaf**.
  - A **Leaf** node is a node that has a parent (`P IS NOT NULL`), but it does not have any children. In other words, it is not a parent for any other node.
  
  **Summary of the `CASE` Statement**:
  - **Root**: Node `N` has no parent (`P IS NULL`).
  - **Inner**: Node `N` has a parent (`P IS NOT NULL`) and also has children (i.e., appears as a parent node for some other nodes).
  - **Leaf**: Node `N` has a parent but does not appear as a parent for any other nodes.

### Step 3: `FROM BST`

- **`FROM BST`**: This specifies the table `BST` as the data source. The query applies the logic above to each row in this table, where each row represents a node (`N`) and its parent (`P`).

### Step 4: `ORDER BY N`

- **`ORDER BY N`**: Finally, the query orders the results by the node `N`. This ensures that the output is displayed in ascending order of the node values.

---

### Example

Consider the following table `BST`:

| N   | P   |
|-----|-----|
| 1   | NULL|
| 2   | 1   |
| 3   | 1   |
| 4   | 2   |
| 5   | 2   |
| 6   | 3   |

This table represents a binary search tree where:
- `1` is the root (no parent, so `P` is `NULL`).
- `2` and `3` are children of `1`.
- `4` and `5` are children of `2`.
- `6` is a child of `3`.

Let’s apply the query logic to this table:

1. **Node 1**:
   - `P` is `NULL`, so **Node 1** is classified as **Root**.

2. **Node 2**:
   - `P` is not `NULL` (Parent is `1`).
   - `N (2)` appears in the list of distinct parents (`P`) because `2` is a parent of `4` and `5`.
   - Therefore, **Node 2** is classified as **Inner**.

3. **Node 3**:
   - `P` is not `NULL` (Parent is `1`).
   - `N (3)` appears in the list of distinct parents (`P`) because `3` is a parent of `6`.
   - Therefore, **Node 3** is classified as **Inner**.

4. **Node 4**:
   - `P` is not `NULL` (Parent is `2`).
   - `N (4)` does **not** appear in the list of distinct parents (`P`), meaning it has no children.
   - Therefore, **Node 4** is classified as **Leaf**.

5. **Node 5**:
   - `P` is not `NULL` (Parent is `2`).
   - `N (5)` does **not** appear in the list of distinct parents (`P`), meaning it has no children.
   - Therefore, **Node 5** is classified as **Leaf**.

6. **Node 6**:
   - `P` is not `NULL` (Parent is `3`).
   - `N (6)` does **not** appear in the list of distinct parents (`P`), meaning it has no children.
   - Therefore, **Node 6** is classified as **Leaf**.

### Final Output

| N   | Classification |
|-----|----------------|
| 1   | Root           |
| 2   | Inner          |
| 3   | Inner          |
| 4   | Leaf           |
| 5   | Leaf           |
| 6   | Leaf           |

- **Root**: Node 1 (no parent).
- **Inner**: Nodes 2 and 3 (they are parents to other nodes).
- **Leaf**: Nodes 4, 5, and 6 (they have no children).

