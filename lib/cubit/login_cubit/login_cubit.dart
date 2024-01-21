import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/styles/color.dart';

import '../../model/job_model/loginModel.dart';
import '../../remote_database/dio_helper.dart';
import '../../remote_database/endpoints.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController usernameController = TextEditingController();
  TextEditingController usernameResetController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color buttonColor = AppTheme.unActiveButton;
  bool isShow = true;
  bool isCheck = false;
  var formKey = GlobalKey<FormState>();
  FocusNode usernameFocus = FocusNode();
  FocusNode usernameFocusReset = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool isUsernameFocused = false;
  bool isPasswordFocused = false;

  LoginModel? loginModel;
  bool isChecked= false;


  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.PostData(url: login, data: {
      'email': email,
      "password": password,
    },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      // ignore: avoid_print
      print(loginModel?.user?.id);
      emit(LoginSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print('the error is: ${error.toString()}');
      emit(LoginErrorState());
    });
  }

  void changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }


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

  updateButtonColor(String _) {
    buttonColor =
    usernameController.text.isEmpty || passwordController.text.isEmpty
        ? AppTheme.unActiveButton
        : AppTheme.baseColor;
    emit(LoginUpdateButtonColor());
  }
  updateButtonColorReset(String _) {
    buttonColor =
    usernameResetController.text.isEmpty
        ? AppTheme.unActiveButton
        : AppTheme.baseColor;
    emit(LoginUpdateButtonColor());
  }

}
