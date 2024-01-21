import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/view/applied_job/applied_active_screen.dart';
import 'package:jobsque/view/applied_job/applied_rejected_screen.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/applied_cubit/applied_cubit.dart';
import '../../styles/color.dart';
import '../../widget/default_header_star.dart';
import '../../widget/default_text.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({super.key});

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
  PageController pageController = PageController();

  late AppliedCubit cubit;
  @override
  void initState() {
    cubit = AppliedCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.layoutPageRoute);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 17.5.w),
          child: DefaultText(
            text: 'Applied Job',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AppliedCubit, AppliedState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 3.h),
                  child: Column(
                    children: [
                      cubit.tabToggleSwitch(),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: tabOnToggleShow(),
                    ),
                    BlocBuilder<AppliedCubit, AppliedState>(
                      builder: (context, state) {
                        return DefaultHeaderStart(
                            text:("${cubit.appliedJobsData.length} Jobs")
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  tabOnToggleShow() =>
      cubit.tabIndexBasicToggle.value == 0
      ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child:
        PageView(
          controller: pageController,
          children: const [
            AppliedActiveScreen(),
            AppliedRejectedScreen()
          ],
          onPageChanged: (index) {
            cubit.changeIndex(index);
          },
        ),
      )
      : cubit.tabIndexBasicToggle.value == 1
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/no_rejected.png'),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultText(
                    text: 'No applications were',
                    fontSize: 23.sp,
                    maxLines: 1,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                  DefaultText(
                    text: 'rejected',
                    fontSize: 23.sp,
                    maxLines: 2,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const DefaultText(
                    text: 'If there is an application that is rejected by',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.subText,
                    maxLines: 1,
                  ),
                  const DefaultText(
                    text: ' the company it will appear here',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.subText,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          : const DefaultText(text: 'text');
}
