import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

class JopTypeTimeBuilder extends StatelessWidget {
  final String text;
  const JopTypeTimeBuilder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 25.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.workTypeColor,
      ),
      child: Center(
        child: DefaultText(
          text: text,
          // widget.jobData.jobTimeType!
          // .jopReq![index]
        ),
      ),
    );
  }
}
