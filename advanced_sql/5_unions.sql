SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/*
Find job postings from the first quearter that have a salary greater than 70k
- combine job postings tables from the first quearter of 2023 (jan-march)
- get job postings with an average salary >70k
*/



SELECT 
    Q1.job_title_short,
    Q1.salary_year_avg,
    job_via,
    job_location,
    EXTRACT(MONTH FROM Q1.job_posted_date) as month
FROM (
SELECT *
FROM january_jobs

UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT *
FROM march_jobs
) AS Q1
WHERE 
    Q1.salary_year_avg > 70000
    AND
    job_title_short = 'Data Analyst'
    AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC