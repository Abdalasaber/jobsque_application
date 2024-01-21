import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../model/job_model/job_data_model.dart';
import '../../remote_database/dio_helper.dart';
import '../../remote_database/endpoints.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<String> recentSearches = [
    'Junior UI Designer',
    'Junior UX Designer',
    'Product Designer',
    'Project Manager',
    'UI/UX Designer',
    'Front-End Developer',
  ];

  List<String> popularSearches = [
    'UI/UX Designer',
    'Project Manager',
    'Product Designer',
    'UX Designer',
    'Front-End Developer',
  ];

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
    searchTextChanged(name);
    emit(SearchLoading());

    DioHelper.PostData(url: searchJobEndPoint, data: {'name': name})
        .then((value) {
      for (var job in value.data['data']) {
        foundResults.add(JobDataModel.fromJson(job));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(SearchError());
    });
  }

  String? selectedValue;

  changeSelectedSalary(String? value) {
    selectedValue = value;
    emit(ChangeSalaryFilter());
  }

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      value: "",
      child: DefaultText(
        text: 'Select Salary',
        color: AppTheme.green,
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    DropdownMenuItem(
      value: "16",
      child: DefaultText(
        text: '\$16K - \$17K',
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.green,
      ),
    ),
    DropdownMenuItem(
      value: "18",
      child: DefaultText(
        text: '\$18K - \$19K',
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.green,
      ),
    ),
    DropdownMenuItem(
      value: "20",
      child: DefaultText(
        text: '\$20K - \$21K',
        fontSize: 11.5.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.green,
      ),
    ),
  ];

  fetchDataWithFilters({
    String? location,
    String? salary,
  }) {
    foundResults.clear();

    emit(SearchLoading());
    DioHelper.PostData(
      url: searchJobEndPoint,
      data: {
        'name': searchKey,
        'location': location,
        'salary': selectedValue,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (var job in value.data['data']) {
        foundResults.add(JobDataModel.fromJson(job));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(FilterError());
    });
  }

  List<String> jobTypeFilter = [];
  void addItem(String work) {
    jobTypeFilter.add(work);
    emit(ChangeJobTypeColor());
  }

  void deleteItem(String work) {
    jobTypeFilter.remove(work);
    emit(ChangeJobTypeColor());
  }
}
