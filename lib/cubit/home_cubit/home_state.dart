part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// class IsTrueState extends HomeState {}
// class IsFalseState extends HomeState {}

class ToggleFavoriteState extends HomeState {}
class FavoriteAddState extends HomeState {}

class GetSuggestJobsSuccessfully extends HomeState {}
class GetSuggestJobsLoading extends HomeState {}
class GetSuggestJobsError extends HomeState {}

class GetRecentJobsSuccessfully extends HomeState {}
class GetRecentJobsLoading extends HomeState {}
class GetRecentJobsError extends HomeState {}

class GetFilterJobListSuccessState extends HomeState {}

class GetFavouriteJobsSuccessfully extends HomeState {}
class GetFavouriteJobsLoading extends HomeState {}
class GetFavouriteJobsError extends HomeState {}

class AddFavouriteJobsSuccessfully extends HomeState {}
class AddFavouriteJobsLoading extends HomeState {}
class AddFavouriteJobsError extends HomeState {}

class RemoveFavouriteItemLoadingState extends HomeState {}
class RemoveFavouriteItemSuccessfullyState extends HomeState {}
class RemoveFavouriteItemErrorState extends HomeState {}

class SearchLoading extends HomeState {}
class SearchEmptyState extends HomeState {}
class SearchLoadedState extends HomeState {}
class SearchErrorState extends HomeState {}