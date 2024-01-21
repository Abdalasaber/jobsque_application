import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'apply_now_state.dart';

class ApplyNowCubit extends Cubit<ApplyNowState> {
  ApplyNowCubit() : super(ApplyNowInitial());

  static ApplyNowCubit get(context)=>BlocProvider.of(context);

  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  bool isCheck = false;

  // List<String> jopOption = [
  //   'Description',
  //   'Company',
  //   'People',
  // ];

  int currentIndex = 0;

  // List<String> jopReq = [
  //     'FullTime',
  //     'Onsite',
  //     'Senior',
  //   ];

  String dropDownValue = 'UI/UX Designer';

  // var items = [
  //   'UI/UX Designer',
  //   'Flutter Developer',
  // ];



  final formKey= GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final towController = TextEditingController();
  final threeController = TextEditingController();
  var myCountry = CountryCode(name:"EG",dialCode: "+20");

  final controller =PageController();
  bool isLast=false;

  int currentStep=0;


  // tabToggle() => Column(
  //   children: [
  //     ValueListenableBuilder(
  //       valueListenable: tabIndexBasicToggle,
  //       builder: (context, currentIndex, _) {
  //         return FlutterToggleTab(
  //           width: 90,
  //           borderRadius: 30,
  //           height: 50,
  //           selectedIndex: currentIndex,
  //           selectedBackgroundColors: const [
  //             AppTheme.toggleActive,
  //           ],
  //           unSelectedBackgroundColors: const [AppTheme.white],
  //           selectedTextStyle: TextStyle(
  //             color: AppTheme.white,
  //             fontSize: 12.sp,
  //             fontWeight: FontWeight.w700,
  //           ),
  //           unSelectedTextStyle: TextStyle(
  //             color: AppTheme.subText,
  //             fontSize: 12.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           labels: jopOption,
  //           selectedLabelIndex: (index) {
  //             // setState(() {
  //               tabIndexBasicToggle.value = index;
  //               emit(OnChangToggleState());
  //             // });
  //             // cubit.OnChangToggle(index);
  //           },
  //           isScroll: false,
  //         );
  //       },
  //     ),
  //   ],
  // );



  checkButton(newCheck) {
      isCheck = newCheck!;
      emit(CheckButtonState());
  }
  isDone(){
      isLast = true;
      emit(ItsDoneState());
  }
  isNotDone(){
      isLast = false;
      emit(NotDoneState());
  }

  isNext(){
    currentStep++;
    emit(IsNextState());
  }

  void incrementStep() {
    // if (currentStep < 2) {
    //   if (formKey.currentState!.validate()) {
        currentStep++;
        emit(ButtonState());
        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        emit(ButtonState());
  }

  change(String? newValue) {
    dropDownValue = newValue!;
    emit(ChangeState());

  }


  changeNext(){
      controller.nextPage(
          duration: const Duration(microseconds: 1000000),
          curve: Curves.easeInOut);
      emit(ChangeNextState());
      currentStep++;
      emit(ChangeNextPState());
  }

  changeText() {
    if(currentStep < 2) {
       return 'Next';
    }
    // emit(ChangeTextState());
    else {
      return 'Submit';
    }

  }


  // isSelect(){
  //     itemTypeWorkModel[index].isSelected =
  //     !itemTypeWorkModel[index].isSelected;
  //
  // }
}
