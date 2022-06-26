part of 'name_input_cubit.dart';

abstract class NameInputState extends Equatable {
  @override
  List<Object> get props => [];
}

class NameInputInitial extends NameInputState {}

class NameInputDisabled extends NameInputState {}

class NameInputLoading extends NameInputState {}

class NameInputError extends NameInputState {
  final String error;

  NameInputError(this.error);

  @override
  List<Object> get props => [error];
}

class NameInputSuccessful extends NameInputState {}
