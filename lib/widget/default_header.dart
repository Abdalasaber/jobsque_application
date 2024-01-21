import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';

class DefaultHeader extends StatelessWidget {
  final String header;
  final bool isCentered;
  const DefaultHeader(this.header, {super.key, this.isCentered = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      padding: EdgeInsets.only(left: 39.0.w),
      decoration: const ShapeDecoration(
        color: Color(0xffF4F4F5),
        shape: RoundedRectangleBorder(
            // side: BorderSide( color: Colors.black),
            ),
      ),
      child: Row(
        mainAxisAlignment:
            isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          DefaultText(
            text: header,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xffA3A8AF),
          )
        ],
      ),
    );
  }
}
