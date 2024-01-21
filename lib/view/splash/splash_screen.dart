import 'dart:async';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/styles/color.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer (const Duration(seconds: 2),
            (){
          final token=CashHelper.getString(key: MyKeyCache.token);
          // final onBoarding=CashHelper.getString(key: MyKeyCache.onBoarding);
          final onBoardingBool=CashHelper.getBoolean(key: MyKeyCache.onBoarding);
          final rememberMe=CashHelper.getString(key: MyKeyCache.rememberMe);
          if(token!.isNotEmpty && rememberMe=='true'){
            Navigator.pushNamedAndRemoveUntil(context, AppRouters.loginPageRoute, (route) => false);
          }
          else if(token!.isNotEmpty && rememberMe=='false'){
            Navigator.pushNamedAndRemoveUntil(context, AppRouters.loginPageRoute, (route) => false);
          }
          // else if(token!.isEmpty && onBoarding=='true'){
          //   Navigator.pushNamedAndRemoveUntil(context, AppRouters.loginPageRoute, (route) => false);
          // }
          else if(token!.isEmpty && onBoardingBool=='true'){
            Navigator.pushNamedAndRemoveUntil(context, AppRouters.loginPageRoute, (route) => false);
          }
          else{
            Navigator.pushNamedAndRemoveUntil(context, AppRouters.onboardPageRoute, (route) => false);
          }
        }
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 97.h,
                  width: 96.h,
                  child:
                  RippleAnimation(
                      repeat: true,
                      color: AppTheme.baseColor,
                      minRadius: 70,
                      ripplesCount: 7,
                      size: Size.zero,
                      child:
                      DelayedDisplay(
                        delay: const Duration(seconds: 0),
                        child:
                        Image.asset('assets/images/Logo.png'),
                      ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
