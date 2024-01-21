import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_route/app_route.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/on_boarding_cubit/on_boarding_cubit.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';
import 'on_boarding_builder.dart';
import '../../model/on_boarding_model/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  TextEditingController pageController = TextEditingController();
  final controller = PageController();
  void finishOn(String screenName, BuildContext context) {
    CashHelper.putBool(key: MyKeyCache.onBoarding, value: isLast);
    Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  // late HomeCubit cubit;
  late OnBoardingCubit cubit;

  @override
  void initState() {
    // cubit = HomeCubit.get(context);
    cubit = OnBoardingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.transparent,
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: SvgPicture.asset("assets/images/Logo (1).svg"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              CashHelper.putString(key: MyKeyCache.onBoarding, value: 'true');
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRouters.loginPageRoute, (route) => false);
            },
            child: DefaultText(
                text: 'Skip', fontSize: 10.sp, color: AppTheme.subText),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == itemOnBoarding.length - 1) {
                      cubit.isTrue();
                    } else {
                      cubit.isFalse();
                    }
                  },
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: itemOnBoarding.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        OnBoardingBuilder(
                          onBoardingModel: itemOnBoarding[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: itemOnBoarding.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thinUnderground,
              activeDotColor: AppTheme.baseColor,
              dotColor: AppTheme.base2,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return cubit.isLast
                  ? DefaultElevatedButtonBlue(
                onPressed: () {
                  finishOn(AppRouters.loginPageRoute, context);
                },
                text: 'Get Started',
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        AppTheme.baseColor)),
              )
                  : DefaultElevatedButtonBlue(
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(microseconds: 1000000),
                      curve: Curves.easeInOut);
                },
                text: 'Next',
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        AppTheme.baseColor)),
              );
            },
          ),
        ],
      ),

    );
  }
}
