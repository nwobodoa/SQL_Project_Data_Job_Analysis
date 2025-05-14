/*
 Question: what are the top-paying data analyst jobs?
 -identify the top 10 highest-paying data analyst roles that are available remotely.
 -Focuses on job postings with specified salaries(remove nulls).
 -Why? Highlight the top-paying opportunities for data analysts, 
 offering insights into employment trends and salary expectations.
 */
SELECT TOP 10 job_id,
    job_title,
    name as company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact j
    join company_dim c ON j.company_id = c.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    and job_location = 'Anywhere'
ORDER BY salary_year_avg DESC;