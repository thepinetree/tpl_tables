import pandas as pd
import sys

#### Generate CSV file ####
def gen_csv(table_name):
    print("Cleaning up csv file")
    tbl_file = table_name + ".tbl"
    data_file = table_name + ".data"
    df = pd.read_csv(tbl_file, sep='|', header=None, index_col=False)
    df.to_csv(data_file, index=False)
    print("Cleaned up csv file")

def run(argv):
    gen_csv(argv[1])

run(sys.argv)
