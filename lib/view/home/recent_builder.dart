import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../app_route/app_route.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../model/job_model/job_data_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import 'jop_type_time_builder.dart';

class RecentJobBuilder extends StatefulWidget {
  final JobDataModel jobDataModel;
  // final Widget icon;
  // final void Function() onPressed;

  const RecentJobBuilder({
    super.key,
    required this.jobDataModel,
    // required this.onPressed,
    // required this.icon
  });

  @override
  State<RecentJobBuilder> createState() => _RecentJobBuilderState();
}

class _RecentJobBuilderState extends State<RecentJobBuilder> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = HomeCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouters.jobDetailsPageRoute,
                  arguments: widget.jobDataModel);
            },
            leading: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: const Color(0xFF6690FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Image.network(widget.jobDataModel.image!)),
            title: DefaultText(
              text: widget.jobDataModel.name!,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                DefaultText(
                  text: widget.jobDataModel.compName!,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white_3,
                ),
                Expanded(
                  child: DefaultText(
                    text: "• ${widget.jobDataModel.location!}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white_3,
                  ),
                ),
              ],
            ),
            trailing: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.handleFavourite(widget.jobDataModel);
                      },
                      icon: cubit.checkFavourite(widget.jobDataModel.id!)
                          ? Transform.translate(
                              offset: Offset(1.5.h, 0),
                              child: const Icon(
                                Iconsax.archive_minus5,
                                color: AppTheme.baseColor,
                              ))
                          : const Icon(
                              Iconsax.archive_minus,
                            ),
                    ),
                  ],
                );
              },
            )),
    Row(
    children: [
    JopTypeTimeBuilder(text: widget.jobDataModel.jobTimeType!,),
    SizedBox(width: 1.w,),
    JopTypeTimeBuilder(text: widget.jobDataModel.jobType!,),

    SizedBox(
    width: 3.5.h,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text.rich(
    TextSpan(
    children: [
    TextSpan(
    text: '\$${widget.jobDataModel.salary!}',
    style: TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppTheme.green,
    ),
    ),
    TextSpan(
    text: '/Month',
    style: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppTheme.black.withOpacity(0.5),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
      ],
    );
  }
}
