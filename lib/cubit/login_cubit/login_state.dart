part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {}

class LoginUserFocus extends LoginState {}
class LoginPasswordFocus extends LoginState {}

class LoginVIcon extends LoginState {}

class LoginUpdateButtonColor extends LoginState {}
class LoginButtonColor extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginErrorState extends LoginState {}

class ChangeRememberState extends LoginState {}
