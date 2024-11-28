import pandas as pd
import copy
import os
import subprocess

os.chdir("/home/nixos/Planner/Principles-Of-ClinicalTrials/studyVisits")
df = pd.read_excel("study-visits.xlsx")

df = df.iloc[4:]
df = df.set_index(df.columns[0])
df = df.drop(labels=df.columns[0], axis=1)
df = df.T
df.index = list(range(len(df)-2)) + ["Follow Up", "Early Termination"]

df = df.replace("X", True)
df = df == True

df = df.drop(labels=["Assessments"], axis=1)
categories = {"Administrative":[], "Safety":[], "Efficacy":[]}
current = "Null"
for i in df.columns:
    if i in categories:
        current = i
    else:
        categories[current] += [i]

df = df.drop(categories.keys(), axis=1)

def row_to_checklist_items(row):
    return [i * y for i,y in zip(row.tolist(),df.columns.tolist()) if i *y != ""]

checklist_items = df.apply(row_to_checklist_items, axis=1)

visits = ""
for visit, items in zip(range(len(checklist_items.index)), checklist_items.tolist()):
    categories_in_visit = copy.deepcopy(categories)
    markdown = f"# Visit: {checklist_items.index[visit]}\n- Week: {visit*4-4}\n- Day: {visit*28-28}\n\n"
    for category in categories_in_visit:
        categories_in_visit[category] = [i for i in categories[category] if i in items]
        if len(categories_in_visit[category]) > 0:
            markdown += f"\n## {category}\n\n"
            for item in categories_in_visit[category]:
                markdown += f"- [ ] {item}\n"
    visits += markdown + "\n\n\n\n"

with open("visits.md", "w") as f:
    f.write(visits)

subprocess.check_call(["pandoc", "visits.md", "-f", "markdown", "-t", "docx", "-s", "-o", "visits.docx"])


