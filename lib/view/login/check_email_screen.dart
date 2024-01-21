import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.0.h),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Image.asset('assets/images/Email Ilustration.svg'),
            DefaultText(
              text: 'Check your Email',
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 3.h,
            ),

             const DefaultText(
                text: 'We have sent a reset password to your email',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppTheme.subText,
                 maxLines: 2,
            ),
            const DefaultText(
                text: 'address',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppTheme.subText,
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                const DefaultText(text: 'or'),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, AppRouters.loginPageRoute);
                }, child: const DefaultText(text:'login')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton:
          DefaultElevatedButtonBlue(
            onPressed: () {
              Navigator.pushNamed(context, AppRouters.forgetPasswordPageRoute);
            },
            text: 'Open email app',
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),),
                backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)
            ),
          ),
    );
  }
}
