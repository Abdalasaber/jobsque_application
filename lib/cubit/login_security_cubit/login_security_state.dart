part of 'login_security_cubit.dart';

@immutable
abstract class LoginSecurityState {}

class LoginSecurityInitial extends LoginSecurityState {}

class LoginLoading extends LoginSecurityState {}
class LoginSuccess extends LoginSecurityState {}
class LoginError extends LoginSecurityState {}

class LoginUserFocus extends LoginSecurityState {}
class LoginPasswordFocus extends LoginSecurityState {}

class LoginVIcon extends LoginSecurityState {}
class IconNew extends LoginSecurityState {}
class IconConfirm extends LoginSecurityState {}

class LoginUpdateButtonColor extends LoginSecurityState {}
class LoginButtonColor extends LoginSecurityState {}

class IsLastTrueState extends LoginSecurityState {}
class IsLastFalseState extends LoginSecurityState {}

class OnToggleState extends LoginSecurityState {}

class OnChangedState extends LoginSecurityState {}

