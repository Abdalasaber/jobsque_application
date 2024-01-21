import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/view/save/save_builder.dart';
import 'package:sizer/sizer.dart';
import '../../app_route/app_route.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import '../../widget/default_header.dart';


class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = HomeCubit.get(context);
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
          padding: EdgeInsets.only(left: 25.0.w),
          child: DefaultText(
            text: 'Saved',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    DefaultHeader("${cubit.favouriteItems.length} Job Saved"),
                      cubit.favouriteItems.isNotEmpty?
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: SizedBox(
                                    height: 150.h,
                                    width: 190.w,
                                    child: ListView.separated(
                                      separatorBuilder: (BuildContext context, int index) =>
                                      const Divider(indent: 24.0, endIndent: 24.0),
                                      itemCount: cubit.favouriteItems.length,
                                      itemBuilder: (context, int index) {
                                        return
                                          SaveBuilder(favouriteData: cubit.favouriteItems[index],
                                            jobDataModel: cubit.recentJobsData[index],
                                          );
                                      }
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Image.asset('assets/images/no_message-archived.png'),
                              SizedBox(
                                height: 2.h,
                              ),
                              DefaultText(
                                text: 'Nothing has been saved yet',
                                fontSize: 20.sp,
                                maxLines: 1,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.black,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const DefaultText(
                                text:
                                'Press the star icon on the job you want to save.',
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.subText,
                                maxLines: 2,
                              ),
                            ]),
                      )
                  ],
                );
              },
            ),
      ),
    );
  }


}

