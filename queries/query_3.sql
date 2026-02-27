/*
- This query identifies the most in-demand skills for Data Analyst roles.
- It first collects all skill IDs linked to Data Analyst job postings,
- then counts how frequently each skill appears and ranks them by demand.
*/



WITH skill_id_list AS (
    SELECT 
        job_postings_fact.job_id,
        skill_id
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        job_title_short = 'Data Analyst'
)

SELECT 
    count(*) AS skill_count,
    skills_dim.skill_id,
    skills_dim.skills
FROM 
    skill_id_list
    INNER JOIN skills_dim ON skill_id_list.skill_id = skills_dim.skill_id
GROUP BY 
    skills_dim.skill_id
ORDER BY 
    skill_count DESC