# Case_Study_Advanced_SQL_Queries
SQL exercises and projects from Dibimbing Data Engineering Bootcamp

by : Aysha Alia Iskandar

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

#### SCREENSHOT JAWABAN
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/de01b20f-b094-42ba-997c-163c2104626b" />
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/c34b8022-94f7-48a5-bfe9-fcd9421689a7" />



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

#### SCREENSHOT JAWABAN
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/9ca471e9-4162-4f42-870a-4a45063cec0f" />
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/dd0bfe8d-b9e6-445d-9e2f-b073bad657ea" />


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

#### SCREENSHOT JAWABAN
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/18f81f04-5474-4e7e-b492-228569740a15" />
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/9849cd5c-814f-4657-8bbd-edfb2b77d608" />


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

#### SCREENSHOT JAWABAN
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/2b13d8f8-eca3-4d9c-a8a4-f947af052925" />
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/e13c5c2f-962c-4bfd-b446-c91c119a8bb1" />


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

#### SCREENSHOT JAWABAN
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/1551c5e2-cb20-4197-8fa0-716032bd792a" />
<img width="1240" height="580" alt="image" src="https://github.com/user-attachments/assets/ca1c2a3e-d715-44ef-9501-026b65c1b144" />
