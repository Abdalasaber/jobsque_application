part of 'applied_cubit.dart';

@immutable
abstract class AppliedState {}

class AppliedJobLoadedState extends AppliedState {
  final List<JobDataModel> appliedJobs;
  AppliedJobLoadedState(this.appliedJobs);
}

class AppliedInitial extends AppliedState {}
class TabToggleState extends AppliedState {}
class ToggleFavoriteState extends AppliedState {}
class SelectedLabelState extends AppliedState {}

class GetAppliedJobsLoading extends AppliedState {}
class AppliedJobEmpty extends AppliedState {}
class GetAppliedJobsSuccessfully extends AppliedState {}
class GetAppliedJobsError extends AppliedState {}

class GetAppliedJobsIDLoading extends AppliedState {}
class GetAppliedJobsIDSuccessfully extends AppliedState {}
class GetAppliedJobsIDError extends AppliedState {}


class ChangeIndex extends AppliedState {}
