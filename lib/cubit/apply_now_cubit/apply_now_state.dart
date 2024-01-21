part of 'apply_now_cubit.dart';

@immutable
abstract class ApplyNowState {}

class ApplyNowInitial extends ApplyNowState {}
class OnChangToggleState extends ApplyNowState {}
class CheckButtonState extends ApplyNowState {}

class ChangeState extends ApplyNowState {}

class IsNextState extends ApplyNowState {}

class ItsDoneState extends ApplyNowState {}
class NotDoneState extends ApplyNowState {}

class ButtonState extends ApplyNowState {}

class ChangeNextState extends ApplyNowState {}
class ChangeNextPState extends ApplyNowState {}

class ChangeTextState extends ApplyNowState {}

class IncrementStepState extends ApplyNowState {
  final int newStep;

  IncrementStepState(this.newStep);
}
