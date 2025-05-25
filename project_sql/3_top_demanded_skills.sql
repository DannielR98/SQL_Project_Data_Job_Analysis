/*
Question: What are the most in-demand skills for data analysts for remote roles??
- Join Job postings to inner join table
- Identify the top 5 in demand skills for data analysts
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) as demand_count
FROM 
    job_postings_fact
JOIN 
    skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN 
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = true
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 15