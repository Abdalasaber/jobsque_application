import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/cubit/layout_cubit/layout_cubit.dart';
import 'package:jobsque/styles/color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../widget/default_elevated_button_blue.dart';
import '../../../widget/default_text.dart';
import 'complete_profile_steps/personal_details.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late ProfileCubit cubit;
  final searchController = TextEditingController();

  @override
  void initState() {
    cubit = ProfileCubit.get(context);
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
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: DefaultText(
              text: 'Complete Profile',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 1.h),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Column(
                children: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                    return CircularPercentIndicator(
                      radius: 41.5.sp,
                      lineWidth: 8.0,
                      percent:
                          // (itemCompleteProfileSaved.length * 0.25).toDouble(),
                          (cubit.completeProfile.length * 0.25).toDouble(),
                      center: DefaultText(
                        text:
                        // '${itemCompleteProfileSaved.length * 25}%',
                        '${cubit.completeProfile.length * 25}%',
                        textAlign: TextAlign.center,
                        color: AppTheme.baseColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      progressColor: AppTheme.baseColor,
                      circularStrokeCap: CircularStrokeCap.round,
                    );
                  }),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return DefaultText(
                        text:
                        // itemCompleteProfileSaved.length == 4
                        cubit.completeProfile.length == 4
                        ? 'Completed!'
                        :
                        '${cubit.completeProfile.length}/4 Completed',
                        // '${itemCompleteProfileSaved.length}/4 Completed',
                    fontSize: 15.sp,
                    color: AppTheme.baseColor,
                  );}),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return
                        PersonalDetailsScreen(
                        title: 'Personal Details',
                        subtitle:
                        'Full name, email, phone number, and your address',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouters.editDetailsPageRoute
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return PersonalDetailsScreen(
                        title: 'Education',
                        subtitle: 'Enter your educational history to be considered by the recruiter',
                        // index < cubit.completeProfile.length
                        //     ? const Color(0xffE0EBFF)
                        //     : Colors.white,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouters.educationPageRoute
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return PersonalDetailsScreen(
                        title: 'Experience',
                        subtitle:
                        'Enter your work experience to be considered by the recruiter',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouters.experiencePageRoute
                          );
                        },
                      );
                    },
                  ),BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return PersonalDetailsScreen(
                        title: 'Portfolio',
                        subtitle:
                        'Create your portfolio. Applying for various types of jobs is easier.',
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouters.portfolioCompletePageRoute
                          );
                        },
                      );
                    },
                  ),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Visibility(
                        visible: cubit.completeProfile.length == 4,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: DefaultElevatedButtonBlue(
                              onPressed: () {
                              LayoutCubit.get(context).getCompleteProfile();
                              Navigator.pushNamedAndRemoveUntil(context, AppRouters.layoutPageRoute, (route) => false);
                            },
                              text: "Save",
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),),
                                  backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)
                              ),
                            ),
                            ),
                          ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
