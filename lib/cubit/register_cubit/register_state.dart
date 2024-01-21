part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class FocusChange extends RegisterState {}
class IconChange extends RegisterState {}
class UpdateButtonColor extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {}

class InterestedWorkState extends RegisterState {}

class selectedCountries extends RegisterState {}

class DataLoadingState extends RegisterState {}
class DataSuccessfullyState extends RegisterState {}
class DataErrorState extends RegisterState {}

class SelectCountryState extends RegisterState {}
class ChangeIndexState extends RegisterState {}
