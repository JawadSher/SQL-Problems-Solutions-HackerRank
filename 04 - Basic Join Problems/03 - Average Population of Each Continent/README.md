<h1 align='center'>Average - Population - of Each - Continent</h1>

## Problem Statement

**Problem URL :** [Average Population of Each Continent](https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true)

![image](https://github.com/user-attachments/assets/124ca53c-7567-4e62-b0e5-75ccf02a49d9)
![image](https://github.com/user-attachments/assets/078f9ad3-59f1-4d4a-8ebe-31a28117f337)
![image](https://github.com/user-attachments/assets/f05e202a-5790-4f97-92d0-3f4735a8f367)

## Problem Solution
```sql
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) FROM CITY INNER JOIN COUNTRY ON
CITY.CountryCode = COUNTRY.Code GROUP BY Continent;
```

## Problem Solution Explanation
Let's break down this SQL query step by step:

#### 1. **`SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))`**:
   - **`SELECT`**: This keyword is used to retrieve specific data from a table.
   - **`COUNTRY.Continent`**: This tells the database to retrieve the **continent** from the `COUNTRY` table.
   - **`AVG(CITY.Population)`**: The `AVG` function calculates the **average population** of cities for each continent. This is done using the `Population` column from the `CITY` table.
   - **`FLOOR(AVG(CITY.Population))`**: The `FLOOR` function rounds down the average population to the nearest whole number. So, it takes the average city population and removes any decimal points.

   #### What this line does:
   - It selects the **continent** and the **rounded average population** of cities for each continent.

#### 2. **`FROM CITY`**:
   - This specifies that the query is retrieving data from the **`CITY`** table, which contains city-related information (e.g., population, city name).

#### 3. **`INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code`**:
   - **`INNER JOIN`**: This joins the `CITY` table with the `COUNTRY` table.
   - **`ON CITY.CountryCode = COUNTRY.Code`**: This defines the condition for the join. It says that the `CountryCode` column in the `CITY` table must match the `Code` column in the `COUNTRY` table.
   - This join connects each city to the country it belongs to, allowing us to link the cities to their continents (since the continent information is in the `COUNTRY` table).

#### 4. **`GROUP BY Continent`**:
   - **`GROUP BY`**: This clause groups the results by a specific column, in this case, by `Continent`.
   - The grouping is done to calculate the average population **for each continent separately**.
   
   #### What this line does:
   - It ensures that the average population is calculated **per continent** rather than for all cities together.

---

### Final Summary:
This query calculates the **average population of cities** for **each continent** and **rounds** the average down to the nearest whole number. Here's how it works:
1. It joins the `CITY` and `COUNTRY` tables to match each city with its country.
2. It groups the cities by continent.
3. It calculates the average population of cities in each continent and rounds that number down.

This will return a list of continents and their respective average city populations.
