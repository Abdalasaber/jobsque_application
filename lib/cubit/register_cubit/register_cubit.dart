import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/register_model/register_model.dart';
import '../../remote_database/dio_helper.dart';
import '../../remote_database/endpoints.dart';
import '../../styles/color.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isUsernameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  bool isWhat = true;
  bool isShow = true;
  bool isCheck = false;

  Color buttonColor = AppTheme.unActiveButton;

  var formKey = GlobalKey<FormState>();

  Color textColor = AppTheme.black;

  // bool isSelected=false;
  RegisterModel? registerModel;
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.PostData(url: register, data: {
      'name': name,
      'email': email,
      "password": password,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      // ignore: avoid_print
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  usernameFocusChange(){
    usernameFocus.addListener(() {
        isUsernameFocused = usernameFocus.hasFocus;
        emit(FocusChange());

    });
  }
  emailFocusChange(){
    emailFocus.addListener(() {
    isEmailFocused = emailFocus.hasFocus;
    emit(FocusChange());
    });
  }

  passwordFocusChange(){
    passwordFocus.addListener(() {
            isPasswordFocused = passwordFocus.hasFocus;
            emit(FocusChange());
    });
  }

  iconChang(){
    isShow = !isShow;
    emit(IconChange());

  }

  updateButtonColor(String _) {
      buttonColor =
      userNameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty
          ? AppTheme.unActiveButton
          : AppTheme.baseColor;
      emit(UpdateButtonColor());
  }

  List<String> interestedWork=[];
  void addItem(String work){
    interestedWork.add(work);
    emit(InterestedWorkState());
  }
  void deleteItem(String work){
    interestedWork.remove(work);
    emit(InterestedWorkState());
  }


  int activeIndex =0;
  void userDataSetup() {
    DioHelper.PutData(url: editProfile, data: {
      'interested_work': interestedWork.join(","),
      'offline_place':(activeIndex==0).toString(),
      'remote_place':(activeIndex==1).toString(),
      'address':selectedCountries.join(",")
    },
      token: registerModel!.token,
    ).then((value) {
      emit(DataLoadingState());
      // ignore: avoid_print
      print(value.data);
      // ignore: avoid_print
      print(registerModel!.token);
      emit(DataSuccessfullyState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(DataErrorState());
    });
  }
  List<String> selectedCountries=[];
  void addItemCountry(String country){
    selectedCountries.add(country);
    emit(SelectCountryState());
  }
  void deleteItemCountry(String country){
    selectedCountries.remove(country);
    emit(SelectCountryState());
  }

  changeIndex(index){
    activeIndex=index;
    emit(ChangeIndexState());
  }


}
