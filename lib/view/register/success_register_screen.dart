import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 13.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "assets/images/Success Account Ilustration.svg"),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'Your account has been set up!',
              maxLines: 2,
              textAlign: TextAlign.center,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: 'We have customized feeds according to your preferences',
              maxLines: 2,
              textAlign: TextAlign.center,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.black,
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton:
      DefaultElevatedButtonBlue(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouters.loginPageRoute, (route) => false);
        },
        text: "Get Started",
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor:
            MaterialStateProperty.all(AppTheme.baseColor)),
      ),
    );
  }
}
