part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ToggleFavoriteState extends ProfileState {}
class AddFavoriteState extends ProfileState {}

class ChangeCheckExperienceState extends ProfileState {}
class CurrentLocationState extends ProfileState {}

class AddEducationState extends ProfileState {}
class RemoverEducationState extends ProfileState {}

class AddExperienceState extends ProfileState {}
class RemoverExperienceState extends ProfileState {}


class AddItemCompleteProfileLoading extends ProfileState {}
class AddItemCompleteProfileSuccess extends ProfileState {}
class AddItemCompleteProfileError extends ProfileState {}

class AddProfileItemCompleteProfileLoading extends ProfileState {}
class AddProfileItemCompleteProfileSuccess extends ProfileState {}
class AddProfileItemCompleteProfileError extends ProfileState {}

class AddExperienceItemCompleteProfileLoading extends ProfileState {}
class AddExperienceItemCompleteProfileSuccess extends ProfileState {}
class AddExperienceItemCompleteProfileError extends ProfileState {}

class GetPortfolioLoading extends ProfileState {}
class GetPortfolioSuccessfully extends ProfileState {}
class GetPortfolioError extends ProfileState {}
//
class AddExperienceLoadingState extends ProfileState {}
class AddExperienceSuccessState extends ProfileState {}
class AddExperienceErrorState extends ProfileState {}

class AddCVLoadingState extends ProfileState {}
class AddCVSuccessState extends ProfileState {}
class AddCVErrorState extends ProfileState {}

class PickCVLoading extends ProfileState {}
class PickCVSuccess extends ProfileState {}
class PickCVError extends ProfileState {}

class UpdateProfileLoading extends ProfileState {}
class UpdateProfileSuccessfully extends ProfileState {}
class UpdateProfileError extends ProfileState {}

class GetProfileLoading extends ProfileState {}
class GetProfileSuccessfully extends ProfileState {}
class GetProfileError extends ProfileState {}

class UpdateProfileDetailsLoading extends ProfileState {}
class UpdateProfileDetailsSuccessfully extends ProfileState {}
class UpdateProfileDetailsError extends ProfileState {}

class PickImageLoading extends ProfileState {}
class PickImageError extends ProfileState {}

class PickImageSuccess extends ProfileState {}
class GetImageLoading extends ProfileState {}
class GetImageSuccess extends ProfileState {}
class GetImageError extends ProfileState {}


