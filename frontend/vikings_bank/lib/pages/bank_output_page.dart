import 'package:flutter/material.dart';

class BankOutputPage extends StatefulWidget {
  final String firstName;
  final String cibilScore;
  final String approvedLoanValue;
  final String accountBalance;
  final String loanFactor;
  final String creditCardFactor;
  final String internalLoanFactor;
  final String loanStatus;

  const BankOutputPage({
    Key? key,
    required this.firstName, 
    required this.cibilScore, 
    required this.approvedLoanValue, 
    required this.accountBalance, 
    required this.loanFactor, 
    required this.creditCardFactor, 
    required this.internalLoanFactor,
    required this.loanStatus,
  }) : super(key: key);

  @override
  State<BankOutputPage> createState() => _BankOutputPageState();
}

class _BankOutputPageState extends State<BankOutputPage> {
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
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const Text(
                'User Details',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Card(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(widget.firstName,style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cibil Score', style: TextStyle(fontSize: 18)),
                          Text(widget.cibilScore, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Approved Loan Value', style: TextStyle(fontSize: 18)),
                          Text(widget.approvedLoanValue, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Card(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Account Balance', style: TextStyle(fontSize: 18)),
                          Text(widget.accountBalance, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Loan Factor', style: TextStyle(fontSize: 18)),
                          Text(widget.loanFactor, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Credit Card Factor', style: TextStyle(fontSize: 18)),
                          Text(widget.creditCardFactor, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Internal Loan Factor',style: TextStyle(fontSize: 18)),
                          Text(widget.internalLoanFactor, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Loan Status',style: TextStyle(fontSize: 18)),
                          Text(widget.loanStatus, style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}