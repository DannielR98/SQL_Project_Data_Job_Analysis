import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv('2_top_paying_roles.csv')

# Compute number of unique roles per skill
skill_counts = df.groupby('skills')['job_id'].nunique().sort_values(ascending=False)
total_roles = df['job_id'].nunique()

# Build a summary DataFrame
df_skills = skill_counts.reset_index()
df_skills.columns = ['Skill', 'Role Count']
df_skills['Percentage (%)'] = (df_skills['Role Count'] / total_roles * 100).round(1)


# Plot the top 10 skills by role count
top_skills = df_skills.head(10)
plt.figure()
top_skills.set_index('Skill')['Role Count'].plot(kind='bar')
plt.title('Top 10 Skills by Number of Roles')
plt.xlabel('Skill')
plt.ylabel('Number of Roles')
plt.tight_layout()
plt.show()