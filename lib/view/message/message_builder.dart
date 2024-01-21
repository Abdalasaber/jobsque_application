import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/message_model/messages_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

class MessageBuilder extends StatelessWidget {
  final MessageModel messageModel;
  const MessageBuilder({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.topLeft,
        children: [
          CircleAvatar(
              backgroundImage: AssetImage(messageModel.image), radius: 18.sp),
          const SizedBox(),
          messageModel.status
              ? Container(
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
                      child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.white,
                    ),
                  )),
                )
              : const DefaultText(text: ''),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            messageModel.name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
          ),
          DefaultText(
            text: messageModel.time,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: messageModel.status ? AppTheme.indigo : AppTheme.grey,
          ),
        ],
      ),
      subtitle: Text(
        messageModel.message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: AppTheme.subText
          // const Color(0xff6B7280),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
