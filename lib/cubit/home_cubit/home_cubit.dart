import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';
import '../../model/job_model/job_data_model.dart';
import '../../model/job_model/recent_job_model.dart';
import '../../remote_database/dio_helper.dart';
import '../../remote_database/endpoints.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context)=>BlocProvider.of(context);

  String? name;
  final searchController = TextEditingController();
  int currentIndex =0;

  // List<String> jopTitle = [
  //   'FullTime',
  //   'Remotely',
  //   'Design',
  // ];
  // List<String> jopReq = [
  //   'FullTime',
  //   'Remotely',
  //   'Senior',
  // ];

  // bool isLast = false;
  // isTrue(){
  //   isLast = true;
  //   emit(IsTrueState());
  // }
  // isFalse(){
  //   isLast = false;
  //   emit(IsFalseState());
  // }
  int currentStep =0;
  bool isSearching = false;

  late String searchKey;
  void searchTextChanged(String text) {
    searchKey = text;
    if (text.isEmpty) {
      isSearching = false;
    } else {
      isSearching = true;
    }
  }

  List<JobDataModel> foundResults = [];
  void searchJob({required String name}) {
    foundResults.clear();
    filterJob(input: name);
    emit(SearchLoading());
    DioHelper.PostData(url: searchJobEndPoint,data: {'name':name}).then((value) {
      for (var job in value.data['data']) {
        foundResults.add(JobDataModel.fromJson(job));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmptyState());
      } else {
        emit(SearchLoadedState());
      }
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(SearchErrorState());
    });
  }

  List<JobDataModel> filterJobList= [];
  void filterJob({required String input}){
    filterJobList.clear();
    searchTextChanged(input);
    filterJobList = suggestJobsData.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(GetFilterJobListSuccessState());
  }


  List<JobDataModel> suggestJobsData = [];

  void getSuggestJobs() {
    emit(GetSuggestJobsLoading());
    DioHelper.getData(url: suggestJobsEndPoint)
        .then((value) {
      suggestJobsData.add(JobDataModel.fromJson(value.data['data']));
      emit(GetSuggestJobsSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetSuggestJobsError());
    });
  }

  List<JobDataModel> recentJobsData = [];

  void getRecentJobs() {
    emit(GetRecentJobsLoading());
    DioHelper.getData(url: allJobsEndPoint)
        .then((value) {
      for (var job in value.data['data']) {
        recentJobsData.add(JobDataModel.fromJson(job));
      }
      emit(GetRecentJobsSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetRecentJobsError());
    });
  }




  List<FavouriteData> favouriteItems=[];
  void getFavouriteJobs() {
    favouriteItems=[];
    emit(GetFavouriteJobsLoading());
    DioHelper.getData(url: favouriteJobsEndPoint)
        .then((value) {
      for (var job in value.data['data']) {
        favouriteItems.add(FavouriteData.fromJson(job));
        // ignore: avoid_print
        print(job);
      }
      emit(GetFavouriteJobsSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetFavouriteJobsError());
    });
  }


  bool checkFavourite(var id) {
    for (var job in favouriteItems) {
      if (job.jobId == id) {
        return true;
      }
    }
    return false;
  }



  void addFavourite(JobDataModel job){
    emit(AddFavouriteJobsLoading());
    DioHelper.PostData(url: favouriteJobsEndPoint, query: {
      'user_id':CashHelper.getString(key: MyKeyCache.userId),
      'job_id':job.id
    })
        .then((value) {
      // favouriteItems.add(job);
      getFavouriteJobs();
      // ignore: avoid_print
      print(value.data);
      emit(AddFavouriteJobsSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(AddFavouriteJobsError());
    });
  }


  removeFavourite(String id) {
    emit(RemoveFavouriteItemLoadingState());
    return DioHelper.deleteData(url: '$favouriteJobsEndPoint/$id')
        .then((value) {
      //favouriteItems.removeWhere((element) => element.id == job.id);
      getFavouriteJobs();
      emit(RemoveFavouriteItemSuccessfullyState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      // ignore: avoid_print
      print(RemoveFavouriteItemErrorState());
    });
  }


  handleFavourite(JobDataModel job) {
    if (checkFavourite(job.id!)) {
      removeFavourite(searchFavouriteIdToRemoveItem(job.id!));
      // removeFavourite(searchFavouriteIdToRemoveItem(job.id!) );
    } else {
      addFavourite(job);
    }
  }

  searchFavouriteIdToRemoveItem(int id){
    for (var job in favouriteItems) {
      if (job.jobId == id) {
        // ignore: avoid_print
        print(job.id.toString());
        // ignore: avoid_print
        print('$favouriteJobsEndPoint/${job.id.toString()}');
        return job.id.toString();
      }
    }
  }

// List<RecentJobModel>favorites=[];
  void toggleFavorite(RecentJobModel item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      emit(ToggleFavoriteState());
    } else {
      favorites.add(item);
      emit(ToggleFavoriteState());
    }
  }

  void favoriteApi(FavouriteData item) {
    if (favouriteItems.contains(item)) {
      favouriteItems.remove(item);
      // ignore: avoid_print
      print('delete');

      emit(ToggleFavoriteState());
    } else {
      favouriteItems.add(item);
      // ignore: avoid_print
      print('added');
      emit(FavoriteAddState());
    }
  }


}
