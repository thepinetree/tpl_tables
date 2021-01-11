# Create tables
cd tpch-dbgen
make
./dbgen -f -s $1
mv *.tbl ../tables
cd ../tables

echo "Formatting..."
# Remove last | in each line
sed -i 's/[|]$//' part.tbl
sed -i 's/[|]$//' supplier.tbl
sed -i 's/[|]$//' partsupp.tbl
sed -i 's/[|]$//' customer.tbl
sed -i 's/[|]$//' orders.tbl
sed -i 's/[|]$//' lineitem.tbl
sed -i 's/[|]$//' nation.tbl
sed -i 's/[|]$//' region.tbl

python gen_tpch.py part
python gen_tpch.py supplier
python gen_tpch.py partsupp
python gen_tpch.py customer
python gen_tpch.py orders
python gen_tpch.py lineitem
python gen_tpch.py nation
python gen_tpch.py region

rm *.tbl

# Rename to .data
#mv part.tbl part.data
#mv supplier.tbl supplier.data
#mv customer.tbl customer.data
#mv partsupp.tbl partsupp.data
#mv orders.tbl orders.data
#mv lineitem.tbl lineitem.data
#mv nation.tbl nation.data
#mv region.tbl region.data

echo "Formatted"
