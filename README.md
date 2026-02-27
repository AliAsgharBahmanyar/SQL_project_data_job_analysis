# 📊 SQL Data Job Market Analysis  

A SQL-based exploratory data analysis project focused on identifying the most in-demand and highest-paying skills for **Data Analyst roles**.

This project analyzes job postings data to uncover:

- 🔥 Most in-demand skills  
- 💰 Highest-paying skills  
- 📈 Skills that balance both demand and salary  

---

# 📌 Introduction  

The goal of this project is to use SQL to analyze real-world job postings data and extract meaningful insights about the Data Analyst job market.

By combining job postings, salary data, and required skills, this analysis identifies which technical skills provide the highest market value.

---

# 📚 Background  

With the growing demand for data professionals, understanding which skills are:

- Frequently required  
- Financially rewarding  
- Both high-demand and high-paying  

can help guide learning paths and career decisions.

The dataset includes:

- Job postings  
- Salary information  
- Skill requirements  
- Company information  

All analysis was performed using SQL.

---

# 🛠 Tools I Used  

- **PostgreSQL** – Database management system  
- **SQL** – Data querying and analysis  
- **VS Code** – Query writing and development  
- **Git & GitHub** – Version control and project hosting  

---

# 🗂 Database Structure  

The project uses the following main tables:

### `job_postings_fact`
Contains job-level data:
- `job_id`
- `job_title_short`
- `job_location`
- `job_schedule_type`
- `job_work_from_home`
- `job_posted_date`
- `salary_year_avg`
- `salary_hour_avg`
- `job_no_degree_mention`
- `company_id`

---

### `skills_dim`
Contains skill metadata:
- `skill_id`
- `skills`
- `type`

---

### `skills_job_dim`
Bridge table connecting:
- `job_id`
- `skill_id`

This table represents a many-to-many relationship between jobs and skills.

---

### `company_dim`
Contains company-level information:
- `company_id`
- `name`
- `link`
- `link_google`
- `thumbnail`

This table allows job postings to be linked to company details such as company name and related URLs.
---

# 🔎 The Analysis  

## 1️⃣ Most In-Demand Skills  

Counted how often each skill appears in Data Analyst job postings.

**Insight:**  
Skills like SQL, Python, Excel, and Tableau appear most frequently in postings.

---

## 2️⃣ Highest-Paying Skills  

Calculated the average salary for each skill required in Data Analyst roles.

**Insight:**  
Certain specialized or advanced tools tend to correlate with higher average salaries.

---

## 3️⃣ Skill Value Score (Demand × Salary) ⭐  

Created a custom metric:

```
Total Value = Skill Demand × Average Salary
```

This helps identify skills that are:

- Frequently requested  
- Financially rewarding  
- Strong overall investments to learn  

**Insight:**  
Some skills may not be the absolute highest paying, but due to strong demand, they provide excellent overall value.

---

# 📊 Key Findings  

- SQL remains foundational for Data Analyst roles.  
- Some technical tools significantly increase salary potential.  
- The best skills to learn balance both frequency and compensation.  
- Some Data Analyst roles do not explicitly require a degree.  

---

# 🎯 What I Learned  

- Writing modular SQL queries using CTEs  
- Designing analytical queries for real-world business questions  
- Combining multiple metrics into a single scoring system  
- Working with many-to-many relationships  
- Handling ambiguous column errors in joins  
- Structuring a portfolio-ready SQL project  

---

# 🚀 Future Improvements  

- Add data visualization (Python / Power BI / Tableau)  
- Build an interactive dashboard  
- Analyze trends by location  
- Compare remote vs on-site salary differences  
- Add time-series analysis for job trends  

---

# 📎 Project Repository  

GitHub:  
https://github.com/AliAsgharBahmanyar/SQL_project_data_job_analysis

---

# 💡 Final Thoughts  

This project demonstrates practical SQL skills applied to a real-world dataset.  
It reflects analytical thinking and business-oriented problem solving for Data Analyst roles.
