import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_acc.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_form_field_login.dart';
import '../../widget/default_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterCubit cubit;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RegisterSuccessState) {
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.save,
              label: 'Register successfully');
          Navigator.pushNamed(context, AppRouters.interestedWorkScreenPageRoute);
        } else if (state is RegisterErrorState) {
          IconSnackBar.show(
              context: context,
              snackBarType: SnackBarType.fail,
              label: 'Register failed!');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRouters.loginPageRoute),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: AppTheme.black,
              )),
          actions: [
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset('assets/images/Logo.png'),
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText(
                        text: 'Create Account',
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const DefaultText(
                        text: 'Please create an account to find your dream job',
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.subText,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormFieldLogin(
                        focusNode: cubit.usernameFocus,
                        controller: cubit.userNameController,
                        onChanged: cubit.updateButtonColor,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username cant be empty';
                          }
                          return null;
                        },
                        hintText: 'Username',
                        prefixIcon: const Icon(Iconsax.user),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormFieldLogin(
                        focusNode: cubit.emailFocus,
                        controller: cubit.emailController,
                        onChanged: cubit.updateButtonColor,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cant be empty';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        hintText: 'Email',
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                        prefixIcon: const Icon(Iconsax.sms),
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
                            return 'Password must be at least 8 characters';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        obscureText: cubit.isShow,
                        hintText: 'Password',
                        helperText: 'Password must be at least 8 characters',
                        helperStyle: TextStyle(
                          color: (cubit.passwordController.text.isEmpty)
                              ? AppTheme.grey
                              : (cubit.passwordController.text.length <= 7)
                                  ? AppTheme.red
                                  : AppTheme.green,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.deepBlue
                                : AppTheme.white_2),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.iconChang();
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
                        height: 7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const DefaultText(
                            text: "Already have an account?",
                            fontSize: 15,
                            color: AppTheme.subText,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouters.loginPageRoute);
                            },
                            child: const DefaultText(
                              text: "Login",
                              fontSize: 15,
                              color: AppTheme.blue,
                            ),
                          ),
                        ],
                      ),
                      DefaultElevatedButtonBlue(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(
                                name: cubit.userNameController.text,
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text);
                          }
                        },
                        text: 'Create account',
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
                      BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                        return Visibility(
                            visible: state is RegisterLoadingState,
                            child: const Center(
                              child: Column(children: [
                                CircularProgressIndicator(
                                  color: AppTheme.black,
                                ),
                              ]),
                            ));
                      }),
                      const Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: DefaultText(
                              text: 'Or Sign up With Account',
                              color: AppTheme.subText,
                            ),
                          ),
                          Divider(
                            height: 20,
                            color: AppTheme.subText,
                            endIndent: 380,
                          ),
                          Divider(
                            height: 20,
                            color: AppTheme.subText,
                            indent: 380,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
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
                            image:
                                const AssetImage('assets/images/Facebook.png'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
