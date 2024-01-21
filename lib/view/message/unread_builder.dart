import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/message_model/messages_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

class UnreadBuilder extends StatelessWidget {
  final MessageModel messageModel;
  const UnreadBuilder({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return messageModel.status == true
        ? ListTile(
            leading: Stack(
              alignment: Alignment.topLeft,
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(messageModel.image),
                    radius: 18.sp),
                const SizedBox(),
                Container(
                  height: 2.5.h,
                  width: 4.w,
                  decoration: ShapeDecoration(
                    color: AppTheme.blueAccent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppTheme.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: DefaultText(
                      text: '1',
                      color: AppTheme.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: messageModel.name,
                  color: AppTheme.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                DefaultText(
                  text: messageModel.time,
                  color: messageModel.status ? AppTheme.indigo : AppTheme.grey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            subtitle: DefaultText(
              text: messageModel.message,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              fontSize: 10.sp,
              color: AppTheme.subText,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.zero,
          )
        : const SizedBox();
  }
}
