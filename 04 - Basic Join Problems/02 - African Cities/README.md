<h1 align='center'>African - Cities</h1>

## Problem Statement

**Problem URL :** [African Cities](https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/01534156-dc6e-4907-a0c5-80dfdd3ea3fc)
![image](https://github.com/user-attachments/assets/a2bcb456-d8b7-4481-b61e-86b6c8279f62)
![image](https://github.com/user-attachments/assets/8f904bca-85d4-440c-bae5-fba4ffc57f70)

## Problem Solution
```sql
SELECT CITY.NAME FROM CITY INNER JOIN COUNTRY ON 
CITY.CountryCode = COUNTRY.Code WHERE CONTINENT = 'Africa';
```

## Problem Solution Explanation

1. **`SELECT CITY.NAME`**:
   - This tells the database to get the **name** of cities from the `CITY` table.
   - The `CITY.NAME` part means we're selecting the `NAME` column from the `CITY` table.

2. **`FROM CITY`**:
   - This specifies that the data is being retrieved from the **`CITY`** table, which contains information about different cities.

3. **`INNER JOIN COUNTRY`**:
   - This connects the `CITY` table to the **`COUNTRY`** table.
   - The `INNER JOIN` means it will only include cities that have matching countries in the `COUNTRY` table.

4. **`ON CITY.CountryCode = COUNTRY.Code`**:
   - This explains how the two tables are linked: 
     - The `CountryCode` in the `CITY` table must match the `Code` in the `COUNTRY` table.
     - This way, each city is matched to the country it belongs to.

5. **`WHERE CONTINENT = 'Africa'`**:
   - This filters the result so that only cities in **African countries** are included.
   - It checks that the `CONTINENT` column in the `COUNTRY` table is equal to `'Africa'`.

---

### Final Summary:
This query gives you the **names of cities** that are located in **countries on the continent of Africa**. It works by matching cities with their countries and then filtering to include only those in Africa.
