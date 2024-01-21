import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../app_route/app_route.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';

class PasswordChangedSuccessfullyScreen extends StatelessWidget {
  const PasswordChangedSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset('assets/images/Password Succesfully Ilustration.png'),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'Password changed',
              fontSize: 30.sp,
              maxLines: 2,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            DefaultText(
              text: 'successfully!',
              fontSize: 30.sp,
              maxLines: 2,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 3.h,
            ),
            const DefaultText(
              text:
                  'Your password has been changed successfully, we will let you know if there are more problems',
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
              maxLines: 3,
            ),
            const DefaultText(
              text: 'with your account',
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
              maxLines: 3,
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultElevatedButtonBlue(
              onPressed: () {
                Navigator.pushNamed(context, AppRouters.loginPageRoute);
              },
              text: 'Login',
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.baseColor)),
            ),
          ],
        ),
      ),
    );
  }
}
