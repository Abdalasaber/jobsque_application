import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_acc.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_form_field_login.dart';
import '../../widget/default_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit cubit;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = LoginCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CashHelper.putString(
                  key: MyKeyCache.token,
                  value: LoginCubit.get(context).loginModel?.token)
              .then((value) {
            CashHelper.putString(
                    key: MyKeyCache.userId,
                    value:
                        LoginCubit.get(context).loginModel?.user?.id.toString())
                .then((value) {
              Navigator.pushNamedAndRemoveUntil(context, AppRouters.layoutPageRoute, (route) => false);
              CashHelper.putString(
                  key: MyKeyCache.rememberMe, value: '${cubit.isChecked}');
            });
          });
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.save,
              label: 'Login successfully');
        }
        if (state is LoginErrorState) {
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.fail,
              label: 'Login failed!');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.transparent,
            elevation: 0,
            actions: [
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SvgPicture.asset("assets/images/Logo (1).svg"),
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultText(
                      text: 'Login',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.black,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const DefaultText(
                      text: 'Please login to find your dream job',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.subText,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return DefaultFormFieldLogin(
                          focusNode: cubit.usernameFocus,
                          controller: cubit.usernameController,
                          onChanged: cubit.updateButtonColor,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username cant be empty';
                            }
                            return null;
                          },
                          hintText: 'Email',
                          prefixIcon: const Icon(Iconsax.sms),
                          prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormFieldLogin(
                      focusNode: cubit.passwordFocus,
                      controller: cubit.passwordController,
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
                      hintText: 'Password',
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
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: AppTheme.baseColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            value: cubit.isCheck,
                            onChanged: (newCheck) {
                              cubit.checkButton(newCheck);
                            }),
                        const DefaultText(
                          text: "Remember me",
                          fontSize: 15,
                          color: AppTheme.black,
                        ),
                        SizedBox(
                          width: 21.3.w,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouters.resetPasswordPageRoute);
                          },
                          child: const DefaultText(
                            text: "Forgot Password?",
                            fontSize: 15,
                            color: AppTheme.blue,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const DefaultText(
                          text: "Don’t have an account?",
                          fontSize: 15,
                          color: AppTheme.subText,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouters.registerPageRoute);
                            },
                          child: const DefaultText(
                            text: "Register",
                            fontSize: 15,
                            color: AppTheme.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    DefaultElevatedButtonBlue(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(
                              email: cubit.usernameController.text,
                              password: cubit.passwordController.text);
                          CashHelper.putString(
                              key: MyKeyCache.email,
                              value: cubit.usernameController.text);
                          CashHelper.putString(
                              key: MyKeyCache.password,
                              value: cubit.passwordController.text);
                        }
                      },
                      text: "Login",
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(cubit.buttonColor)),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Visibility(
                        visible: state is LoginLoadingState,
                        child: Center(
                          child: Column(
                            children: [
                              const CircularProgressIndicator(
                                color: AppTheme.base2,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: DefaultText(
                            text: 'Or Login With Account',
                            color: AppTheme.subText,
                          ),
                        ),
                        Divider(
                          height: 20,
                          color: AppTheme.dividerLine,
                          endIndent: 380,
                        ),
                        Divider(
                          height: 20,
                          color: AppTheme.dividerLine,
                          indent: 380,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultElevatedButtonAccount(
                          onPressed: () {},
                          text: 'Google',
                          image:
                              const AssetImage('assets/images/google(1).png'),
                        ),
                        DefaultElevatedButtonAccount(
                          onPressed: () {},
                          text: 'Facebook',
                          image: const AssetImage('assets/images/Facebook.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}