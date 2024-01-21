import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../model/job_model/job_data_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import 'bottom_sheet_builder.dart';

class SaveBuilder extends StatefulWidget {
  // RecentJobModel recentJobModel;
  final JobDataModel jobDataModel;
  final FavouriteData favouriteData;
  const SaveBuilder({super.key, required this.favouriteData,required this.jobDataModel});

  @override
  State<SaveBuilder> createState() => _SaveBuilderState();
}

class _SaveBuilderState extends State<SaveBuilder> {
  late HomeCubit cubit;
  @override
  void initState() {
    cubit = HomeCubit.get(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(widget.favouriteData.image!,
              width: 11.w, height: 5.h),
          title: DefaultText(
            text: widget.favouriteData.jobs!.name!,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppTheme.deepBlue,
          ),
          subtitle: Row(
            children: [
              DefaultText(
                text: widget.favouriteData.jobs!.compName!,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.subText,
              ),
              Expanded(
                child: DefaultText(
                  text: "• ${widget.favouriteData.jobs!.location!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.subText,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppTheme.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return SizedBox(
                    height: 40.h,
                    child: Column(children: [
                      Container(
                        height: 40.h,
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 24,
                          right: 24,
                        ),
                        decoration: const ShapeDecoration(
                          color: AppTheme.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        child: Column(children: [
                          Container(
                            height: 1.3.h,
                            width: 20.w,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          BottomSheetBuilder(
                            'Cancel save',
                            icon: Iconsax.archive_minus,
                            onTap: () {
                              cubit.removeFavourite(
                                  widget.favouriteData.id.toString(),
                              );
                              Navigator.pop(context);
                            },
                          ),
                          BottomSheetBuilder(
                            'Apply job    ',
                            icon: Iconsax.export_2,
                            onTap: () {
                              Navigator.pushNamed(context, AppRouters.jobDetailsPageRoute,
                                  arguments: widget.jobDataModel);
                              },
                          ),
                          BottomSheetBuilder(
                            'Share Via    ',
                            icon: Iconsax.export_1,
                            onTap: () {
                              Navigator.pop(context);
                              },
                          ),
                        ]),
                      ),
                    ]),
                  );
                },
              );
            },
            icon: const Icon(
              Iconsax.more,
              size: 24.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultText(
              text: 'Posted 2 days ago',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Iconsax.clock,
                  color: AppTheme.green,
                  size: 12,
                ),
                const SizedBox(width: 6.0),
                DefaultText(
                  text: 'Be an early applicant',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.subText,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
