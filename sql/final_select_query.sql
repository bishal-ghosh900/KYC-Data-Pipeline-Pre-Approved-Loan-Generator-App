SELECT lc.*, CASE 
        WHEN cibil_score BETWEEN 700 AND 850 AND active_accounts <= 10 AND (timely_loan_repayments / total_loan_repayments) >= 0.5 AND (timely_credit_card_repayments / total_credit_card_repayments) >= 0.5 AND (timely_payment / completed_repayments) >=0.5  AND loan_status NOT LIKE "Default"
		THEN 
			(CASE 
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*1.2*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1.2*1.2*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1.2*1.2*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)

				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*1.2*1*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1.2*1*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1.2*1*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)        


                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*0.8*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1.2*0.8*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1.2*0.8*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)


				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < 0.49*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*0.7*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1.2*0.7*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1.2*0.7*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)


				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1*1.2*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN  account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1*1.2*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1*1.2*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)

				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*1*1*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1*1*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10	
                THEN cibil_score*500*1*1*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)               


                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1*0.8*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1*0.8*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1*0.8*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)  


				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*1*0.7*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1*0.7*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1*0.7*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)


				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*1.2*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.8*1.2*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.8*1.2*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)

				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance) AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*0.8*1*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.8*1*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.8*1*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)             


                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*0.8*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.8*0.8*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.8*0.8*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)  


				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*0.7*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.8*0.7*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.8*0.7*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)


				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*1.2*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.7*1.2*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.7*1.2*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*0.7*1*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.7*1*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.7*1*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)               

                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*0.8*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.7*0.8*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
                
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.7*0.8*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)  

				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*0.7*1.1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.7*0.7*1*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
								
                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.7*0.7*0.8*(timely_loan_repayments / total_loan_repayments)*(timely_credit_card_repayments / total_credit_card_repayments)*(timely_payment / completed_repayments)
			
            END )
        ELSE 'NOT APPROVED'
    END AS approved_loan_value
FROM bank_gold.loan_calculator lc
WHERE first_name = 'Kylan' 
	AND pan_id = 'AAKHL3642U' 
	AND phone = '6275687735';
