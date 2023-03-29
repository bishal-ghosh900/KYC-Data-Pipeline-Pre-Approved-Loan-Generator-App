INSERT INTO bank_gold.loan_calculator (
    pan_id,
    first_name,
    last_name,
    phone,
    account_balance,
    tri_monthly_avg_balance,
    cibil_score,
    active_accounts,
    total_loan_repayments,
    timely_loan_repayments,
    loan_factor,
    active_credit_cards,
    total_credit_card_repayments,
    timely_credit_card_repayments,
    credit_card_factor,
    total_repayments,
    completed_repayments,
    timely_payment,
    loan_status,
    internal_loan_factor
    
)
SELECT 
    c.pan_id, 
    a.first_name, 
    a.last_name, 
    a.phone, 
    a.account_balance, 
    a.tri_monthly_avg_balance, 
    c.cibil_score, 
    c.active_accounts, 
    c.total_loan_repayments, 
    c.timely_loan_repayments, 
    (c.timely_loan_repayments / c.total_loan_repayments) AS loan_factor, 
    c.active_credit_cards, 
    c.total_credit_card_repayments, 
    c.timely_credit_card_repayments, 
    (c.timely_credit_card_repayments / c.total_credit_card_repayments) AS credit_card_factor, 
    l.total_repayments, 
    l.completed_repayments, 
    l.timely_repayments, 
    l.loan_status,
    CASE 
    WHEN l.timely_repayments IS NULL OR l.completed_repayments IS NULL
    THEN 1
    else (l.timely_repayments / l.completed_repayments)
    END AS internal_loan_factor 
FROM bank.account a left join bank.cibil c ON a.phone = c.phone 
LEFT JOIN bank.loan l ON c.pan_id = l.pan_id