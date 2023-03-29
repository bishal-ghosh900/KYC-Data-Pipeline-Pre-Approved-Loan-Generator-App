USE bank_bronze;

LOAD DATA INFILE {{ params.path }}
INTO TABLE {{ params.table }}
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
