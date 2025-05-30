/*
What are the most optimal skills to learn? (its in high demand and a high paying skill)

*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM 
        job_postings_fact
    JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_work_from_home = true
        AND salary_year_avg IS NOT NULL

    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) as average_salary
    FROM 
        job_postings_fact
    JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

    WHERE
        job_title_short = 'Data Analyst'
        AND 
        salary_year_avg IS NOT NULL
        AND
        job_work_from_home = true
    GROUP BY
        skills_job_dim.skill_id
)


SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 15






-- rewriting the same query more cincisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) as average_salary

FROM job_postings_fact
JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = true
    AND salary_year_avg IS NOT NULL

GROUP BY
    skills_dim.skill_id
HAVING  
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 15


