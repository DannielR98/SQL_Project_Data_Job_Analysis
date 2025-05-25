import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv('4_top_paying_skills.csv')


# Plot the top 15 skills by frequency
count_col = df.columns[1]  
plt.figure()
df.set_index(df.columns[0])[count_col].plot(kind='bar')
plt.title('Top 15 paying Skills')
plt.xlabel('Skill')
plt.ylabel('Salary')
plt.tight_layout()
plt.show()