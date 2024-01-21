import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/default_text.dart';

class DefaultTextAppBar extends StatelessWidget {
  final String text;
  final double left;

  const DefaultTextAppBar({super.key,required this.text,required this.left});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left.w),
      child: DefaultText(
        text: text,
        fontSize: 20.sp,
        color: Colors.black,
      ),
    );
  }
}
