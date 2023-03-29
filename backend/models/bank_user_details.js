let sql = require('../config/db')

class BankUserDetails {
    

    get_kyc_details(result) {
        sql.query('SELECT * FROM bank_silver.kyc'), (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }
        
            console.log("bank_kyc: ", res);
            result(null, res);
        }
    }

}

module.exports = BankUserDetails;