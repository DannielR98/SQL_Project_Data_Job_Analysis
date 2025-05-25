import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv('5_optimal_skills.csv')


# Create a bubble chart plotting demand_count vs. average_salary
plt.figure()
sizes = (df['demand_count'] / df['demand_count'].max()) * 1000  # scale bubble sizes

plt.scatter(df['demand_count'], df['average_salary'], s=sizes)
for _, row in df.iterrows():
    plt.text(row['demand_count'], row['average_salary'], row['skills'], fontsize=8, ha='center', va='center')

plt.title('Skill Demand vs. Average Salary')
plt.xlabel('Demand Count')
plt.ylabel('Average Salary (USD)')
plt.tight_layout()
plt.show()
