import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../app_route/app_route.dart';
import '../../../cubit/home_cubit/home_cubit.dart';
import '../../../cubit/job_cubit/job_cubit.dart';
import '../../../model/job_model/job_data_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_elevated_button_blue.dart';
import '../../../widget/default_text.dart';
import 'job_description_screen.dart';
import '../../home/jop_type_time_builder.dart';
import 'job_people_screen.dart';
import 'jop_info_company_screen.dart';

class JobDetailsScreen extends StatefulWidget {
  final JobDataModel jobDataModel;

  const JobDetailsScreen({Key? key, required this.jobDataModel})
      : super(key: key);

  @override
  State<JobDetailsScreen> createState() => JopDetailsScreen();
}

class JopDetailsScreen extends State<JobDetailsScreen> {
  late HomeCubit homeCubit;
  late JobCubit jobCubit;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobCubit = JobCubit.get(context);
    homeCubit = HomeCubit.get(context);
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
            padding: EdgeInsets.only(left: 18.0.w),
            child: DefaultText(
              text: 'Job Detail',
              fontSize: 20.sp,
              color: AppTheme.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      homeCubit.handleFavourite(widget.jobDataModel);
                    },
                    icon: homeCubit.checkFavourite(widget.jobDataModel.id)
                        ? Transform.translate(
                            offset: Offset(1.5.h, 0),
                            child: const Icon(
                              Iconsax.archive_minus5,
                              color: AppTheme.baseColor,
                            ),
                          )
                        : const Icon(
                            Iconsax.archive_minus,
                            color: AppTheme.black,
                          ));
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.jobDataModel.image!,
                height: 18.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultText(
                text: widget.jobDataModel.name!,
                textAlign: TextAlign.center,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.black,
              ),
              SizedBox(
                height: 1.h,
              ),
              DefaultText(
                text:
                    '${widget.jobDataModel.compName} • ${widget.jobDataModel.location} ',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.black,
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultText(
                text: '\$${widget.jobDataModel.salary}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.black,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JopTypeTimeBuilder(
                    text: widget.jobDataModel.jobTimeType!,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  JopTypeTimeBuilder(
                    text: widget.jobDataModel.jobType!,
                  ),
                  // JopTypeTimeBuilder(
                  //   text: widget.jobData.jobLevel!,
                  // ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              jobCubit.tabToggle(),
              BlocBuilder<JobCubit, JobState>(
                builder: (context, state) {
                  return tabOnToggle();
                },
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: DefaultElevatedButtonBlue(
        onPressed: () {
          Navigator.pushNamed(context, AppRouters.applyJobStepPageRoute,
              arguments: widget.jobDataModel);
        },
        text: "Apply now",
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)),
      ),
    );
  }

  tabOnToggle() => jobCubit.tabIndexBasicToggle.value == 0
      ? JobDescriptionScreen(
          jobDataModel: widget.jobDataModel,
        )
      : jobCubit.tabIndexBasicToggle.value == 1
          ? JobCompanyScreen(
              jobDataModel: widget.jobDataModel,
            )
          : jobCubit.tabIndexBasicToggle.value == 2
              ? JobDetailsPeople()
              // Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              //               child: Column(
              //                   children: [
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         const Column(
              //                           crossAxisAlignment: CrossAxisAlignment.start,
              //                           children: [
              //                             DefaultText(
              //                               text: '6 Employees For',
              //                               color: AppTheme.black,
              //                             ),
              //                             DefaultText(
              //                               text: 'UI/UX Design',
              //                               color: AppTheme.black,
              //                             ),
              //                           ],
              //                         ),
              //                         DropdownButton(
              //                           underline: const DefaultText(
              //                             text: '',
              //                           ),
              //                           // isExpanded: true,
              //                           value: jobCubit.dropDownValue,
              //                           icon: const Icon(Icons.keyboard_arrow_down),
              //                           items: jobCubit.items.map((String items) {
              //                             return DropdownMenuItem(
              //                               value: items,
              //                               child: Text(items),
              //                             );
              //                           }).toList(),
              //                           onChanged: (String? newValue) {
              //                             jobCubit.change(newValue!);
              //                             // setState(() {
              //                             //   cubit.dropDownValue = newValue!;
              //                             // });
              //                           },
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: 3.5.h,
              //                     ),
              //                     const Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                          DefaultText(
              //                           text: 'image',
              //                           color: AppTheme.black,
              //                         ),
              //                         Column(
              //                           crossAxisAlignment: CrossAxisAlignment.start,
              //                           children: [
              //                             DefaultText(
              //                               text: 'name:Dimas Adi Saputro',
              //                               color: AppTheme.black,
              //                             ),
              //                             DefaultText(
              //                               text: 'UI/UX Design',
              //                               color: AppTheme.black,
              //                             ),
              //                           ],
              //                         ),
              //                         Column(
              //                           crossAxisAlignment: CrossAxisAlignment.start,
              //                           children: [
              //                             DefaultText(
              //                               text: 'work',
              //                               color: AppTheme.black,
              //                             ),
              //                             DefaultText(
              //                               text: 'years',
              //                               color: AppTheme.black,
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       height: 2.h,
              //                     ),
              //                   ],
              //                 ),
              //             )
              : const DefaultText(text: 'non', fontSize: 20);
}
