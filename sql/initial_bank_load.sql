load data local infile './data/account.csv'
into table bank.account
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
(acnumber, custid, first_name, last_name, branch_city, account_status, account_type, @account_activation_date, account_balance, phone, kyc_status, tri_monthly_avg_balance
)
set account_activation_date = str_to_date(@account_activation_date, '%d-%m-%Y');

load data local infile './data/cibil.csv'
into table bank.cibil
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

load data local infile './data/loan.csv'
into table bank.loan
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
(loan_id,borrower_id,first_name,last_name,@dob,phone,email,pan_id,loan_type,loan_term_month,loan_amount,@start_date,@end_date,total_repayments,completed_repayments,timely_repayments,loan_status,interest_rate)
set dob = str_to_date(@dob, '%d-%m-%Y'),
    start_date = str_to_date(@start_date, '%d-%m-%Y'),
    end_date = str_to_date(@end_date, '%d-%m-%Y');