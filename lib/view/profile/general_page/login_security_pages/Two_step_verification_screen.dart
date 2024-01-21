import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../cubit/login_security_cubit/login_security_cubit.dart';
import '../../../../styles/color.dart';
import '../../../../widget/default_elevated_button_blue.dart';
import '../../../../widget/default_form_field_login.dart';
import '../../../../widget/default_phone_field.dart';
import '../../../../widget/default_text.dart';

class TwoStepVerificationLScreen extends StatefulWidget {
  const TwoStepVerificationLScreen({super.key});

  @override
  State<TwoStepVerificationLScreen> createState() =>
      _TwoStepVerificationLScreenState();
}

class _TwoStepVerificationLScreenState
    extends State<TwoStepVerificationLScreen> {
  late LoginSecurityCubit cubit;
  @override
  void initState() {
    cubit = LoginSecurityCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: DefaultText(
            text: 'Two-step verification',
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: BlocBuilder<LoginSecurityCubit, LoginSecurityState>(
            builder: (context, state) {
              return Column(children: [
                SizedBox(
                  height: 60.h,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        if (index == 4 - 1) {
                          cubit.isLastTrue();

                        } else {
                          cubit.isLastFalse();

                        }
                      },
                      scrollDirection: Axis.horizontal,
                      controller: cubit.controller,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Column(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.unActiveButton),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                      child: Row(
                                        children: [
                                          const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              DefaultText(
                                                text: 'Secure your account with',
                                                color: AppTheme.black,
                                                fontSize: 15,
                                              ),
                                              DefaultText(
                                                text: 'two-step verification',
                                                color: AppTheme.black,
                                                fontSize: 15,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 25.w,
                                          ),
                                          FlutterSwitch(
                                            width: 15.0.w,
                                            toggleColor: AppTheme.white_4,
                                            inactiveColor: AppTheme.unActiveButton,
                                            activeColor: AppTheme.baseColor,
                                            value: cubit.status,
                                            borderRadius: 30.0,
                                            onToggle: (val) {
                                              cubit.onToggle(val);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 4.h,
                                      backgroundColor: AppTheme.whitBlue,
                                      child: const Icon(
                                        Iconsax.lock,
                                        color: AppTheme.baseColor,
                                      ),
                                    ),
                                    title: Column(
                                      children: [
                                        DefaultText(
                                          text:
                                              'Two-step verification provides additional',
                                          maxLines: 3,
                                          fontSize: 11.sp,
                                          color: AppTheme.subText,
                                        ),
                                        DefaultText(
                                          text:
                                              'security by asking for a verification code',
                                          maxLines: 3,
                                          fontSize: 11.sp,
                                          color: AppTheme.subText,
                                        ),
                                        DefaultText(
                                          text:
                                              'every time you log in on another device.',
                                          maxLines: 3,
                                          fontSize: 11.sp,
                                          color: AppTheme.subText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 4.h,
                                      backgroundColor: AppTheme.whitBlue,
                                      child: const Icon(
                                        Iconsax.lock,
                                        color: AppTheme.baseColor,
                                      ),
                                    ),
                                    title: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(
                                            text:
                                                'Adding a phone number or using',
                                            maxLines: 3,
                                            fontSize: 11.sp,
                                            color: AppTheme.subText,
                                          ),
                                          DefaultText(
                                            text:
                                                'an authenticator will help keep your',
                                            maxLines: 3,
                                            fontSize: 11.sp,
                                            color: AppTheme.subText,
                                          ),
                                          DefaultText(
                                            text: 'account safe from harm.',
                                            maxLines: 3,
                                            fontSize: 11.sp,
                                            color: AppTheme.subText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              )
                            : index == 1
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 10.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppTheme.white_4),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                            child: Row(
                                              children: [
                                                const Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    DefaultText(
                                                      text: 'Secure your account with',
                                                      color: AppTheme.black,
                                                      fontSize: 15,
                                                    ),
                                                    DefaultText(
                                                      text: 'two-step verification',
                                                      color: AppTheme.black,
                                                      fontSize: 15,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 25.w,
                                                ),
                                                FlutterSwitch(
                                                  width: 15.0.w,
                                                  toggleColor: AppTheme.white_4,
                                                  inactiveColor: AppTheme.unActiveButton,
                                                  activeColor: AppTheme.baseColor,
                                                  value: cubit.status,
                                                  borderRadius: 30.0,
                                                  onToggle: (val) {
                                                    cubit.onToggle(val);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.h,),
                                        DefaultText(
                                          text: 'Select a verification method',
                                          fontSize: 15.sp,
                                          color: AppTheme.black,
                                        ),
                                        SizedBox(height: 2.h),
                                        Container(
                                          height: 10.h,
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppTheme.unActiveButton),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 2.h),
                                            child:
                                            DropdownButton(
                                              underline: const DefaultText(
                                                text: '',
                                              ),
                                              isExpanded: true,
                                              value: cubit.dropDownValue,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: cubit.items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                cubit.onChanged(newValue);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        DefaultText(
                                          text:
                                              'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                                          maxLines: 4,
                                          fontSize: 11.sp,
                                          color: AppTheme.subText,
                                        ),
                                      ],
                                    ),
                                  )
                            : index == 2 ?
                        Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DefaultText(
                                        text: 'Add phone number',
                                        fontSize: 15.sp,
                                        color: AppTheme.black,
                                      ),
                                      SizedBox(height: 1.h),
                                      DefaultText(
                                        text:
                                            'We will send a verification code to this number',
                                        fontSize: 10.sp,
                                        color: AppTheme.subText,
                                      ),
                                      SizedBox(height: 2.h),
                                      DefaultPhoneField(
                                        keyBoardType: TextInputType.number,
                                        hintText: "PhoneNumber",
                                        controller: cubit.phoneController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "please enter valid data";
                                          }
                                          if (value.length < 10) {
                                            return 'Phone must be 11 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChange: (code) {
                                          cubit.myCountry = code;
                                        },
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      DefaultText(
                                        text: "Enter your new password",
                                        fontSize: 15.sp,
                                        color: AppTheme.black,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DefaultFormFieldLogin(
                                        focusNode: cubit.passwordFocus,
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
                                        obscureText: cubit.isShow,
                                        hintText: 'Password',
                                        prefixIcon: const Icon(Iconsax.lock),
                                        prefixIconColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => states.contains(
                                                        MaterialState.focused)
                                                    ? AppTheme.deepBlue
                                                    : AppTheme.unActiveButton),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.vIcon();
                                          },
                                          icon: cubit.isShow
                                              ? const Icon(Iconsax.eye_slash)
                                              : const Icon(Iconsax.eye),
                                        ),
                                        suffixIconColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => states.contains(
                                                        MaterialState.focused)
                                                    ? AppTheme.deepBlue
                                                    : AppTheme.unActiveButton),
                                      ),
                                    ],
                                  ):
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Enter the 6 digit code',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                            SizedBox(height: 1.h),
                            DefaultText(
                              text:
                              'Please confirm your account by entering the authorization code sen to ****-****-7234',
                              maxLines: 2,
                              fontSize: 12.sp,
                              color: const Color(0xff6B7280),
                            ),
                            SizedBox(height: 5.h),
                            OtpTextField(
                              fieldWidth: 15.w,
                              borderRadius: BorderRadius.circular(10),
                              numberOfFields: 5,
                              borderColor: const Color(0xFF512DA8),
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {
                              },
                            ),
                            SizedBox(height: 3.h),
                            DefaultText(
                              text:
                              'Resend Code',
                              fontSize: 12.sp,
                              color: const Color(0xff6B7280),
                            ),

                          ],
                            );
                      }),
                ),
              ]);
            },
          ),
        ),
      ),
      floatingActionButton: DefaultElevatedButtonBlue(
        onPressed: () {
          if (cubit.currentStep < 3) {
            setState(() {
              cubit.currentStep++;
              cubit.controller.nextPage(
                  duration: const Duration(microseconds: 1000000),
                  curve: Curves.easeInOut);
            });
          }
        },
        text:
        cubit.currentStep < 2 ? 'Next' : cubit.currentStep < 3 ? 'Send Code' : 'Verify',
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff3366FF))),
      ),
    );
  }
}
