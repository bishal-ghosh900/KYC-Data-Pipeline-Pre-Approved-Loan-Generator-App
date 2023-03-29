import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vikings_bank/pages/bloc/bank_output_bloc.dart';
import 'package:vikings_bank/repository/user_bank_details_repository.dart';

class BankInputPage extends StatefulWidget {
  const BankInputPage({Key? key}) : super(key: key);

  @override
  State<BankInputPage> createState() => _BankInputPageState();
}

class _BankInputPageState extends State<BankInputPage> {

  // controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _panIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  

  // blocs
  late final BankOutputBloc _bankOutputBloc;


  void onSubmit() {
    final String firstName = _firstNameController.text;
    final String panId = _panIdController.text;
    final String phone = _phoneController.text;

    

    if(firstName.isNotEmpty && panId.isNotEmpty && phone.isNotEmpty) {

      _bankOutputBloc.add(BankOutputEvent(
        firstName: firstName,
        panId: panId,
        phone: phone,
      ));

      
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Fill all of the input fields'),
        ));
    }
  }

  void _listenBankOutput(BuildContext context, BankOutputState state) {

    if(state is BankOutputLoaded) {
      context.goNamed('output', params: {
        'firstName': state.bankUserDetails.firstName,
        'cibilScore': state.bankUserDetails.cibilScore,
        'approvedLoanValue': state.bankUserDetails.approvedLoanValue,
        'accountBalance': state.bankUserDetails.accountBalance,
        'loanFactor': state.bankUserDetails.loanFactor,
        'creditCardFactor': state.bankUserDetails.creditCardFactor,
        'internalLoanFactor': state.bankUserDetails.internalLoanFactor,
        'loanStatus': state.bankUserDetails.loanStatus == null ? 'No Status' : state.bankUserDetails.loanStatus!,
      });
    }

    if(state is BankOutputLoadFailed) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.message),
        ));
    }
  }

  @override
  void initState() {
    super.initState();
    _bankOutputBloc = BankOutputBloc(context.read<UserBankDetailsRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          labelText: 'Provide first name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _panIdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          labelText: 'Provide PAN id',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue)
                          ),
                          labelText: 'Provide phone number',
                        ),
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<BankOutputBloc, BankOutputState>(
                        bloc: _bankOutputBloc,
                        listener: _listenBankOutput,
                        builder: (context, state) => SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            onPressed: state is BankOutputLoading ? () {} : onSubmit, 
                            child: state is BankOutputLoading ? const SizedBox.square(
                              dimension: 30,
                              child: CircularProgressIndicator(color: Colors.white,),
                            ) : const Text(
                              'Submit',
                              style: TextStyle(fontSize: 15),
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}