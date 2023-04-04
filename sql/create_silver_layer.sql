CREATE DATABASE IF NOT EXISTS bank_silver;


CREATE TABLE IF NOT EXISTS bank_silver.kyc (
  custid VARCHAR(6),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone VARCHAR(10) NOT NULL,
  city TEXT NOT NULL,
  pan_id VARCHAR(10) DEFAULT NULL,
  dob DATE NOT NULL,
  aadhaar_id VARCHAR(12) DEFAULT NULL,
  occupation TEXT NOT NULL,
  email TEXT DEFAULT NULL CHECK (email LIKE '%@%'),
  voter_id VARCHAR(10) DEFAULT NULL,
  passport_id VARCHAR(8) DEFAULT NULL,
  driving_licence_id VARCHAR(13) DEFAULT NULL,
  nrega_id varchar(21) DEFAULT NULL,
  date DATETIME NOT NULL,
  agent_id VARCHAR(8) NOT NULL DEFAULT 'NA',
  agent_first_name VARCHAR(50) NOT NULL DEFAULT 'NA',
  agent_last_name VARCHAR(50) DEFAULT NULL DEFAULT 'NA',
  employee_id VARCHAR(6) NOT NULL DEFAULT 'NA',
  employee_first_name VARCHAR(50) NOT NULL DEFAULT 'NA',
  employee_last_name VARCHAR(50) DEFAULT NULL DEFAULT 'NA',
  device_type VARCHAR(20) NOT NULL DEFAULT 'NA',
  browser VARCHAR(20) NOT NULL DEFAULT 'NA',
  PRIMARY KEY (custid),
  CHECK (
    voter_id IS NOT NULL OR 
    passport_id IS NOT NULL OR 
    driving_licence_id IS NOT NULL OR
    nrega_id IS NOT NULL
  )
);
