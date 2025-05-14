/*
Question: What are the most in-demand skills for data analysts?
- Join job posting to inner join table similar to query 2.
- Identify the top 5 in-demand skills for data analysts.
- Focus on all job postings, not just remote ones.
- Why? Retrieves the top s skills with thw highest demand in the job market.
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    count(j.job_id) as job_count
FROM job_postings_fact j
join skills_job_dim sj ON sj.job_id = j.job_id
join skills_dim s ON s.skill_id = sj.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY job_count DESC
limit 5;






















/*with remote_job_skills as (
    SELECT
        skill_id,
        count(*) as skill_count
    FROM skills_job_dim sj
    JOIN job_postings_fact j ON sj.job_id = j.job_id
    WHERE
        j.job_work_from_home = TRUE AND
        j.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)
SELECT
    s.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills rj INNER JOIN
    skills_dim s ON rj.skill_id = s.skill_id
ORDER BY skill_count DESC
LIMIT 5;
*/
