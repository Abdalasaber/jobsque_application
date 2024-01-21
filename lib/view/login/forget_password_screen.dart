import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/login_security_cubit/login_security_cubit.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_form_field_login.dart';
import '../../widget/default_text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  late LoginSecurityCubit cubit;
  late ProfileCubit profileCubit;

  @override
  void initState() {
    cubit = LoginSecurityCubit.get(context);
    profileCubit = ProfileCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Iconsax.arrow_left,
              color: AppTheme.black,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: DefaultText(
              text: 'Change password',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
        body: BlocBuilder<LoginSecurityCubit, LoginSecurityState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: "Enter your old password",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormFieldLogin(
                        controller: cubit.oldPasswordController,
                        onChanged: cubit.updateButtonColor,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cant be empty';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: cubit.isShow,
                        hintText: 'Enter your old password',
                        prefixIcon: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.vIcon();
                          },
                          icon: cubit.isShow
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      DefaultText(
                        text: "Enter your new password",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormFieldLogin(
                        controller: cubit.newPasswordController,
                        onChanged: cubit.updateButtonColor,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cant be empty';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: cubit.isShowNew,
                        hintText: 'Enter your new password',
                        prefixIcon: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.iconNew();
                          },
                          icon: cubit.isShowNew
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultText(
                        text: "Confirm your new password",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormFieldLogin(
                        focusNode: cubit.passwordFocus,
                        controller: cubit.confirmPasswordController,
                        onChanged: cubit.updateButtonColor,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cant be empty';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (cubit.newPasswordController.text !=
                              cubit.confirmPasswordController.text) {
                            return 'Confirm password not match with new password';
                          }
                          return null;
                        },
                        obscureText: cubit.isShowConfirm,
                        hintText: 'Enter your new password again',
                        prefixIcon: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.iconConfirm();
                          },
                          icon: cubit.isShowConfirm
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccessfully) {
              IconSnackBar.show(
                  context: context,
                  snackBarType: SnackBarType.save,
                  label: 'Save successfully');
              Navigator.pushNamed(context, AppRouters.passwordChangedPageRoute);
            } else if (state is UpdateProfileError) {
              IconSnackBar.show(
                  context: context,
                  snackBarType: SnackBarType.fail,
                  label: 'Save error');
            }
          },
          builder: (context, state) {
            return state is! UpdateProfileLoading
                ? DefaultElevatedButtonBlue(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        profileCubit.updateProfileNameAndPassword(
                          name: profileCubit.profile[0].name!,
                          password: cubit.newPasswordController.text,
                        );
                      }
                    },
                    text: "Reset Password",
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.baseColor)),
                  )
                : const CircularProgressIndicator();
          },
        ));
  }
}
