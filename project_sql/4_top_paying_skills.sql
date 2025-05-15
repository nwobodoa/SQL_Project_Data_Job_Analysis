/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
 helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    round(avg(salary_year_avg),2) as avg_salary
FROM job_postings_fact j
join skills_job_dim sj ON sj.job_id = j.job_id
join skills_dim s ON s.skill_id = sj.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY avg_salary DESC
limit 25