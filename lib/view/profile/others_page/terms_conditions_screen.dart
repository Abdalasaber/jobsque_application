import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10.0.w),
          child: DefaultText(
            text: 'Terms & Conditions',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 1.h),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultText(
              text: 'Lorem ipsum dolor',
              fontSize: 18.sp,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            DefaultText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
              maxLines: 11,
              fontSize: 11.sp,
              color: AppTheme.subText,
            ),
                SizedBox(
                  height: 1.5.h,
                ),

                DefaultText(
              text: 'Lorem ipsum dolor',
              fontSize: 18.sp,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            DefaultText(
              text: 'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              ,maxLines: 3,
              fontSize: 11.sp,
              color: AppTheme.subText,
            ),
                SizedBox(height: 1.5.h,),
                Container(
                  height: 22.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.white,
                  ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 3.h),
                      child: DefaultText(text: 'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.'
                        ,maxLines: 6,fontSize: 11.sp,color: AppTheme.black,),
                    ),
                  ),
                SizedBox(
                  height: 1.5.h,
                ),
                DefaultText(
                  text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.'
                  ,maxLines: 4,
                  fontSize: 11.sp,
                  color: AppTheme.subText,
                ),

            ]),
        ),
      ),
    );
  }
}
