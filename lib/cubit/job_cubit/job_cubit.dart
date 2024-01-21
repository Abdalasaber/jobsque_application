import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:jobsque/enums.dart';
import 'package:sizer/sizer.dart';
import '../../../local_database/cache_helper.dart';
import '../../../remote_database/dio_helper.dart';
import '../../model/job_model/job_data_model.dart';
import '../../remote_database/endpoints.dart';
import '../../styles/color.dart';
import '../applied_cubit/applied_cubit.dart';


part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  // final AppliedCubit appliedCubit; // Add this line
  final AppliedCubit appliedCubit; // Add this line

  JobCubit({required this.appliedCubit}) : super(JobInitial());

  // JobCubit(this.appliedCubit) : super(JobInitial());
  static JobCubit get(context) => BlocProvider.of(context);
  var myCountry = CountryCode(name: "EG", dialCode: "+20");

  // bool isLastOnBo = false;

  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  List<String> jopOption = [
    'Description',
    'Company',
    'People',
  ];

  // final AppliedCubit appliedCubit;


  String dropDownValue = 'UI/UX Designer';

  var items = [
    'UI/UX Designer',
    'Flutter Developer',
  ];

  change(String? newValue) {
    dropDownValue = newValue!;
    emit(ChangeState());
  }


  int activeIndex = 0;

  void changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndexState());
  }

  int currentStep = 0;

  void addStep() {
    currentStep = currentStep + 1;
    // ignore: avoid_print
    print(currentStep);
    emit(ChangeAddStepState());
  }


  void minusStep() {
    currentStep = currentStep - 1;
    // ignore: avoid_print
    print(currentStep);
    emit(ChangeMinusStepState());
  }

  int? selectedChoice;

  // bool isSelected=false ;

  void selectChoice(value) {
    selectedChoice = value;
    // isSelected=true;
    emit(ChangeSelectedChoiceState());
  }

  // final List<TypeofWorkTile> typeOfWorkTiles = [
  //   TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 1,),
  //   TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 2),
  //   TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 3,),
  //   TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 4,),
  // ];

  File? selectedCVFile;
  File? selectedOtherFile;


  Future<void> pickFile(String target) async {
    emit(PickCVLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: target == 'CV' ? ['pdf'] : [
        'jpg',
        'png',
        'heic',
        'jpeg',
        'gif',
        'svg'
      ],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      if (target == 'CV') {
        selectedCVFile = file;
      } else if (target == 'Other') {
        selectedOtherFile = file;
      }
      emit(PickCVSuccess());
    } else {
      emit(PickCVError());
      return;
    }
  }


  void applyJob(
      String name,
      String email,
      String mobile,
      String jobsId,
      ) async {
    try {
      emit(ApplyJobLoadingState());
      FormData formData = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(selectedCVFile!.path),
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': 'full',
        'other_file': await MultipartFile.fromFile(selectedOtherFile!.path),
        'jobs_id': jobsId,
        'user_id': CashHelper.getString(key: MyKeyCache.userId
        ),
      });
      // ignore: avoid_print
      print(formData.length);
      final response = await DioHelper.PostFormData(url: applyJobEndPoint, data: formData);
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.data);
        emit(ApplyJobSuccessState());
      } else {
        // ignore: avoid_print
        print('Request failed with status: ${response.statusCode}');
        emit(ApplyJobErrorState());
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
      emit(ApplyJobErrorState());
    }
  }


  void applyForJob({
    required String name,
    required String email,
    required String mobile,
    required String jobsId,
    required JobDataModel jobDataModel,
  }) {
    appliedCubit.appliedJobsData.add(jobDataModel);
    emit(JobAppliedSuccessfullyState());
  }

  tabToggle() => Column(
    children: [
      ValueListenableBuilder(
        valueListenable: tabIndexBasicToggle,
        builder: (context, currentIndex, _) {
          return FlutterToggleTab(
            width: 90,
            borderRadius: 30,
            height: 50,
            selectedIndex: currentIndex,
            selectedBackgroundColors: const [
              AppTheme.toggleActive,
            ],
            unSelectedBackgroundColors: const [AppTheme.white],
            selectedTextStyle: TextStyle(
              color: AppTheme.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            unSelectedTextStyle: TextStyle(
              color: AppTheme.subText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            labels: jopOption,
            selectedLabelIndex: (index) {
              // setState(() {
              tabIndexBasicToggle.value = index;
              emit(OnChangToggleState());
              // });
            },
            isScroll: false,
          );
        },
      ),
    ],
  );


}
