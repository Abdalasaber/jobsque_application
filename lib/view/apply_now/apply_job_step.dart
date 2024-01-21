import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/view/apply_now/apply_step/step_circle.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/apply_now_cubit/apply_now_cubit.dart';
import '../../cubit/job_cubit/job_cubit.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../model/job_model/job_data_model.dart';
import '../../model/type_work_apply_model/type_work_model.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_form_field_login.dart';
import '../../widget/default_phone_field.dart';
import '../../widget/default_text.dart';
import '../profile/complete_profile_screen/complete_profile_steps/upload_file_screen.dart';
import '../profile/general_page/portfolio_builder.dart';
import 'type_work_builder.dart';


class ApplyJobStepScreen extends StatefulWidget {
  final JobDataModel jobDataModel;

  const ApplyJobStepScreen({super.key,required this.jobDataModel});

  @override
  State<ApplyJobStepScreen> createState() => _ApplyJobStepScreenState();
}

class _ApplyJobStepScreenState extends State<ApplyJobStepScreen> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pageController = PageController();

  late ApplyNowCubit cubit;
  late JobCubit cubitJ;
  late ProfileCubit cubitP;

  @override
  void initState() {
    cubit = ApplyNowCubit.get(context);
    cubitJ = JobCubit.get(context);
    cubitP = ProfileCubit.get(context);
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
              padding: EdgeInsets.only(right: 10.0.w),
              child: DefaultText(
                text: 'Apply Job',
                fontSize: 20.sp,
                color: AppTheme.black,
              ),
            )),
      ),

      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 1.h,),
              BlocBuilder<JobCubit, JobState>(
                builder: (context, state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StepCircle(
                          1,
                          "Bio Data",
                          cubitJ.currentStep >= 0,
                        ),
                        StepCircle(
                          2,
                          'Type of work',
                          cubitJ.currentStep >= 1,
                        ),
                        StepCircle(
                            3,
                            'Upload portfolio',
                            cubitJ.currentStep == 2,
                            lineState: false),
                      ]);
                },
              ),
              SizedBox(height: 4.5.h,),
              SizedBox(
                height: 150.h,
                child: PageView(
                    controller: pageController,
                    onPageChanged: (int i) {
                      cubitJ.currentStep = i;
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(text:
                            'Bio data',
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.black,
                            ),
                            DefaultText(
                              text:
                              'Fill in your bio data correctly',
                              color: AppTheme.black26,
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 3.h,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Full Name',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            DefaultFormFieldLogin(
                                controller:
                                usernameController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username cant be empty';
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                hintText: 'Username',
                                prefixIcon: const Icon(Iconsax.user),
                                prefixIconColor: MaterialStateColor
                                    .resolveWith((states) =>
                                states.contains(MaterialState.focused)
                                    ? AppTheme.deepBlue
                                    : AppTheme.white_2,
                                )),
                            SizedBox(height: 2.h,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Email',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            DefaultFormFieldLogin(
                              controller:
                                emailController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email cant be empty';
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                hintText: 'Email',
                                prefixIcon: const Icon(Iconsax.sms),
                                prefixIconColor: MaterialStateColor
                                    .resolveWith((states) =>
                                states.contains(MaterialState.focused)
                                    ? AppTheme.deepBlue
                                    : AppTheme.white_2,
                                )),
                            SizedBox(height: 2.h,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'No.Headphone',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            DefaultPhoneField(
                              controller:
                              phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please enter valid data";
                                }
                                if (value.length < 10) {
                                  return 'Phone must be 11 characters';
                                }
                                else {
                                  return null;
                                }
                              },
                              keyBoardType: TextInputType.number,
                              onChange: (code) {
                                cubit.myCountry = code;
                              },
                              hintText: "PhoneNumber",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text:
                              'Type of work',
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.black,
                              ),
                              SizedBox(height: 1.h,),
                              DefaultText(
                                text:
                                'Fill in your bio data correctly',
                                color: AppTheme.black26,
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 3.h,),
                              SizedBox(
                                height: 60.h,
                                width: 85.w,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                  itemCount: itemTypeWorkModel.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemTypeWorkModel[index].isSelected =
                                          !itemTypeWorkModel[index].isSelected;
                                        });
                                      },
                                      child: TypeWorkBuilderScreen(
                                        typeWorkModel: itemTypeWorkModel[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'Upload Portfolio',
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.black,
                            ),
                            DefaultText(
                              text: 'Fill in your bio data correctly',
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.black,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Upload CV',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h),
                            const UploadFile(
                              target: 'CV',
                            ),
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                return
                                  cubitP.selectedCVFile != null ?
                                  PortfolioBuilder(text: cubitP.selectedCVFile!
                                      .path
                                      .split('/')
                                      .last,
                                    size: ((cubitP.selectedCVFile!.lengthSync()) / 1024 /
                                        1024).toStringAsFixed(2),
                                    selectedFile: cubitP.selectedCVFile!,):
                                  const SizedBox();
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            DefaultText(text:
                              'Other File',
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w500,
                              color: AppTheme.black,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const UploadFile(
                              target: 'Other',
                            ),
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                return
                                  cubitP.selectedOtherFile != null?
                                  PortfolioBuilder
                                    (
                                    text: cubitP.selectedOtherFile!.path.split('/').last,
                                    size:
                                    ((cubitP.selectedOtherFile!.lengthSync()) / 1024 / 1024)
                                        .toStringAsFixed(2),
                                    isImage: true,
                                    selectedFile: cubitP.selectedOtherFile!,
                                  ):
                                const SizedBox();
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ]),
              ),
          SizedBox(
                height: 3.h,
              ),

            ],
          ),
        ),
      ),


      floatingActionButton:
      BlocConsumer<JobCubit, JobState>(
            listener: (context, state) {
              if (state is ApplyForSuccessState) {
                IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.save,
                    label: 'Save successfully');
                Navigator.pushNamed(context, AppRouters.applySuccessfullyPageRoute);
              }
              else if (state is ApplyForErrorState) {
                IconSnackBar.show(
                    context: context,
                    snackBarType: SnackBarType.fail,
                    label: 'Save failed!');
              }
            },
            builder: (context, state) {
              return DefaultElevatedButtonBlue(
              onPressed: () {
                  if (cubitJ.currentStep < 2) {
                    if (formKey.currentState!.validate()) {
                      cubitJ.addStep();
                      pageController.animateToPage(
                        cubitJ.currentStep,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      );
                    }
                  } else {
                    cubitJ.applyForJob(
                      name: usernameController.text,
                      email: emailController.text,
                      mobile: phoneController.text,
                      jobsId: widget.jobDataModel.id.toString(),
                      jobDataModel: widget.jobDataModel,
                    );
                    Navigator.pushNamed(context, AppRouters.applySuccessfullyPageRoute);
                  }
                },
                text: cubitJ.currentStep < 2 ? 'Next' : 'Submit',
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all(AppTheme.baseColor)),
              );
            },
          ),
    );
  }
}

