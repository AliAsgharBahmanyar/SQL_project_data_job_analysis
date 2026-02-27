/*Query 3: Top Skills for Data Analysts
- This query identifies the most in-demand skills for Data Analyst roles.
- shortr thatn the original query_3 file by directly joining the necessary tables without using a CTE, while still counting and ranking the skills by demand.
*/



SELECT 
    count(*) AS skill_count,
    skills_dim.skill_id,
    skills_dim.skills
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skill_id
ORDER BY
    skill_count DESC