import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vikings_bank/pages/bank_input_page.dart';
import 'package:vikings_bank/pages/bank_output_page.dart';
import 'package:vikings_bank/repository/user_bank_details_repository.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BankInputPage();
      },
      routes: [
        GoRoute(
          name: 'output',
          path: 'output/:firstName/:cibilScore/:approvedLoanValue/:accountBalance/:loanFactor/:creditCardFactor/:internalLoanFactor/:loanStatus',
          builder: (BuildContext context, GoRouterState state) {
            return BankOutputPage(
              firstName: state.params['firstName']!,
              cibilScore: state.params['cibilScore']!,
              approvedLoanValue: state.params['approvedLoanValue']!,
              accountBalance: state.params['accountBalance']!,
              loanFactor: state.params['loanFactor']!,
              creditCardFactor: state.params['creditCardFactor']!,
              internalLoanFactor: state.params['internalLoanFactor']!,
              loanStatus: state.params['loanStatus']!,
            );
          },
        ),
      ]
    ),
    
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserBankDetailsRepository(),
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}