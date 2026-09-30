# LinkedIn Job Trend Analysis

## Project Overview
This project analyzes job-posting data to identify recurring skills, roles, cities, and experience levels in data-related job opportunities.

The project follows the internship brief for **LinkedIn Job Trend Analysis (Web Scraping)**, which specifies collecting job titles, skills and locations, cleaning skill tags, generating top-skill-by-city visuals, and creating a skill-vs-role matrix. fileciteturn0file0L188-L198

**Data note:** The included CSV is a small practice dataset created to demonstrate the workflow. It is not presented as live LinkedIn data. For real data, use only permitted/authorized collection methods and respect LinkedIn's terms and applicable laws.

## Objectives
- Analyze data-related job roles.
- Identify frequently requested skills.
- Compare skills across cities.
- Build a skill-vs-role matrix.
- Produce clear visuals and practical learning recommendations.

## Tools Used
- Python
- Pandas
- Matplotlib
- CSV/Excel-compatible data
- BeautifulSoup (optional for permitted HTML data)

## Workflow
1. Import job-posting data.
2. Clean and standardize text fields.
3. Split multi-skill fields into individual skills.
4. Calculate skill frequency.
5. Compare skills by city.
6. Build the skill-vs-role matrix.
7. Generate visualizations.
8. Interpret findings.

## Sample-Dataset Findings
- SQL and Python occur frequently in the sample.
- Excel and Power BI appear repeatedly in analyst-oriented roles.
- Tableau also appears in analyst examples.
- Machine Learning and Statistics are more concentrated in the Data Scientist examples.
- Bengaluru, Hyderabad, Pune, Mumbai and Chennai are represented.

These observations describe only the included practice dataset, not the entire current job market.

## Career Recommendations
The project highlights a practical learning stack for entry-level data analytics:
- SQL
- Python/Pandas
- Excel
- Power BI or Tableau
- Statistics

## Deliverables
- `job_postings_sample.csv` — practice dataset
- `job_trend_analysis.py` — analysis script
- `requirements.txt` — packages
- `project_report.md` — short report
- `outputs/` — generated CSVs and charts

## Run
```bash
pip install -r requirements.txt
python job_trend_analysis.py
```

## Interview Explanation
**Problem:** Job descriptions contain many different skills, making it difficult to identify recurring requirements.

**Approach:** I cleaned the job-posting data using Pandas, separated individual skills, counted their frequency, grouped them by city and role, and visualized the results.

**Outcome:** The analysis gives a structured view of recurring skills and role patterns and can be extended with a larger authorized dataset.

## Future Scope
- Add more job postings.
- Add posting date, salary, company and work-mode fields where permitted.
- Analyze trends over time.
- Build an interactive Power BI dashboard.
- Compare entry-level and experienced roles separately.
