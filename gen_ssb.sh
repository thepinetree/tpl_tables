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
python gen_tbl.py lineorder
python gen_tbl.py part
python gen_tbl.py supplier

rm *.tbl

echo "Formatted"
