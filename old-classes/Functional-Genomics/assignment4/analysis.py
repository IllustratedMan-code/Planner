import itertools
import pandas as pd
from scipy.optimize import linear_sum_assignment

class cluster_evaluator:
    def __init__(self, k, number_of_genes):
        self.er_basename = "er_status_euclidean"
        self.kmeans_basename = "kmeans_euclidean"
        self.k = str(k)
        self.number_of_genes = str(number_of_genes)
        self.er_status = self.get_list(self.make_filename(self.er_basename))
        self.kmeans = self.get_list(self.make_filename(self.kmeans_basename))
        self.total = len(self.kmeans)

    def get_list(self, filename):
        with open(filename) as f:
            return f.read().splitlines()

    def make_filename(self, basename):
        return "_".join([basename, self.k, self.number_of_genes]) + ".txt"

    def mate(self):
        return zip(self.er_status, self.kmeans)

    @property
    def count_matrix(self):
        matrix = {}
        for er, kmean in self.mate():
            if er not in matrix:
                matrix[er] = {}
            if kmean not in matrix[er]:
                matrix[er][kmean] = 0
            
            matrix[er][kmean] += 1
        return pd.DataFrame(matrix).fillna(0)
    
    @property
    def accuracy_matrix(self):
        return self.count_matrix/self.total

    @property   
    def accuracy(self):
        _, col_ind = linear_sum_assignment(-self.count_matrix)
        true_positives = 0
        for ri, ci in zip(range(len(self.count_matrix.index)), col_ind):
            true_positives += self.count_matrix.iloc[ri, ci]
        return true_positives/self.total

    @property
    def accuracy_majority(self):
        return sum(self.count_matrix.max(axis=1))/self.total

number_of_genes_map = {100: 99, 500: 439}

class csv_print:
    def __init__(self):
        with open("accuracy.csv", "w") as f:
            f.write("k,Number of genes,Accuracy\n")
    def print(self, k, number_of_genes):
        with open("accuracy.csv", "a") as f:
            f.write(f"{k},{number_of_genes_map[number_of_genes]},{str(cluster_evaluator(k, number_of_genes).accuracy_majority)}")
            f.write("\n")
printer = csv_print()
printer.print(2, 100)
printer.print(3, 100)
printer.print(2, 500)
printer.print(3, 500) 

cluster_evaluator(2, 100).count_matrix.to_csv("example_count_matrix.csv")