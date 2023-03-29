import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vikings_bank/models/bank_user_details.dart';
import 'package:vikings_bank/repository/user_bank_details_repository.dart';
import 'package:vikings_bank/utils/exceptions.dart';

part 'bank_output_event.dart';
part 'bank_output_state.dart';

class BankOutputBloc extends Bloc<BankOutputEvent, BankOutputState> {

  final UserBankDetailsRepository userBankDetailsRepository;

  BankOutputBloc(this.userBankDetailsRepository) : super(BankOutputInitial()) {
    on<BankOutputEvent>(_getBankUserDetails);
  }

  FutureOr<void> _getBankUserDetails(BankOutputEvent event, Emitter<BankOutputState> emit) async {
    emit(BankOutputLoading());
    try {

      final BankUserDetails bankUserDetails = await userBankDetailsRepository.getBankUserDetails(event.firstName, event.panId, event.phone);

      emit(BankOutputLoaded(bankUserDetails));

    } on BankUserDetailsException catch(error) {
      emit(BankOutputLoadFailed(error.errorMessage));
    }
  }
}
