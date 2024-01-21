import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../app_route/app_route.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../../model/country_flag_model/country_flag_model.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';
import 'country_flag_builder.dart';

class PreferredLocationScreen extends StatefulWidget {
  const PreferredLocationScreen({Key? key}) : super(key: key);

  @override
  State<PreferredLocationScreen> createState() => _PreferredLocationScreenState();
}

class _PreferredLocationScreenState extends State<PreferredLocationScreen> {
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Where are you preferred Location?',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.black,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DefaultText(
                      text:
                      'Let us know, where is the work location you want at this time, so we can adjust it.',
                      maxLines: 2,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.subText,
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    ToggleSwitch(
                      minWidth: 44.0.w,
                      cornerRadius: 20.0,
                      activeBgColors: const [
                        [AppTheme.toggleActive],
                        [AppTheme.toggleActive],
                      ],
                      activeFgColor: AppTheme.white,
                      inactiveBgColor: AppTheme.white_2,
                      inactiveFgColor: AppTheme.subText,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: const ['Work From Office', 'Remote Work'],
                      radiusStyle: true,
                    ),
                    SizedBox(
                      height: 2.4.h,
                    ),
                    const DefaultText(
                      text: 'Select the country you want for your job',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.subText,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return Wrap(
                          children: countries
                              .map((country) => CountryFlagBuilder(country))
                              .toList(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                    if (state is DataSuccessfullyState) {
                      Navigator.pushNamed(context, AppRouters.successRegisterPageRoute
                      );
                    }
                    else if (state is DataErrorState) {

                    }
                  },
                      builder: (context, state) {
                    return state is! DataLoadingState?
                       DefaultElevatedButtonBlue(
                        onPressed: () {
                          cubit.userDataSetup();
                        },
                        text: "Next",
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(cubit.buttonColor)),
                      ):
                     const Center(
                          child:
                          CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppTheme.black,
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
