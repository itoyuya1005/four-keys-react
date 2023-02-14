SQLPATH="/databases"
mysql -h localhost -u root -proot < $SQLPATH/create_databases.sql
for file in $(find $SQLPATH/ -name "*.sql"); do FILENAME=$(basename $file .sql); mysql -h localhost -u root -proot $(echo $FILENAME) < $file; done
