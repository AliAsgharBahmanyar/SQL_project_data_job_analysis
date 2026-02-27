-- This query combines skill demand and average salary for Data Analyst roles.
-- It calculates a "total value" metric by multiplying how often a skill appears
-- by its average salary, helping identify the most valuable skills to learn.



WITH average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 0) AS "average_salary"
    FROM 
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills, skills_job_dim.skill_id
    ORDER BY 
        "average_salary" DESC
),


skills_demand AS (
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
)



SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    average_salary.average_salary,
    skills_demand.skill_count,
    average_salary.average_salary * skills_demand.skill_count AS total_value
FROM 
    skills_demand
    INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    total_value DESC
