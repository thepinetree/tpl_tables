# Create tables
cd ssb-dbgen
make clean
make
./dbgen -T a -s $1 -f
mv *.tbl ../ssb_tables
cd ../ssb_tables

echo "Formatting..."
# Remove last | in each line
sed -i 's/[|]$//' customer.tbl
sed -i 's/[|]$//' date.tbl
sed -i 's/[|]$//' lineorder.tbl
sed -i 's/[|]$//' part.tbl
sed -i 's/[|]$//' supplier.tbl

python gen_tbl.py customer
python gen_tbl.py date
sed -i 's/|/,/g' lineorder.tbl
sed -i '1s/^/0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16\n/' lineorder.tbl
mv lineorder.tbl lineorder.data
python gen_tbl.py part
python gen_tbl.py supplier

echo "Formatted"
