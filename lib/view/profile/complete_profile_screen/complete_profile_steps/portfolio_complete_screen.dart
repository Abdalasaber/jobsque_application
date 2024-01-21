import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/view/profile/complete_profile_screen/complete_profile_steps/upload_file_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../../../widget/default_elevated_button_blue.dart';
import '../../../../../widget/default_text.dart';
import '../../../../styles/color.dart';
import '../../../apply_now/portfolio_builder.dart';

class PortfolioCompleteScreen extends StatefulWidget {
  const PortfolioCompleteScreen({super.key});

  @override
  State<PortfolioCompleteScreen> createState() => _PortfolioCompleteScreenState();
}

class _PortfolioCompleteScreenState extends State<PortfolioCompleteScreen> {
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
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
              text: 'Personal Details',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(text:
                    'Add portfolio here',
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                color: AppTheme.black,
                    ),
                  SizedBox(height: 2.h),
                  const UploadFile(target: 'CV',),
                  SizedBox(height: 1.h),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return cubit.selectedCVFile != null
                        ?
                      PortfolioBuilder
                        (
                        text: cubit.selectedCVFile!
                                .path
                                .split('/')
                                .last,
                              size: ((cubit.selectedCVFile!.lengthSync()) / 1024 /
                                  1024).toStringAsFixed(2),
                              selectedFile: cubit.selectedCVFile!,):
                      const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is AddProfileItemCompleteProfileSuccess) {
                    IconSnackBar.show(
                        context: context,
                        snackBarType: SnackBarType.save,
                        label: 'Success');
                    Navigator.pop(context);
                  } else if (state is AddProfileItemCompleteProfileError) {
                    IconSnackBar.show(
                        context: context,
                        snackBarType: SnackBarType.fail,
                        label: 'There something wrong, Try Again');
                  }
                },
                builder: (context, state) {
                  return DefaultElevatedButtonBlue(
                      onPressed: () {
                          cubit.addProfileItem('Portfolio');
                      },
                      text:'Save',
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),),
                      backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)
                  ),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
