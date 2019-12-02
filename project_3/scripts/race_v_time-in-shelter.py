
"""
Modifed: 2019-12-01
Create a violin plot of Race v. time spent at UMD Shelter

"""

import pandas as pd
import matplotlib
matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
import matplotlib.pyplot as plt
import seaborn as sns

# Read in client_entry_exit_annotated.txt
df = pd.read_csv('./results/client_entry_exit_annotated.txt', sep = '\t')

fig, ax = plt.subplots(figsize = (10,5))

sns.violinplot(x = 'client_race', y = 'time_spent', data = df, ax = ax)

#Update x_tick label names
labels = [name.get_text() for name in ax.get_xticklabels()]
updated_labels = [name.rstrip(' (HUD)') for name in labels]
updated_labels
ax.set_xticklabels(updated_labels)
ax.set_xticklabels(ax.get_xticklabels(),rotation = 90)

# Set the axes labels
ax.set_ylabel('Time spent at UMD Shelter (Days)', fontweight = 'bold')
ax.set_xlabel('Race', fontweight = 'bold')

# Figure formatting
sns.despine()

labels = [name.get_text() for name in ax.get_xticklabels()]
updated_labels = [name.rstrip(' (HUD)') for name in labels]
updated_labels

plt.savefig('./results/race_v_time_spent.png', bbox_inches = "tight", transparent = True, dpi  = 300)
