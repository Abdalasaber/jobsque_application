import 'package:flutter/material.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';
import '../../styles/color.dart';
import '../../widget/default_search_bar.dart';
import '../../widget/default_text.dart';
import 'package:iconsax/iconsax.dart';

class UnArchivedScreen extends StatelessWidget {
  const UnArchivedScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
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
            SizedBox(
              height: 15.h,
            ),
            Image.asset('assets/images/no_message-archived.png'),
            SizedBox(
              height: 2.h,
            ),
            DefaultText(
              text: 'You have not received any',
              fontSize: 23.sp,
              maxLines: 1,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            DefaultText(
              text: 'messages',
              fontSize: 23.sp,
              maxLines: 2,
              fontWeight: FontWeight.w500,
              color: AppTheme.black,
            ),
            SizedBox(
              height: 1.h,
            ),
            const DefaultText(
              text:
                  'Once your application has reached the interview stage, you will get a message from the recruiter.',
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: AppTheme.subText,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
