/*
question 1: What are the top 100 highest paying job titles for Data Analysts?
- focus on job titles that specifies salary information (e.g., salary_year_avg) and filter for Data Analyst roles.
*/




SELECT 
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    company_dim.name
FROM 
    job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    (job_title_short = 'Data Analyst') AND (salary_year_avg IS NOT NULL)
ORDER BY 
    salary_year_avg DESC
LIMIT 
    100