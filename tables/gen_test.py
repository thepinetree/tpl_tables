import pandas as pd

def GenSeqCol(num_rows):
    return [i for i in range(num_rows)]

def GenSeqBoundedCol(num_rows, bound):
    return [i % bound for i in range(num_rows)]

def test1_data():
    num_rows = 10000
    data = {
        "colA": GenSeqCol(num_rows),
        "colB": GenSeqBoundedCol(num_rows, 10),
        "colC": GenSeqBoundedCol(num_rows, 50),
        "colD": GenSeqBoundedCol(num_rows, 100)
    }
    return pd.DataFrame(data)


def test2_data():
    num_rows = 1000
    data = {
        "colA": GenSeqCol(num_rows),
        "colB": GenSeqBoundedCol(num_rows, 10),
    }
    return pd.DataFrame(data)


def gen_file(name, df):
    df.to_csv(name + ".tbl", sep='|', index=False)

def run():
    gen_file("auto_test_1", test1_data())
    gen_file("auto_test_2", test2_data())

run()
