import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../cubit/profile_cubit/profile_cubit.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../styles/color.dart';
import '../../../../widget/default_text.dart';


class PersonalDetailsScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isNotLast;
  final void Function()? onTap;
  const PersonalDetailsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    this.isNotLast = true, this.onTap,
  });

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=ProfileCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap:widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: ShapeDecoration(
            color: cubit.completeProfile.contains(widget.title) ? AppTheme.personalColor : AppTheme.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: cubit.completeProfile.contains(widget.title) ? AppTheme.blue : AppTheme.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding:  EdgeInsets.only(right: 1.h),
              child: Icon(
                Iconsax.tick_circle5,
                color: cubit.completeProfile.contains(widget.title) ? AppTheme.baseColor : AppTheme.dividerLine,
                size: 28,
              ),
            ),
            title: DefaultText(text:
              widget.title,
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            subtitle: DefaultText(text:
              widget.subtitle,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.subText,
            ),
            trailing: const Icon(Iconsax.arrow_right_1),
          ),
        ),
      ),
      Visibility(
        visible: widget.isNotLast,
        child: SizedBox(
          height: 20,
          child: VerticalDivider(
            color: cubit.completeProfile.contains(widget.title) ? AppTheme.blue : AppTheme.white,
          ),
        ),
      ),
    ]);
  }
}