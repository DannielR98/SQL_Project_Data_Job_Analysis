SELECT
    job_title_short as job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date,
    EXTRACT(MONTH from job_posted_date) as date_month
FROM
    job_postings_fact
LIMIT 5;

SELECT
    COUNT(job_id) as job_count,
    EXTRACT(MONTH from job_posted_date) AS MONTH
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY
    MONTH
ORDER BY
    job_count DESC;





