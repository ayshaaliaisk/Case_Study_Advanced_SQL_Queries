-- link soal : https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

SELECT
    h.hacker_id,
    h.name
From Submissions s
JOIN Hackers h 
    ON h.hacker_id = s.hacker_id
JOIN Challenges ch 
    ON ch.challenge_id = s.challenge_id
JOIN Difficulty d 
    ON d.difficulty_level = ch.difficulty_level
WHERE 
    s.score = d.score
GROUP BY
    h.hacker_id, h.name
HAVING 
    count(distinct s.challenge_id) > 1
ORDER BY 
    count(distinct s.challenge_id) desc,
    h.hacker_id;
