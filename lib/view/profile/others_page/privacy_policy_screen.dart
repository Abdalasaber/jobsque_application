import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          padding: EdgeInsets.only(left: 15.0.w),
          child: DefaultText(
            text: 'Privacy Policy',
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
            text: 'Your privacy is important',
            fontSize: 18.sp,
            color: AppTheme.black,
            fontWeight: FontWeight.w500,
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
            text:
                'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
            maxLines: 6,
            fontSize: 11.sp,
            color: AppTheme.subText,
          ),
          SizedBox(
            height: 2.h,
          ),
          DefaultText(
            text: 'Data controllers and contract partners',
            maxLines: 2,
            fontSize: 18.sp,
            color: AppTheme.black,
            fontWeight: FontWeight.w500,
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
        ])),
      ),
    );
  }
}
