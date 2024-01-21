import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/view/home/recent_builder.dart';
import 'package:jobsque/view/home/suggested_job_builder.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../shimmer/shimmer_container_effect.dart';
import '../../shimmer/shimmer_recent_job.dart';
import '../../shimmer/shimmer_suggested_job.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import '../../widget/default_search_bar.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  // final String? name;

  const HomeScreen({super.key, 
    // this.name
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;
  late ProfileCubit profileCubit;
  final searchController = TextEditingController();

  @override
  void initState() {
    cubit = HomeCubit.get(context);
    profileCubit = ProfileCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            if (profileCubit.profile.isNotEmpty) {
                              return
                                DefaultText(
                                  text: 'Hi, ${profileCubit.profile[0].name}',
                                  // text: 'Hi, ${widget.name}',
                                  fontSize: 20.sp,
                                  color: AppTheme.black,
                                );
                            }
                            else {
                                  return ShimmerContainerEffect(
                              height: 1.2.h,
                              width: MediaQuery.of(context).size.width / 2.5,
                            );
                            }
                          }),
                        DefaultText(
                          text: 'Create a better future for yourself here',
                          fontSize: 10.sp,
                          color: AppTheme.black,
                        ),
                      ],
                    ),
                    Container(
                      height: 8.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.white_2),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: CircleAvatar(
                          radius: 4.h,
                          backgroundColor: AppTheme.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const NotificationScreen()));
                            },
                            icon: const Icon(Iconsax.notification),
                            color: AppTheme.black,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                DefaultSearchBar(
                    keyboardType: TextInputType.none,
                    onTap: () {
                      Navigator.pushNamed(context, AppRouters.searchPageRoute);
                    },
                    searchController: cubit.searchController,
                    hintText: "Search...."),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 15.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.whitBlue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0.h),
                    child: ListTile(
                      leading: Image.asset('assets/images/Twitter Logo.png'),
                      title: DefaultText(
                        text: 'Twitter',
                        fontSize: 15.sp,
                        color: AppTheme.black,
                      ),
                      subtitle: DefaultText(
                        text: 'Waiting to be selected by the twitter team',
                        maxLines: 2,
                        fontSize: 10.sp,
                        color: AppTheme.black,
                      ),
                      trailing: Container(
                        height: 5.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.greenAccent,
                        ),
                        child: Center(
                            child:
                          DefaultText(
                            //   text: 'Submitted',
                            //   fontSize: 10.sp,
                            //   color: const Color(0xff1939B7),
                              text: 'Accepted',
                              fontSize: 10.sp,
                              color: AppTheme.toggleActive,
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: 'Suggested Job',
                      fontSize: 18.sp,
                      color: AppTheme.deepBlue,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: DefaultText(
                        text: 'View all',
                        fontSize: 10.sp,
                        color: AppTheme.baseColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return cubit.recentJobsData.isNotEmpty ?
                    SizedBox(
                      height: 35.h,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2.5.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.suggestJobsData.length,
                          itemBuilder: (context, index) {
                            return SuggestedJobBuilder(
                              jobDataModel: cubit.suggestJobsData[index],
                            );
                          }),
                    ) :
                    const ShimmerSuggestedJob();
                    },
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      text: 'Recent Job',
                      fontSize: 18.sp,
                      color: AppTheme.deepBlue,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: DefaultText(
                        text: 'View all',
                        fontSize: 10.sp,
                        color: AppTheme.baseColor,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return cubit.recentJobsData.isNotEmpty ?
                      ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              Divider(
                                height: 2.h,
                              ),
                          itemCount:
                          cubit.recentJobsData.length,
                          itemBuilder: (context, index) {
                            return RecentJobBuilder(
                              jobDataModel:
                              cubit.recentJobsData[index],
                            );
                          }
                      ) :
                      const ShimmerRecentJob();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
