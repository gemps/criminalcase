-- SQL Criminal Case (GEMPAR)--

--Objective 1--
-- 1a : Tahun 2018--
SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM Crime2018
GROUP BY 1
ORDER BY Total_Kriminal DESC
LIMIT 1

-- 1b : Tahun 2019 --
SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM Crime2019
GROUP BY 1
ORDER BY Total_Kriminal DESC
LIMIT 1

-- 1c : Tahun 2020 --
SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM Crime2020
GROUP BY 1
ORDER BY Total_Kriminal DESC
LIMIT 1

-- 1d : Tahun 18-20 --
WITH CrimeAll as
(
SELECT *
FROM Crime2018
UNION ALL
SELECT *
FROM Crime2019
UNION ALL
SELECT *
FROM Crime2020
)

SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM CrimeAll
GROUP BY 1
ORDER BY Total_Kriminal DESC
LIMIT 1


-- Objective 2 --
WITH Crime1920 as
(
SELECT OFFENSE_CODE, YEAR, INCIDENT_NUMBER, count(INCIDENT_NUMBER) as TOTAL_CRIME
FROM Crime2019
GROUP BY 1,2
UNION ALL
SELECT OFFENSE_CODE, YEAR, INCIDENT_NUMBER, count(INCIDENT_NUMBER) as TOTAL_CRIME
FROM Crime2020
GROUP BY 1,2
)

SELECT YEAR, OFFENSE_CODE--, count(OFFENSE_CODE) as case2020
FROM Crime1920
ORDER BY 2 DESC

-- Objective 3 --
WITH CrimeAll as
(
SELECT *
FROM Crime2018
UNION ALL
SELECT *
FROM Crime2019
UNION ALL
SELECT *
FROM Crime2020
)
select OFFENSE_CODE, count(INCIDENT_NUMBER) as Total_Kriminal
from CrimeAll
WHERE strftime('%W', OCCURRED_ON_DATE) >= '40' AND strftime('%W', OCCURRED_ON_DATE) <= '45'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2

-- Objective 4 --
WITH CrimeAll as
(
SELECT *
FROM Crime2018
UNION ALL
SELECT *
FROM Crime2019
UNION ALL
SELECT *
FROM Crime2020
)
SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM CrimeAll
WHERE DAY_OF_WEEK like '%Satur%' OR DAY_OF_WEEK like '%Sun%'
GROUP BY 1
ORDER BY 2
LIMIT 1

-- Objective 5 --
WITH CrimeAll as
(
SELECT *
FROM Crime2018
UNION ALL
SELECT *
FROM Crime2019
UNION ALL
SELECT *
FROM Crime2020
)

SELECT DISTRICT, count(INCIDENT_NUMBER) as Total_Kriminal
FROM CrimeAll
WHERE DAY_OF_WEEK IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1