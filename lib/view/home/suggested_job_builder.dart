import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/styles/color.dart';
import 'package:sizer/sizer.dart';
import '../../model/job_model/job_data_model.dart';
import '../../widget/default_text.dart';
import 'jop_type_time_builder.dart';

class SuggestedJobBuilder extends StatelessWidget {
  final JobDataModel jobDataModel;
  // final Widget icon;
  // final void Function() onPressed;
  const SuggestedJobBuilder({
    super.key,
    // required this.recentJobModel,
    required this.jobDataModel,
    // required this.icon,required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.suggestedCard,
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: AppTheme.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Image.network(jobDataModel.image!)),
                title: DefaultText(
                  text: jobDataModel.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white,
                ),
                subtitle: Row(
                  children: [
                    DefaultText(
                      text: jobDataModel.compName!,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white_2,
                    ),
                    Expanded(
                      child: DefaultText(
                        text: "• ${jobDataModel.location!}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white_3,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Iconsax.archive_minus,
                    color: AppTheme.white, size: 4.h),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  JopTypeTimeBuilder(
                    text: jobDataModel.jobTimeType!,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  JopTypeTimeBuilder(
                    text: jobDataModel.jobType!,
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // DefaultText(text:
                  // widget.jobData.salary!,
                  // // widget.recentJobModel.salary,
                  //   fontSize: 19.sp,
                  //   // color: widget.recentJobModel.colorText!,
                  // ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${jobDataModel.salary!}',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '/Month',
                          style: TextStyle(
                            color: AppTheme.white.withOpacity(0.5),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // DefaultText(
                  //     text:
                  //     widget.jobData.jobTimeType!,
                  //     // widget.recentJobModel.time,
                  //     fontSize: 10.sp,
                  //     color: const Color(0xff848CBC)
                  // ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                      height: 6.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppTheme.baseColor,
                      ),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouters.jobDetailsPageRoute,
                                    arguments: jobDataModel);
                              },
                              child: DefaultText(
                                text: 'Apply now',
                                color: AppTheme.white,
                                fontSize: 14.sp,
                              )))),
                ],
              ),
            ],
          )),
    );
  }
}
