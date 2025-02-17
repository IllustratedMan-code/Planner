import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

plt.style.use("ggplot")

data = pd.read_csv("Functional-Genomics/final/Overall survival status.csv")

fig, ax = plt.subplots()

x = np.arange(len(data))

ax.bar(
    x,
    data["% Deceased"],
    tick_label=data[data.columns[0]],
)

ax.set_ylabel("Percent Deceased")
fig.savefig("Functional-Genomics/final/survivalstatus.svg")
