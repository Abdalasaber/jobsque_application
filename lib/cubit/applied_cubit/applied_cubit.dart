import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/enums.dart';
import 'package:sizer/sizer.dart';
import '../../local_database/cache_helper.dart';
import '../../model/applied_model/applied_job_model.dart';
import '../../model/job_model/job_data_model.dart';
import '../../model/job_model/recent_job_model.dart';
import '../../remote_database/dio_helper.dart';
import '../../remote_database/endpoints.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import '../../widget/default_header_star.dart';

part 'applied_state.dart';

class AppliedCubit extends Cubit<AppliedState> {
  AppliedCubit() : super(AppliedInitial());

  static AppliedCubit get(context)=>BlocProvider.of(context);
  List<JobDataModel> appliedJobsData = [];

  List<String> lab = ['Active', 'Rejected'];
  bool isSelect = true;
  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  int currentIndex = 0;

  void getAppliedJobsId(){

    emit(GetAppliedJobsIDLoading());
    DioHelper.getData(url: '$applyJobEndPoint/${CashHelper.getString(key: MyKeyCache.userId)}')
        .then((value) {
      if(value.data['data'].isEmpty){
        emit(AppliedJobEmpty());
        // ignore: avoid_print
        print('yes');
      }
      else{
        for (var job in value.data['data']) {
          String id= AppliedJobData.fromJson(job).jobsId.toString();
          getAppliedJobs(jobId: id);
        }
        emit(GetAppliedJobsIDSuccessfully());
      }
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetAppliedJobsIDError());
    });

  }

  int activeIndex = 0;
  changeIndex(index){
    activeIndex=index;
    emit(ChangeIndex());
  }

  void applyForJob({
    required String name,
    required String email,
    required String mobile,
    required String jobsId,
    required JobDataModel jobDataModel,
  }) {
    appliedJobsData.add(jobDataModel);
    emit(AppliedJobLoadedState(appliedJobsData));
  }

  List<JobDataModel> appliedJobsDataModel = [];

  void getAppliedJobs({required String jobId}) {
    emit(GetAppliedJobsLoading());
    DioHelper.getData(url: '$allJobsEndPoint/$jobId')
        .then((value) {
      appliedJobsData.add(JobDataModel.fromJson(value.data['data']));
      // if (appliedJobsData.isEmpty) {
      //   emit(AppliedJobEmpty());
      // } else {
      //   emit(GetAppliedJobsSuccessfully());
      // }
      emit(GetAppliedJobsSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetAppliedJobsError());
    });
  }

  tabOnToggleShow() => tabIndexBasicToggle.value == 0
      ? Column(
    children: [
      DefaultHeaderStart(
        text: '${itemsRecentModel.length} jobs',
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 3.h),
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
            ),
            itemCount: itemsRecentModel.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 23.3.h,
                width: 100.w,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(itemsRecentModel[index].image),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    text: itemsRecentModel[index].name,
                                    fontSize: 15.sp,
                                    color: AppTheme.deepBlue,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  DefaultText(
                                    text: itemsRecentModel[index].subtext,
                                    fontSize: 11.sp,
                                    color: AppTheme.subText,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              IconButton(
                                onPressed: () {
                                        itemsRecentModel[index];
                                        emit(TabToggleState());
                                },
                                icon: favorites
                                    .contains(itemsRecentModel[index])
                                    ? Transform.translate(
                                    offset: Offset(2.h, 0.h),
                                    child: Icon(
                                      Iconsax.archive_minus5,
                                      color: AppTheme.baseColor,
                                      size: 4.5.h,
                                    ))
                                    : Icon(
                                  Iconsax.archive_minus,
                                  color: itemsRecentModel[index]
                                      .isSelect ==
                                      true
                                      ? AppTheme.white
                                      : AppTheme.black,
                                  size: 4.h,
                                ),
                              ),
                            ],
                          ),
                        ])),
              );
            }),
      ),
    ],
  )
      : tabIndexBasicToggle.value == 1
      ? Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/no_rejected.png'),
        SizedBox(
          height: 2.h,
        ),
        DefaultText(
          text: 'No applications were',
          fontSize: 23.sp,
          maxLines: 1,
          fontWeight: FontWeight.w500,
          color: AppTheme.black,
        ),
        DefaultText(
          text: 'rejected',
          fontSize: 23.sp,
          maxLines: 2,
          fontWeight: FontWeight.w500,
          color: AppTheme.black,
        ),
        SizedBox(
          height: 1.h,
        ),
        const DefaultText(
          text: 'If there is an application that is rejected by',
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppTheme.subText,
          maxLines: 1,
        ),
        const DefaultText(
          text: ' the company it will appear here',
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppTheme.subText,
          maxLines: 1,
        ),
      ],
    ),
  )
      : const DefaultText(text: 'text');

  void toggleFavorite(RecentJobModel item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      emit(ToggleFavoriteState());
    } else {
      favorites.add(item);
      emit(ToggleFavoriteState());
    }
  }

  // void SelectedLabelIndex(index) {
  // tabIndexBasicToggle.value = index;
  // emit(SelectedLabelState());
  // }

  tabToggleSwitch() => Column(
    children: [
      ValueListenableBuilder(
        valueListenable: tabIndexBasicToggle,
        builder: (context, currentIndex, _) {
          return FlutterToggleTab(
            width: 21.w,
            borderRadius: 40,
            height: 5.5.h,
            selectedIndex: currentIndex,
            selectedBackgroundColors: const [
              AppTheme.toggleActive,
            ],
            unSelectedBackgroundColors: const [AppTheme.white],
            selectedTextStyle: TextStyle(
              color: AppTheme.white,
              fontSize: 12.sp,
            ),
            unSelectedTextStyle: TextStyle(
              color: AppTheme.subText,
              fontSize: 12.sp,
            ),
            labels: lab,
            selectedLabelIndex: (index) {
              tabIndexBasicToggle.value = index;
              emit(SelectedLabelState());
            },
            isScroll: false,
          );
        },
      ),
    ],
  );




}
