import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../model/job_model/job_data_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class JobCompanyScreen extends StatelessWidget {
  final JobDataModel jobDataModel;
  const JobCompanyScreen({Key? key, required this.jobDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              text: 'Contact Us',
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppTheme.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: 'Email',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.black,
                        ),
                        const SizedBox(height: 2),
                        DefaultText(
                          text: jobDataModel.compEmail!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppTheme.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: 'Website',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.black,
                        ),
                        const SizedBox(height: 2),
                        DefaultText(
                          text: jobDataModel.compWebsite!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultText(
              text: 'About Company',
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: jobDataModel.aboutComp!,
              textAlign: TextAlign.justify,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.black,
            )
          ],
        ),
      ),
    );
  }
}
