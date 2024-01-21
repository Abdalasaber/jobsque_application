import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/widget/default_elevated_button_blue.dart';
import 'package:sizer/sizer.dart';

import '../../../app_route/app_route.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class ApplySuccessfullyScreen extends StatelessWidget {
  const ApplySuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
      elevation: 0.0,
      title:
      Padding(
        padding: EdgeInsets.only(left: 25.w),
          child:
          DefaultText(
            text: 'Apply Job',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppTheme.black,
          ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/Ilustration.svg"),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultText(
                    text: 'Your data has been successfully sent',
                    textAlign: TextAlign.center,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  DefaultText(
                    text:
                    'You will get a message from our team, about the announcement of employee acceptance',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
      DefaultElevatedButtonBlue(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouters.layoutPageRoute, (route) => false);
        },
        text: "Back to home",
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)),
      ),
    );
  }
}
