import os
import re
import pandas as pd
import matplotlib.pyplot as plt

INPUT_FILE = "job_postings_sample.csv"
OUTPUT_DIR = "outputs"
os.makedirs(OUTPUT_DIR, exist_ok=True)

df = pd.read_csv(INPUT_FILE)

for col in ["job_title", "skills", "location", "role_category", "experience_level"]:
    df[col] = df[col].fillna("").astype(str).str.strip()

skill_map = {
    "powerbi": "Power BI", "tableau": "Tableau", "python": "Python",
    "sql": "SQL", "excel": "Excel", "statistics": "Statistics",
    "machinelearning": "Machine Learning", "jira": "Jira"
}

def clean_skill(skill):
    skill = re.sub(r"\s+", " ", skill.strip())
    return skill_map.get(skill.lower().replace(" ", ""), skill.title())

skills_df = df.assign(skill=df["skills"].str.split(",")).explode("skill")
skills_df["skill"] = skills_df["skill"].map(clean_skill)
skills_df = skills_df[skills_df["skill"] != ""]

top_skills = skills_df["skill"].value_counts().rename_axis("skill").reset_index(name="job_count")
top_skills.to_csv(os.path.join(OUTPUT_DIR, "top_skills.csv"), index=False)

skills_by_city = pd.crosstab(skills_df["location"], skills_df["skill"])
skills_by_city.to_csv(os.path.join(OUTPUT_DIR, "skills_by_city.csv"))

skill_role_matrix = pd.crosstab(skills_df["role_category"], skills_df["skill"])
skill_role_matrix.to_csv(os.path.join(OUTPUT_DIR, "skill_role_matrix.csv"))

plot_data = top_skills.head(10).sort_values("job_count")
plt.figure(figsize=(9,5))
plt.barh(plot_data["skill"], plot_data["job_count"])
plt.xlabel("Number of Job Postings")
plt.ylabel("Skill")
plt.title("Top Skills in Sample Job Postings")
plt.tight_layout()
plt.savefig(os.path.join(OUTPUT_DIR, "top_skills.png"), dpi=200)
plt.close()

city_counts = df["location"].value_counts().sort_values()
plt.figure(figsize=(8,5))
plt.barh(city_counts.index, city_counts.values)
plt.xlabel("Number of Job Postings")
plt.ylabel("City")
plt.title("Job Postings by City")
plt.tight_layout()
plt.savefig(os.path.join(OUTPUT_DIR, "top_cities.png"), dpi=200)
plt.close()

plt.figure(figsize=(10,5))
plt.imshow(skill_role_matrix, aspect="auto")
plt.xticks(range(len(skill_role_matrix.columns)), skill_role_matrix.columns, rotation=45, ha="right")
plt.yticks(range(len(skill_role_matrix.index)), skill_role_matrix.index)
plt.xlabel("Skill")
plt.ylabel("Role Category")
plt.title("Skill vs Role Matrix")
plt.colorbar(label="Job Posting Count")
plt.tight_layout()
plt.savefig(os.path.join(OUTPUT_DIR, "skill_role_heatmap.png"), dpi=200)
plt.close()

print("Analysis completed successfully.")
print(top_skills.head(10).to_string(index=False))
