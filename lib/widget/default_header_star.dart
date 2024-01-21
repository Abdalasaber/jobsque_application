import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class DefaultHeaderStart extends StatelessWidget {
   final String text;

   const DefaultHeaderStart({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      padding: EdgeInsets.only(left: 5.0.w),
      decoration: const ShapeDecoration(
        color: Color(0xffE5E7EB),
        shape: RoundedRectangleBorder(
          side: BorderSide( color: Color(0xffE5E7EB)),
        ),
      ),
      child: Row(
        mainAxisAlignment:
        // isCentered ?
        // MainAxisAlignment.center :
        MainAxisAlignment.start,
        children: [
          DefaultText(
            text: text,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff6B7280),
          )
        ],
      ),
    );
  }
}
