import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../model/notification_model/notification_model.dart';
import '../../styles/color.dart';

class NotificationBuilder extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationBuilder({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
backgroundColor: AppTheme.white,
          backgroundImage: AssetImage(notificationModel.img), radius: 10.sp),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notificationModel.company,
            style: TextStyle(
              color: AppTheme.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              notificationModel.status
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 3.w,
                        height: 1.h,
                        decoration: const BoxDecoration(
                          color: AppTheme.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
              Text(
                notificationModel.datetime,
                style: TextStyle(
                  color: AppTheme.black,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
      subtitle: Text(
        notificationModel.subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
