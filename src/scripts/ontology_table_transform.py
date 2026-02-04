import pandas as pd
import os
import sys

file_dir = 'ak-ontology/src/ontology/exports'
save_file_dir = "/ak_data/ak-data-load/ontology"

# filename to be that needs to be converted from tsv to csv
filename = f'{sys.argv[1]}'
table_name = sys.argv[2]
# filename for the csv file Which should be the Table name in the database
ontology_term_filename = f'{table_name}.csv'
term_parents_filename = f'{table_name}_parent.csv'
print("====================================================================================")
print(f'Now processing: {filename} for {table_name} and {table_name}_parent table.')
tsv_path = os.path.join(file_dir, filename)
df = pd.read_csv(tsv_path, sep = '\t', dtype=str)
#set column names based on the keys of the table
df.columns = ["term_id", "term_label", "parent_term_id"]
df["parent_term_id"] = df["parent_term_id"].fillna(df["term_id"])
# get only ontology terms and their label
ontology_term = df[["term_id", "term_label"]]
# put multiple parents into its own row
df["parent_term_id"] = df["parent_term_id"].str.split("|")
term_parents = df.explode("parent_term_id").reset_index(drop=True)
# get only ontology terms and their parent
term_parents = term_parents[["term_id", "parent_term_id"]]
term_parents.rename(columns={"term_id": f"{table_name}_term_id"}, inplace=True)
print(term_parents.head())
#save these csv file in ak directory
ontology_term.to_csv(f'{save_file_dir}/{ontology_term_filename}',index = False)
term_parents.to_csv(f'{save_file_dir}/{term_parents_filename}',index = False)

print(f"Done creating {ontology_term_filename} and {term_parents_filename} file.")
print("====================================================================================")


