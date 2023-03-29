CREATE DATABASE IF NOT EXISTS bank_gold;

CREATE TABLE IF NOT EXISTS bank_gold.loan_calculator (
  pan_id varchar(10) NOT NULL,
  first_name text NOT NULL,
  last_name text NOT NULL,
  phone varchar(10) NOT NULL,
  account_balance int DEFAULT NULL,
  tri_monthly_avg_balance int DEFAULT NULL,
  cibil_score int NOT NULL,
  active_accounts int NOT NULL,
  total_loan_repayments int DEFAULT NULL,
  timely_loan_repayments int DEFAULT NULL,
  loan_factor double(3,2) DEFAULT '1.00',
  active_credit_cards int DEFAULT NULL,
  total_credit_card_repayments int DEFAULT NULL,
  timely_credit_card_repayments int DEFAULT NULL,
  credit_card_factor double(3,2) DEFAULT '1.00',
  total_repayments int DEFAULT '1',
  completed_repayments int DEFAULT '1',
  timely_payment int DEFAULT '1',
  loan_status text,
  internal_loan_factor double(3,2) DEFAULT '1.00',
  PRIMARY KEY (pan_id)
)