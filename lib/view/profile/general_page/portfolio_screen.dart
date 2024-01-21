import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/enums.dart';
import 'package:jobsque/view/profile/general_page/upload_file_profile.dart';
import 'package:sizer/sizer.dart';
import '../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../local_database/cache_helper.dart';
import '../../../styles/color.dart';
import '../../../widget/default_elevated_button_blue.dart';
import '../../../widget/default_text.dart';
import '../../apply_now/portfolio_builder.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
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
            padding: EdgeInsets.only(right: 4.h),
            child: DefaultText(
              text: 'Portfolio',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'Add portfolio here',
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                  SizedBox(height: 2.h),
                  const UploadFileProfile(
                    target: 'CV',
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return cubit.selectedCVFile != null
                          ? PortfolioBuilder(
                              text: cubit.selectedCVFile!.path.split('/').last,
                              size: ((cubit.selectedCVFile!.lengthSync()) /
                                      1024 /
                                      1024)
                                  .toStringAsFixed(2),
                              selectedFile: cubit.selectedCVFile!,
                            )
                          : const SizedBox();
                    },
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
      BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          Navigator.pop(context);
        },
        builder: (context, state) {
          return DefaultElevatedButtonBlue(
            onPressed: () {
              if (cubit.selectedCVFile != null) {
                cubit.addPortofolio();
              }
              if (CashHelper.getString(key: MyKeyCache.completeProfile) ==
                  '') {
                cubit.addItem('Portfolio');
              }
            },
            text: "Save",
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
