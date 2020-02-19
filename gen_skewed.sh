# Create tables
rm ./skewed_tables/*.tbl
cd SkewedDataGenerator
make
./dbgen -f -s $1
mv *.tbl ../skewed_tables
cd ../skewed_tables

# Rename
echo "Renaming..."
mv order.tbl orders.tbl

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
echo "Done format"

#echo "Writing first row"
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
mv part.data part.tbl
mv supplier.data supplier.tbl
mv customer.data customer.tbl
mv partsupp.data partsupp.tbl
mv orders.data orders.tbl
mv lineitem.data lineitem.tbl
mv nation.data nation.tbl
mv region.data region.tbl

echo "Formatted"
