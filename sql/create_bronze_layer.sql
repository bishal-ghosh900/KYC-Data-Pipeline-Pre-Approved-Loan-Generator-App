CREATE DATABASE IF NOT EXISTS bank_bronze;

CREATE TABLE IF NOT EXISTS bank_bronze.ekyc (
  custid TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  city TEXT,
  pan_id TEXT,
  dob TEXT,
  aadhaar_id TEXT,
  occupation TEXT,
  email TEXT,
  voter_id TEXT,
  passport_id TEXT,
  driving_licence_id TEXT,
  nrega_id TEXT,
  date TEXT,
  device_type TEXT,
  browser TEXT
);

CREATE TABLE IF NOT EXISTS bank_bronze.digitally_filled_kyc (
  custid TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  city TEXT,
  pan_id TEXT,
  dob TEXT,
  aadhaar_id TEXT,
  occupation TEXT,
  email TEXT,
  voter_id TEXT,
  passport_id TEXT,
  driving_licence_id TEXT,
  nrega_id TEXT,
  date TEXT,
  employee_id TEXT,
  employee_first_name TEXT,
  employee_last_name TEXT
);

CREATE TABLE IF NOT EXISTS bank_bronze.agent_validated_kyc (
  custid TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  city TEXT,
  pan_id TEXT,
  dob TEXT,
  aadhaar_id TEXT,
  occupation TEXT,
  email TEXT,
  voter_id TEXT,
  passport_id TEXT,
  driving_licence_id TEXT,
  nrega_id TEXT,
  date TEXT,
  agent_id TEXT,
  agent_first_name TEXT,
  agent_last_name TEXT
);


CREATE TABLE IF NOT EXISTS bank_bronze.form_filled_kyc (
  custid TEXT,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  city TEXT,
  pan_id TEXT,
  dob TEXT,
  aadhaar_id TEXT,
  occupation TEXT,
  email TEXT,
  voter_id TEXT,
  passport_id TEXT,
  driving_licence_id TEXT,
  nrega_id TEXT,
  date TEXT
);

