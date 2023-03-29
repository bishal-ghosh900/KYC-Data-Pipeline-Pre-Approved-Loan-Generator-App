part of 'bank_output_bloc.dart';

class BankOutputEvent extends Equatable {
  final String firstName;
  final String panId;
  final String phone;

  const BankOutputEvent({
    required this.firstName,
    required this.panId,
    required this.phone,
  });

  @override
  List<Object> get props => [firstName, panId, phone];
}
