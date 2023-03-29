DROP DATABASE IF EXISTS bank;

CREATE DATABASE IF NOT EXISTS bank;


CREATE TABLE IF NOT EXISTS bank.account (
  acnumber VARCHAR(6),
  custid VARCHAR(6) NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  branch_city TEXT NOT NULL,
  account_status TEXT NOT NULL,
  account_type TEXT NOT NULL,
  account_activation_date DATE NOT NULL,
  account_balance FLOAT NOT NULL,
  phone VARCHAR(10) NOT NULL,
  kyc_status TEXT NOT NULL CHECK(lower(kyc_status) IN ('y', 'n')),
  tri_monthly_avg_balance FLOAT NOT NULL,
  PRIMARY KEY (acnumber)
);

CREATE TABLE IF NOT EXISTS bank.cibil (
  pan_id VARCHAR(11),
  phone VARCHAR(10),
  cibil_score INT CHECK (cibil_score BETWEEN 300 AND 900) NOT NULL,
  total_accounts INT NOT NULL,
  active_accounts INT NOT NULL,
  total_loan_repayments INT NOT NULL,
  timely_loan_repayments INT NOT NULL,
  active_credit_cards INT NOT NULL,
  total_credit_card_repayments INT NOT NULL,
  timely_credit_card_repayments INT NOT NULL,
  PRIMARY KEY (pan_id)
);


CREATE TABLE IF NOT EXISTS bank.loan (
  loan_id VARCHAR(6),
  borrower_id VARCHAR(6) NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  dob DATE NOT NULL,
  phone VARCHAR(10) NOT NULL,
  email TEXT CHECK (email LIKE '%@%') NOT NULL,
  pan_id VARCHAR(11) NOT NULL,
  loan_type TEXT NOT NULL,
  loan_term_month INT NOT NULL,
  loan_amount DECIMAL DEFAULT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_repayments INT NOT NULL,
  completed_repayments INT NOT NULL,
  timely_repayments INT NOT NULL,
  loan_status TEXT NOT NULL,
  interest_rate FLOAT NOT NULL,
  PRIMARY KEY (loan_id)
);

