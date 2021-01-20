# Create tables
cd tpch-dbgen
make clean
make
./dbgen -f -s $1
mv *.tbl ../tpch_tables
cd ../tpch_tables

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

python gen_tbl.py part
python gen_tbl.py supplier
python gen_tbl.py partsupp
python gen_tbl.py customer
python gen_tbl.py orders
python gen_tbl.py lineitem
python gen_tbl.py nation
python gen_tbl.py region

rm *.tbl

echo "Formatted"
