/*
Question
What is the average salary associated with each skill for data analyst positions
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) as average_salary
FROM 
    job_postings_fact
JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    
    AND
    job_work_from_home = true
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 15


/*
Big-data & ML platforms lead: PySpark, Couchbase plus managed ML services like DataRobot and interactive tools like Jupyter dominate the top-tier salaries.

Python ecosystem stays core: General-purpose libraries—Pandas, NumPy—remain essential, even if their premium is slightly lower.

Dev-ops & deployment matter: GitLab and Kubernetes (and other CI/CD tools) are in high demand as teams “productionize” data workloads.

Cloud & data-engineering stacks: Managed Spark (Databricks), search engines (Elasticsearch), and other cloud-native data platforms earn strong pay.

[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  }
]
*/