# Case_Study_Advanced_SQL_Queries
SQL exercises and projects from Dibimbing Data Engineering Bootcamp

## Soal 1 : The Report 
a. Link soal: 
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=tru 

b. Tujuan belajar:  
Join berdasarkan rentang nilai, pemetaan grade, penggunaan CASE, dan pengurutan multi-kolom. 

c. Konsep kunci: 

i. Join Students dengan Grades memakai BETWEEN pada marks ke min_mark..max_mark. 

ii. CASE WHEN grade < 8 THEN NULL ELSE name END. 

iii. ORDERBY grade DESC, name ASC, marks ASC. 

d. Langkah disarankan: 

i. Buat CTE untuk memetakan tiap student ke grade (join rentang). 

ii. Di select final, gunakan CASE untuk menampilkan NULL pada name jika grade < 8. 

iii. Terapkan urutan seperti ketentuan. 

## Soal 2 : Weather Observation Station 18 
a. Link soal: 
https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true 

b. Tujuan belajar:  
Agregasi MIN/MAX, manipulasi numerik, format hasil. 

c. Konsep kunci: 

i. Ambil min(lat_n), min(long_w), max(lat_n), max(long_w). 

ii. Hitung 

1. ∣max(lat)−min(lat)∣+∣max(long)−min(long)∣ 

2. ∣max(lat)−min(lat)∣+∣max(long)−min(long)∣ 

iii. Casting presisi desimal 4 angka.

d. Langkah disarankan: 

i. Satu CTE untuk menghimpun empat nilai agregat. 

ii. Baris final menghitung jarak Manhattan dan CAST(... AS DECIMAL(10,4)).

## Soal 3 : Top Competitors 
a. Link soal: 
https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true 

b. Tujuan belajar:  
Join multi-tabel, agregasi per pengguna, dan filter dengan HAVING. 

c. Konsep kunci: 

i. Dapatkan max_score tiap challenge dari Challenges ↔ Difficulty. 

ii. Hitung jumlah submission yang mencapai max_score per hacker_id. 

iii. Ambil hanya yang jumlahnya > 1, lalu join ke Hackers untuk nama. 

iv. Urutkan count_max_score DESC, hacker_id ASC. 

d. Langkah disarankan: 

i. CTE-1: peta challenge_id → max_score. 

ii. CTE-2: hitung COUNT(*) dari Submissions yang score = max_score per hacker_id (pakai HAVING > 1). 

iii. CTE-3: join ke Hackers untuk ambil name. 

iv. Select final: hanya hacker_id, name lalu ORDER BY. 

## Soal 4 : Ollivander's Inventory 
a. Link soal: 
https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true 

b. Tujuan belajar:  
Window function untuk memilih baris biaya minimal per kelompok. 

c. Konsep kunci: 

i. Join Wands dengan Wands_Property untuk atribut age, power, dan is_evil. 

ii. Saring is_evil = 0. 

iii. Hitung MIN(coins_needed) OVER (PARTITION BY age, power) sebagai biaya minimal per kelompok. 

iv. Ambil hanya baris dengan coins_needed = coins_min. 

v. Urutkan power DESC, age DESC. 

d. Langkah disarankan: 

i. CTE: hasil join dan kolom coins_min via window MIN() OVER (PARTITION BY age, power). 

ii. Select final: filter coins_needed = coins_min dan urutkan sesuai ketentuan. 

## Soal 5 : Contest Leaderboard 
a. Link soal: 
https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true 

b. Tujuan belajar:  
Agregasi bertingkat (max per (hacker, challenge) kemudian sum per hacker), join ke master Hackers, filter skor nol. 

c. Konsep kunci: 

i. Agregasi 1: MAX(score) per hacker_id, challenge_id. 

ii. Join hasil agregasi ke Hackers untuk nama. 

iii. Agregasi 2: SUM(max_score_per_challenge) per hacker. 

iv. HAVING SUM(...) > 0. 

v. Urutkan SUM DESC, hacker_id ASC. 

d. Langkah disarankan: 

i. CTE-1: Submissions → MAX(score) per (hacker_id, challenge_id). 

ii. CTE-2: join ke Hackers untuk dapat name. 

iii. Select final: SUM(max_) AS score, GROUP BY hacker_id, name, HAVING > 0, lalu ORDER BY.
