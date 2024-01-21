import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/model/message_model/messages_model.dart';
import 'package:sizer/sizer.dart';

import '../../styles/color.dart';
import '../../widget/default_text.dart';
import '../../widget/default_search_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MessageModel;

    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        toolbarHeight: 10.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title:
            Row(
          children: [
            Image.asset(args.image),
            SizedBox(width: 5.w),
            DefaultText(
              text: args.name,
              color: AppTheme.black,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(2.0.h),
            child: const Icon(
              Iconsax.sidebar_top,
              color: AppTheme.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: 22.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.h),
                        topRight: Radius.circular(3.w),
                        bottomLeft: Radius.circular(3.w),
                        bottomRight: Radius.circular(3.w),
                      ),
                      color: AppTheme.white_2
                      // const Color(0xffE5E7EB)
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text:
                              "Hi!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.'",
                          maxLines: 5,
                          fontSize: 12.sp,
                          color: AppTheme.black,
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: DefaultText(
                              text: '10:28',
                              color: AppTheme.black
                              // Color(0xffC0C5CD),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: 16.8.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.w),
                      topRight: Radius.circular(0.w),
                      bottomLeft: Radius.circular(3.w),
                      bottomRight: Radius.circular(3.w),
                    ),
                    color: AppTheme.baseColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text:
                              'Hi Melan, thank you for considering me, this is good news for me.',
                          maxLines: 3,
                          fontSize: 12.sp,
                          color: AppTheme.white,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: DefaultText(
                              text: '10:28',
                              color: AppTheme.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: 12.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.h),
                        topRight: Radius.circular(3.w),
                        bottomLeft: Radius.circular(3.w),
                        bottomRight: Radius.circular(3.w),
                      ),
                      color: AppTheme.white_2
                  //    const Color(0xffE5E7EB)
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text:
                              'Can we have an interview via google meet call today at 3pm?',
                          maxLines: 2,
                          fontSize: 12.sp,
                          color: AppTheme.black,
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: DefaultText(
                              text: '10:28',
                              color: AppTheme.black
                              // Color(0xffC0C5CD),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: 10.5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.w),
                      topRight: Radius.circular(0.w),
                      bottomLeft: Radius.circular(3.w),
                      bottomRight: Radius.circular(3.w),
                    ),
                    color: AppTheme.baseColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: 'Of course, I can!',
                          fontSize: 12.sp,
                          color: AppTheme.white,
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: DefaultText(
                              text: '10:28',
                              color: AppTheme.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: 18.5.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.h),
                        topRight: Radius.circular(3.w),
                        bottomLeft: Radius.circular(3.w),
                        bottomRight: Radius.circular(3.w),
                      ),
                      color: AppTheme.white_2
                      // const Color(0xffE5E7EB)
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          text: args.chatMessage,
                          maxLines: 5,
                          fontSize: 12.sp,
                          color: AppTheme.black,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: DefaultText(
                              text: '10:28',
                              color: AppTheme.black
                              // Color(0xffC0C5CD),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 95.w,
        height: 13.h,
        decoration: const BoxDecoration(color: AppTheme.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80.w,
            decoration: const BoxDecoration(
                ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppTheme.grey,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 40.h,
                                child: Column(children: [
                                  Container(
                                    height: 40.h,
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 24,
                                      right: 24,
                                    ),
                                    decoration: const ShapeDecoration(
                                      color: AppTheme.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 1.5.h,
                                          width: 15.w,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            DefaultText(text: 'text!',
                                           fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w500,
                                          color: AppTheme.black,
                                              ),
                                          ],
                                        ),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            },
                          );
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
                          child: const Icon(Iconsax.attach_circle),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                        child: DefaultSearchBar(
                          searchController: searchController,
                          hintText: 'Write a messages....',
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.grey,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 40.h,
                                child: Column(children: [
                                  Container(
                                    height: 40.h,
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 24,
                                      right: 24,
                                    ),
                                    decoration: const ShapeDecoration(
                                      color: AppTheme.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 1.5.h,
                                          width: 15.w,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'text!',
                                              style: TextStyle(
                                                color: AppTheme.black,
                                                fontSize: 15.5.sp,
                                                fontFamily: 'SFProDisplay',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            },
                          );
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
                          child: const Icon(Iconsax.microphone),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
