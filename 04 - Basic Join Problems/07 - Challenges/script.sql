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
