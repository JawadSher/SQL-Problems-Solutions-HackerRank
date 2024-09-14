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
