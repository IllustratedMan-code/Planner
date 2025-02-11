
import pandas as pd

def read_excel_row(file_path, sheet_name, row_index):
    """
    Reads a specific row from an Excel file.

    """

    df = pd.read_excel(file_path, sheet_name=sheet_name)
    return df.iloc[row_index]

if __name__ == "__main__":
    #Reading in the data from iLINCS---------------
    file_path = "AllClusters-iLINCs.xlsx"
    sheet_name = "Sheet1"
    row_index = 41  # Read the 43rd row (index starts from 0)

    row_data = read_excel_row(file_path, sheet_name, row_index)
    result = [string[:15] for string in row_data]
    del result[:4]

    #reading in the possible data from cBioPortal-----
    df = pd.read_csv("All-cBioPortal.tsv", sep='\t', usecols=["Sample ID"])

    # Convert columns to NumPy arrays
    column1_array = df["Sample ID"].to_numpy()
    
    #Comparing the data to see which data we need--------
    exist_array = []
    DoNotExist_array = []
    
    for cell in result:
        exist = False
        for item in column1_array:
            if cell == item:
                exist = True
        if exist == True:
            exist_array.append(cell)
        else:
            DoNotExist_array.append(cell)
    
    #putting the results in a file-------------------------
    with open('outputAllCluster-iLINCs.txt', 'w') as f:
        for item in exist_array:
            f.write(f"{item}\n")
