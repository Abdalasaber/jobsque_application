import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color.dart';
import '../../widget/default_text.dart';

class BottomSheetBuilder extends StatelessWidget {
  final String name;
  final IconData? icon;
  final bool state;
  final void Function()? onTap;
  const BottomSheetBuilder(this.name,
      {super.key, this.icon, this.state = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        height: 8.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.grey),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: 20.0,
                    ),
                    // Icon(
                    // Iconsax.archive_minus,
                    // color: Colors.black,
                    // ),
                    SizedBox(
                      width: 3.w,
                    ),
                    DefaultText(
                      text: name,
                      // 'Cancel Save',
                      fontSize: 12.sp,
                      color: AppTheme.black,
                    ),
                    SizedBox(
                      width: 43.w,
                    ),
                    const Icon(
                      Iconsax.arrow_right_3,
                      color: AppTheme.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
