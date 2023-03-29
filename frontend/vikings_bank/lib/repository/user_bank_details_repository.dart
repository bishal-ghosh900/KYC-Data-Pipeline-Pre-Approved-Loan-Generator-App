import 'package:vikings_bank/models/bank_user_details.dart';
import 'package:vikings_bank/utils/exceptions.dart';
import 'package:vikings_bank/network/bank_user_network_client.dart';

class UserBankDetailsRepository {
  Future<BankUserDetails> getBankUserDetails(String firstName, String panId, String phone) async {
    try {
      List<dynamic> bankUserDetailsInfo = await BankUserNetworkClient.instance.getBankUserDetails(firstName, panId, phone);

      if(bankUserDetailsInfo[0]['first_name'] == null) {
        throw BankInvalidUserException('Invalid user');
      }
      
      return bankUserDetailsInfo.map((user) => BankUserDetails(
        firstName: user['first_name']!.toString(), 
        cibilScore: user['cibil_score']!.toString(), 
        approvedLoanValue: user['Approved_Loan_Value']!.toString(), 
        accountBalance: user['account_balance']!.toString(), 
        loanFactor: user['loan_factor']!.toString(), 
        creditCardFactor: user['credit_card_factor']!.toString(), 
        internalLoanFactor: user['internal_loan_factor']!.toString(),
        loanStatus: user['loan_status']
      )).toList()[0];

    } on NetworkException catch(err) {
      throw BankUserDetailsException(err.errorMessage);
    } on BankInvalidUserException catch(err) {
      throw BankUserDetailsException(err.errorMessage);
    } catch(_) {
      throw BankUserDetailsException('Something went wrong');
    }
  }
}