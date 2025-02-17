import pandas as pd
import numpy as np
import os

os.chdir("Functional-Genomics/assignment1")
data = pd.read_csv("table.tsv", sep="\t")
columns_of_interest = ["Gene", "Cytoband", "Log2 Ratio", "p-Value"]
data = data[columns_of_interest]
selected_data_high = data[data["Log2 Ratio"] > 0].nsmallest(10, "p-Value")
selected_data_low = data[data["Log2 Ratio"] < 0].nsmallest(10, "p-Value")
selected_data_high.to_csv("negative_high.csv", index=False, columns=columns_of_interest)
selected_data_low.to_csv("negative_low.csv", index=False, columns=columns_of_interest)
