INSERT INTO bank_silver.kyc (
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    date,
    device_type,
    browser
)
SELECT 
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    STR_TO_DATE(dob, '%d-%m-%Y') dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    STR_TO_DATE(date, '%d-%m-%Y') date,
    device_type,
    browser
FROM bank_bronze.ekyc;

INSERT INTO bank_silver.kyc (
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    date,
    employee_id,
    employee_first_name,
    employee_last_name
)
SELECT 
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    STR_TO_DATE(dob, '%d-%m-%Y') dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    STR_TO_DATE(date, '%d-%m-%Y') date,
    employee_id,
    employee_first_name,
    employee_last_name
FROM bank_bronze.digitally_filled_kyc;


INSERT INTO bank_silver.kyc (
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    date,
    agent_id,
    agent_first_name,
    agent_last_name
)
SELECT 
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    STR_TO_DATE(dob, '%d-%m-%Y') dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    STR_TO_DATE(date, '%d-%m-%Y') date,
    agent_id,
    agent_first_name,
    agent_last_name
FROM bank_bronze.agent_validated_kyc;

INSERT INTO bank_silver.kyc (
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    date
)
SELECT 
    custid,
    first_name,
    last_name,
    phone,
    city,
    pan_id,
    STR_TO_DATE(dob, '%d-%m-%Y') dob,
    aadhaar_id,
    occupation,
    email,
    voter_id,
    passport_id,
    driving_licence_id,
    nrega_id,
    STR_TO_DATE(date, '%d-%m-%Y') date
FROM bank_bronze.form_filled_kyc;