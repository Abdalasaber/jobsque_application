import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/enums.dart';
import 'package:jobsque/model/general_others_model/profile_model.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../local_database/cache_helper.dart';
import '../../styles/color.dart';
import '../../widget/default_header_star.dart';
import '../../widget/default_text.dart';
import 'general_page/general_builder.dart';
import 'others_page/others_builder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whitBlue,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.layoutPageRoute);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),actions: [
        IconButton(
          onPressed: () {
            CashHelper.removeCacheKey(key: MyKeyCache.token).then((value) {
              Navigator.pushNamedAndRemoveUntil(context, AppRouters.loginPageRoute,(route) => false);
              IconSnackBar.show(
                  context: context,
                  snackBarType: SnackBarType.save,
                  label: 'Logout successfully');
            });

          },
          icon: const Icon(
            Iconsax.logout_1,
            color: AppTheme.red,
          ),
        ),
      ],
        title: Center(
          child: DefaultText(
            text: 'Profile',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 20.h,
                  width: 150.w,
                  color: AppTheme.whitBlue,
                ),
                Positioned(
                    top: 12.h,
                    child: CircleAvatar(
                      radius: 6.5.h,
                      backgroundColor: AppTheme.transparent,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            BlocConsumer<ProfileCubit, ProfileState>(
                              listener: (context,state){
                                if(state is PickImageSuccess){
    IconSnackBar.show(
    context: context,
    snackBarType: SnackBarType.save,
    label:
    'Image Updated Successfully');
    Navigator.pop(context);
    }
                                else if(state is PickImageError){
                                  if(state is PickImageSuccess){
    IconSnackBar.show(
    context: context,
    snackBarType: SnackBarType.fail,
    label:
    'There something wrong, Try Again');
                                      }
                                }
                              },
                              builder: (context, state) {
                                if(state is PickImageLoading){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                else{
                                  return InkWell(
                                    onTap: () {
                                      cubit.pickAndSaveProfileImage();
                                    },
                                    child: Container(
                                      width: 26.5.w,
                                      height: 13.5.h,
                                      decoration:  ShapeDecoration(
                                        image: cubit.savedImage != null
                                            ? DecorationImage(
                                          image: FileImage(cubit.savedImage!),
                                          fit: BoxFit.fill,
                                        )
                                            : const DecorationImage(
                                          image: NetworkImage(
                                              "https://icons-for-free.com/iconfiles/png/512/man+person+profile+user+icon-1320073176482503236.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: const OvalBorder(
                                          side: BorderSide(width: 2, color: AppTheme.black26),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const Icon(
                              Iconsax.camera,
                              color: AppTheme.white,
                            ),
                          ],
                        ),
                      ),
                      ),
                    ),
        ]
      ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Center(
                      child:
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (cubit.profile.isNotEmpty) {
                            return DefaultText(
                              text:
                              cubit.profile[0].name!,
                                fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.black
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      )),
                  SizedBox(height: 3.h),
                  Container(
                    height: 12.1.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.personalColor),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
                      child: Row(
                        children: [
                          SizedBox(width: 5.w),
                          Column(
                            children: [
                              DefaultText(
                                  text: 'Applied',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                              SizedBox(height: 1.h),
                              DefaultText(
                                  text: '46',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                            ],
                          ),
                          SizedBox(width: 3.w),
                          const VerticalDivider(
                            thickness: 2,
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            children: [
                              DefaultText(
                                  text: 'Reviewed',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                              SizedBox(height: 1.h),
                              DefaultText(
                                  text: '46',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                            ],
                          ),
                          SizedBox(width: 3.w),
                          const VerticalDivider(
                            thickness: 2,
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            children: [
                              DefaultText(
                                  text: 'Contacted',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                              SizedBox(height: 1.h),
                              DefaultText(
                                  text: '46',
                                  fontSize: 15.sp,
                                  color: AppTheme.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                          text: 'About',
                          fontSize: 14.sp,
                          color: AppTheme.grey),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, AppRouters.editDetailsPageRoute);
                        },
                        child: DefaultText(
                            text: 'Edit',
                            fontSize: 14.sp,
                            color: AppTheme.blueAccent),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),

    BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
    if (cubit.profile.isNotEmpty) {
    return Center(
    child: DefaultText(
    text:
    'My name ${cubit.profile[0].name!}  and this is my profile',
        // "and i am a ${cubit.profileDetails[0].interestedWork!}",
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppTheme.black26
    ),
        );}
    else {
      return const Center(child: CircularProgressIndicator());
    }
    },
    ),
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            const DefaultHeaderStart(
              text: 'General',
            ),
            SizedBox(height: 3.h,),
            Column(
              children: [
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                      separatorBuilder: (context,index)=>Divider(
                        height: 4.h,
                        color: AppTheme.black,
                        indent: 5.w,
                        endIndent: 7.w,
                      ),
                      itemCount: itemProfileModel.length,
                      itemBuilder: (context,index){
                        return GeneralProfileBuilder(profileModel: itemProfileModel[index],
                        );
                      }),
                ),
                SizedBox(height: 1.h,),
                const DefaultHeaderStart(
                  text: 'Others',
                ),
                SizedBox(height: 3.h,),
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                      separatorBuilder: (context,index)=>Divider(
                        height: 4.h,
                        color: AppTheme.black,
                        indent: 5.w,
                        endIndent: 7.w,
                      ),
                      itemCount: itemOthers.length,
                      itemBuilder: (context,index){
                        return OthersBuilder(profileModel: itemOthers[index],
                        );
                      }),
                ),
                SizedBox(height: 3.h,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
