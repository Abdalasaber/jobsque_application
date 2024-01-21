import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class JobDetailsPeopleTile extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final String yearsOfExp;
  const JobDetailsPeopleTile(
      {Key? key,
      required this.image,
      required this.name,
      required this.job,
      required this.yearsOfExp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image, width: 5.h, height: 5.h),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: name,
            color: AppTheme.deepBlue,
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w500,
          ),
          DefaultText(
            text: 'Work during',
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppTheme.black,
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: job,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppTheme.black,
          ),
          DefaultText(
            text: yearsOfExp,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppTheme.black,
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
