import 'package:flutter/material.dart';
import 'package:jobsque/model/notification_model/notification_model.dart';
import 'package:sizer/sizer.dart';
import '../../styles/color.dart';
import '../../widget/default_icon_button_app_bar.dart';
import '../../widget/default_text_app_bar.dart';
import '../../widget/default_header_star.dart';
import 'notification_builder.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.transparent,
        elevation: 0.0,
        leading: const DefaultIconButtonAppBar(),
        title: const DefaultTextAppBar(left: 20, text: 'Notification'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const DefaultHeaderStart(text: 'New'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 2.h),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 200.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                    ),
                    itemCount: itemNotifications.length,
                    itemBuilder: (context, index) {
                      return NotificationBuilder(
                        notificationModel: itemNotifications[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const DefaultHeaderStart(text: 'Yesterday'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.5.h),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 100.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 2.h,
                    ),
                    itemCount: itemYesterdayNotifications.length,
                    itemBuilder: (context, index) {
                      return NotificationBuilder(
                        notificationModel: itemYesterdayNotifications[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
