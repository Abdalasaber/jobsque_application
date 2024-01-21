import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';
import '../../../../cubit/register_cubit/register_cubit.dart';
import '../../../../widget/default_elevated_button_blue.dart';
import '../../../../widget/default_text.dart';
import '../../styles/color.dart';
import 'interested_work_builder.dart';

class InterestedWorkScreen extends StatefulWidget {
  const InterestedWorkScreen({Key? key}) : super(key: key);

  @override
  State<InterestedWorkScreen> createState() => _InterestedWorkScreenState();
}

class _InterestedWorkScreenState extends State<InterestedWorkScreen> {
  List interestedWorkTypeList = [
    ["UI/UX Designer", Iconsax.bezier],
    ["Illustrator Designer", Iconsax.pen_tool],
    ["Developer", Iconsax.code],
    ["Management", Iconsax.graph],
    ["Information Technology", Iconsax.monitor_mobbile],
    ["Research and Analytics", Iconsax.cloud_add],
  ];

  late RegisterCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'What type of work are you interested in?',
                      maxLines: 2,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.black,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DefaultText(
                      text:
                          'Tell us what you’re interested in so we can customise the app for your needs.',
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.subText,
                    ),
                    SizedBox(
                      height: 3.6.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.1,
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.4.w,
                              mainAxisSpacing: 2.h,
                            ),
                            itemCount: interestedWorkTypeList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InterestedWorkBuilder(
                                  text: interestedWorkTypeList[index][0],
                                  icon: interestedWorkTypeList[index][1]);
                            });
                      }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DefaultElevatedButtonBlue(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const PreferredLocationScreen()));
                    Navigator.pushNamed(context, AppRouters.preferredLocationPageRoute);
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
