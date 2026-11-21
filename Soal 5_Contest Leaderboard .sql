--link soal : https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

-- versi CTE
WITH max_score_per_challenge AS (
    Select
        hacker_id,
        challenge_id,
        max(s.score) AS score_maks
    From Submissions s
    GROUP BY hacker_id, challenge_id
),
score_hacker AS (
    Select
        h.hacker_id AS hacker_id,
        h.name AS name,
        ms.score_maks AS max_score
    From max_score_per_challenge ms
    join Hackers h 
        on h.hacker_id = ms.hacker_id 
)
select
    hacker_id,
    name,
    sum(max_score) AS total_score
From score_hacker
GROUP BY hacker_id, name
HAVING sum(max_score) > 0
ORDER BY  total_score desc, hacker_id ASC;

-- versi sub-query
SELECT
    h.hacker_id,
    h.name,
    SUM(m.score_maks) AS total_score
FROM (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS score_maks
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) m
JOIN Hackers h
    ON h.hacker_id = m.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(m.score_maks) > 0
ORDER BY total_score DESC, h.hacker_id ASC;
