part of 'bank_output_bloc.dart';

abstract class BankOutputState extends Equatable {
  const BankOutputState();
  
  @override
  List<Object> get props => [];
}

class BankOutputInitial extends BankOutputState {}

class BankOutputLoading extends BankOutputState {}

class BankOutputLoaded extends BankOutputState {
  final BankUserDetails bankUserDetails;

  const BankOutputLoaded(this.bankUserDetails);

  @override
  List<Object> get props => [bankUserDetails];
}

class BankOutputLoadFailed extends BankOutputState {
  final String message;

  const BankOutputLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
