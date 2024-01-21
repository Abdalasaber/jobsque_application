import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../model/notification_model/notification_profile_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class NotificationProfileBuilder extends StatefulWidget {
  NotificationProfileModel notificationProfileModel;
   NotificationProfileBuilder({super.key,required this.notificationProfileModel});

  @override
  State<NotificationProfileBuilder> createState() => _NotificationProfileBuilderState();
}

class _NotificationProfileBuilderState extends State<NotificationProfileBuilder> {
  bool status=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultText(text: widget.notificationProfileModel.title,fontSize: 15.sp,color: AppTheme.deepBlue,),
        FlutterSwitch(
          width: 15.0.w,
          toggleColor: AppTheme.white_4,
          inactiveColor: AppTheme.unActiveButton,
          activeColor: AppTheme.baseColor,
          value: widget.notificationProfileModel.status,
          borderRadius: 30.0,
          onToggle: (val) {
            setState(() {
              widget.notificationProfileModel.status = val;
            });
          },
        ),
      ],
    );
  }
}
