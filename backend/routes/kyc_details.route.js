const router = require('express').Router();
const sql = require('../config/db')

router.get('/user_details', (_, response) => {

    sql.query('SELECT * FROM bank_gold.loan_calculator', (err, res) => {
        if (err) {
            console.log("error: ", err);
            response.send(err);
            return;
        }
    
        console.log("bank_kyc: ", res);
        response.send(res);
    });

});

router.get('/user_details/:firstName/:panId/:phone', (request, response) => {

    sql.query(`select first_name,cibil_score,account_balance,loan_factor,credit_card_factor,internal_loan_factor, loan_status,
   
	CASE 
        WHEN (cibil_score BETWEEN 700 AND 850) AND active_accounts <= 10 AND loan_factor >= 0.5 AND credit_card_factor >= 0.5 AND internal_loan_factor >=0.5  AND (loan_status IS NULL OR loan_status NOT LIKE "Default") 
		THEN 
			CASE 
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*1.2*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1.2*1.2*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1.2*1.2*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*1.2*1*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1.2*1*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1.2*1*0.8*loan_factor*credit_card_factor*internal_loan_factor        
                --

                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*0.8*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1.2*0.8*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1.2*0.8*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --

				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < 0.49*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1.2*0.7*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1.2*0.7*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance > AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1.2*0.7*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
                --
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1*1.2*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN  account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1*1.2*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1*1.2*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*1*1*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1*1*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10	
                THEN cibil_score*500*1*1*0.8*loan_factor*credit_card_factor*internal_loan_factor               
                --

                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*1*0.8*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*1*0.8*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*1*0.8*0.8*loan_factor*credit_card_factor*internal_loan_factor  
                --

				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*1*0.7*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*1*0.7*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance BETWEEN 0.75*(AVG(account_balance)) AND AVG(account_balance) OR NULL	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*1*0.7*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
                --
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*1.2*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.8*1.2*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.8*1.2*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance) AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*0.8*1*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.8*1*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.8*1*0.8*loan_factor*credit_card_factor*internal_loan_factor             
                --

                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*0.8*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.8*0.8*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.8*0.8*0.8*loan_factor*credit_card_factor*internal_loan_factor  
                --

				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*0.8*0.7*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.8*0.7*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance BETWEEN 0.5*(AVG(account_balance)) AND 0.74*AVG(account_balance)	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.8*0.7*0.8*loan_factor*credit_card_factor*internal_loan_factor
                --
                --
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*1.2*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.7*1.2*1*loan_factor*credit_card_factor*internal_loan_factor
				
                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance > AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.7*1.2*0.8*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts <= 2 
				THEN cibil_score*500*0.7*1*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.7*1*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance  BETWEEN 0.75*AVG(tri_monthly_avg_balance) AND AVG(tri_monthly_avg_balance) OR  NULL AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.7*1*0.8*loan_factor*credit_card_factor*internal_loan_factor               

                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*0.8*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 3 AND 5
				THEN cibil_score*500*0.7*0.8*1*loan_factor*credit_card_factor*internal_loan_factor
                
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance BETWEEN 0.5*AVG(tri_monthly_avg_balance) AND 0.74*AVG(tri_monthly_avg_balance) AND active_accounts BETWEEN 6 AND 10
				THEN cibil_score*500*0.7*0.8*0.8*loan_factor*credit_card_factor*internal_loan_factor  

				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts <= 2 
				THEN cibil_score*500*0.7*0.7*1.1*loan_factor*credit_card_factor*internal_loan_factor
				
				WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 3 AND 5
 				THEN cibil_score*500*0.7*0.7*1*loan_factor*credit_card_factor*internal_loan_factor
								
                WHEN account_balance < (0.49*AVG(account_balance))	AND tri_monthly_avg_balance < (0.49*AVG(tri_monthly_avg_balance)) AND active_accounts BETWEEN 6 AND 10
 				THEN cibil_score*500*0.7*0.7*0.8*loan_factor*credit_card_factor*internal_loan_factor
			
            END 
        ELSE 'NOT APPROVED'
    END AS Approved_Loan_Value
    from bank_gold.loan_calculator WHERE LOWER(first_name) = '${request.params.firstName.toLowerCase()}' AND LOWER(pan_id) = '${request.params.panId.toLowerCase()}' AND phone = '${request.params.phone}'`, (err, res) => {
        if (err) {
            console.log("error: ", err);
            response.send(err);
            return;
        }
    
        console.log("bank_kyc: ", res);
        response.send(res);
    });

});

module.exports = router;