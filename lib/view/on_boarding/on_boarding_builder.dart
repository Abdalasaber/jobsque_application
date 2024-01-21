import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../model/on_boarding_model/on_boarding_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

class OnBoardingBuilder extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnBoardingBuilder({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            onBoardingModel.image,
            fit: BoxFit.cover,
            width: 100.w,
          ),
          SizedBox(
            height: 0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: onBoardingModel.text,
                      style: TextStyle(color: AppTheme.black, fontSize: 25.sp),
                    ),
                    TextSpan(
                        text: onBoardingModel.textAnotherColor,
                        style: TextStyle(
                            color: AppTheme.baseColor, fontSize: 25.sp)),
                    TextSpan(
                        text: onBoardingModel.textFirstColor,
                        style: TextStyle(color: AppTheme.black, fontSize: 25.sp)),
                  ]),
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: DefaultText(
              text: onBoardingModel.subText,
              color: AppTheme.subText,
              fontSize: 13.5.sp,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
