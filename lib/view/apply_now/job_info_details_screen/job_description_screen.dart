import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../model/job_model/job_data_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class JobDescriptionScreen extends StatelessWidget {
  final JobDataModel jobDataModel;
  const JobDescriptionScreen({Key? key, required this.jobDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              text: 'Job Description',
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: jobDataModel.jobDescription!,
              textAlign: TextAlign.justify,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
            ),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'Skill Required',
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.h,
            ),
            DefaultText(
              text: jobDataModel.jobSkill!,
              textAlign: TextAlign.justify,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
            ),
          ],
        ),
      ),
    );
  }
}
