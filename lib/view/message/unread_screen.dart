import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/view/message/unread_builder.dart';
import 'package:sizer/sizer.dart';
import '../../model/message_model/messages_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';
import '../../widget/default_search_bar.dart';

class UnreadScreen extends StatelessWidget {
  const UnreadScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.messagePageRoute);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: DefaultText(
            text: 'Messages',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultSearchBar(
                      searchController: searchController,
                      hintText: 'Search messages....',
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                    onTap: () {
                      // bottomSheet(context);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppTheme.black),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Icon(
                        Iconsax.setting_4,
                        color: AppTheme.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 5.h,
              padding: EdgeInsets.only(left: 6.0.w),
              decoration: const ShapeDecoration(
                color: AppTheme.white_2,
                // Color(0xffF4F4F5),
                shape: RoundedRectangleBorder(
                    ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultText(
                    text: 'Unread',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.subText
                    // const Color(0xffA3A8AF),
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                  DefaultText(
                    text: 'Read all message',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blue,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 500.h,
                    width: 200.w,
                    child: ListView.builder(
                      itemCount: itemMesaageModel.length,
                      itemBuilder: (context, index) {
                        return UnreadBuilder(
                          messageModel: itemMesaageModel[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
