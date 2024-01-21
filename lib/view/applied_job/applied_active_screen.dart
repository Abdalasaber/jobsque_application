import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../cubit/applied_cubit/applied_cubit.dart';
import '../../../cubit/home_cubit/home_cubit.dart';
import '../../../shimmer/shimmer_suggested_job.dart';
import '../../styles/color.dart';
import '../apply_now/apply_step/step_circle.dart';
import '../home/recent_builder.dart';

class AppliedActiveScreen extends StatefulWidget {
  const AppliedActiveScreen({Key? key}) : super(key: key);

  @override
  State<AppliedActiveScreen> createState() => _AppliedActiveScreenState();
}

class _AppliedActiveScreenState extends State<AppliedActiveScreen> {
  late AppliedCubit cubit;
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    cubit = AppliedCubit.get(context);
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.5.h,
            width: 90.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.grey),
            ),
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return homeCubit.recentJobsData.isNotEmpty
                        ? SizedBox(
                            height: 16.h,
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 2.5),
                                itemCount: homeCubit.recentJobsData.length,
                                itemBuilder: (context, index) {
                                  return RecentJobBuilder(
                                    jobDataModel:
                                        homeCubit.recentJobsData[index],
                                  );
                                }),
                          )
                        : const ShimmerSuggestedJob();
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 11.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppTheme.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StepCircle(1, "Bio Data", true),
                      StepCircle(2, 'Type of work', true),
                      StepCircle(3, 'Upload portfolio', true, lineState: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
