import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/enums.dart';

import '../../local_database/cache_helper.dart';
import '../../styles/color.dart';

part 'login_security_state.dart';

class LoginSecurityCubit extends Cubit<LoginSecurityState> {
  LoginSecurityCubit() : super(LoginSecurityInitial());

  static LoginSecurityCubit get(context)=>BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Color buttonColor = AppTheme.unActiveButton;
  bool isShow = true;
  bool isShowNew = true;
  bool isShowConfirm = true;
  bool isCheck = false;

  var formKey = GlobalKey<FormState>();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool isUsernameFocused = false;
  bool isPasswordFocused = false;
  final emailController = TextEditingController(text: CashHelper.getString(key: MyKeyCache.email));

  bool status = false;
  final controller = PageController();
  bool isLast = false;
  int currentStep = 0;
  String dropDownValue = 'Telephone number (SMS)';
  var items = [
    'Telephone number (SMS)',
    'Telephone number (Call)',
  ];
  final phoneController = TextEditingController();
  var myCountry = CountryCode(name: "EG", dialCode: "+20");



  usernameFocusChange(_) {
    usernameFocus.addListener(() {
      isUsernameFocused = usernameFocus.hasFocus;
      emit(LoginUserFocus());
    });
  }

  passwordFocusChange(_) {
    passwordFocus.addListener(() {
      isPasswordFocused = passwordFocus.hasFocus;
      emit(LoginPasswordFocus());
    });
  }

  checkButton(newCheck) {
    isCheck = newCheck!;
    emit(LoginVIcon());
  }

  vIcon() {
    isShow = !isShow;
    emit(LoginVIcon());
  }
  iconNew() {
    isShowNew = !isShowNew;
    emit(IconNew());
  }
  iconConfirm() {
    isShowConfirm = !isShowConfirm;
    emit(IconConfirm());
  }

  updateButtonColor(String _) {
    buttonColor =
    usernameController.text.isEmpty || oldPasswordController.text.isEmpty
        ? AppTheme.unActiveButton
        : AppTheme.baseColor;
    emit(LoginUpdateButtonColor());
  }

  isLastTrue(){
    isLast = true;
    emit(IsLastTrueState());
  }
  isLastFalse(){
    isLast = false;
    emit(IsLastFalseState());
  }

  onToggle (bool val) {
  status = val;
  emit(OnToggleState());
  }

  onChanged (String? newValue) {
  dropDownValue = newValue!;
  emit(OnChangedState());
  }




}
