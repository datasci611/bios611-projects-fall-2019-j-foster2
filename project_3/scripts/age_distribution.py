
# Gather UMD demographic data set - 
df_demo = pd.read_csv('https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv', sep = '\t')

#Clean up dataFrame
df_age = df_demo[['Client Age at Entry', 'Client Age at Exit']]
