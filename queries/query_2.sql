/*
question 2: skills needed for top paying jobs for Data Analysts
- focus on the top 10 highest paying job titles for Data Analysts and identify the skills associated
*/



WITH top_paying_data_analysts AS (
    SELECT 
        job_postings_fact.job_id,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact
    WHERE 
        (job_title_short = 'Data Analyst') AND (salary_year_avg IS NOT NULL)
    ORDER BY 
        salary_year_avg DESC
    LIMIT 
        10
)


SELECT 
    top_paying_data_analysts.*,
    skills_dim.skills
FROM 
    top_paying_data_analysts
    INNER JOIN skills_job_dim ON top_paying_data_analysts.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id