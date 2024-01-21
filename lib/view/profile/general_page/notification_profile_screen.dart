import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../model/notification_model/notification_profile_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';
import '../../../widget/default_header_star.dart';
import 'notification_profile_builder.dart';

class NotificationProfileScreen extends StatefulWidget {
  const NotificationProfileScreen({super.key});

  @override
  State<NotificationProfileScreen> createState() =>
      _NotificationProfileScreenState();
}

class _NotificationProfileScreenState extends State<NotificationProfileScreen> {
  int tabSelectedIndexSelected = 0;

  List<String> listTextSelectedToggle = ['', ''];
  bool isIs = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 19.0.w),
          child: DefaultText(
            text: 'Notification',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DefaultHeaderStart(
              text: 'Job notification',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 45.5.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 5.h,
                          thickness: 1,
                        ),
                        itemCount: itemNotificationProfileModel.length,
                        itemBuilder: (context, index) {
                          return NotificationProfileBuilder(
                            notificationProfileModel:
                                itemNotificationProfileModel[index],
                          );
                        },
                      ),
                    ),
                  ]),
            ),
            const DefaultHeaderStart(
              text: 'Job notification',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 5.h,
                          thickness: 1,
                        ),
                        itemCount: itemNotificationProfileOthers.length,
                        itemBuilder: (context, index) {
                          return NotificationProfileBuilder(
                            notificationProfileModel:
                                itemNotificationProfileOthers[index],
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
