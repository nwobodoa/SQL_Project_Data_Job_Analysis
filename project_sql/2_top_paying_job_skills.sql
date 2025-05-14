/*
Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest-paying data analyst jobs from the first query.
-Add the specific skills required for these roles.
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries.
*/

with top_paying_jobs as(
SELECT j.job_id,
    job_title,
    name as company_name,
    salary_year_avg
FROM job_postings_fact j
    join company_dim c ON j.company_id = c.company_id
    
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    and job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
limit 10
)
SELECT top_paying_jobs.* ,
skills
FROM top_paying_jobs
join skills_job_dim sj ON sj.job_id = top_paying_jobs.job_id
join skills_dim s ON s.skill_id = sj.skill_id
ORDER BY salary_year_avg DESC;