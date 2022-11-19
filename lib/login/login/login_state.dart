part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class Loading extends LoginState {
  @override
  List<Object> get props => [];
}

class Loaded extends LoginState {
  const Loaded(this.demoData);

  final String? demoData;

  @override
  List<Object> get props => [];
}

class Error extends LoginState {
  const Error(this.demoData);

  final String? demoData;

  @override
  List<Object> get props => [];
}
