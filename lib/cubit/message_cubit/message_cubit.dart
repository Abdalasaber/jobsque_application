import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  static MessageCubit get(context)=>BlocProvider.of(context);

  final searchController = TextEditingController();


  void bottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: AppTheme.transparent,
        context: context,
        builder: (BuildContext bc) {
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
                    child: Column(children: [
                      Container(
                        height: 1.3.h,
                        width: 10.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouters.unreadPageRoute);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             UnreadScreen()));
                                emit(OnTapState());
                              },
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'Unread',
                                      fontSize: 12.sp,
                                      color: AppTheme.black,
                                    ),
                                    SizedBox(
                                      width: 61.w,
                                    ),
                                    const Icon(
                                      Iconsax.arrow_right_3,
                                      color: AppTheme.black,
                                    )
                                  ],
                                ),
                              )),
                        ]),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          InkWell(
                              onTap: () {
                                // favorites.removeRange(
                                  //     0,
                                  //     itemsRecentModel.length -
                                  //         1); // favorites.removeWhere((element) => itemsRecentModel.length>itemsRecentModel.length);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'Spam',
                                      fontSize: 12.sp,
                                      color: AppTheme.black,
                                    ),
                                    SizedBox(
                                      width: 63.5.w,
                                    ),
                                    const Icon(
                                      Iconsax.arrow_right_3,
                                      color: AppTheme.black,
                                    )
                                  ],
                                ),
                              )),
                        ]),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouters.unArchivedPageRoute);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             UnArchivedScreen()));
                                  emit(OnTapState());

                              },
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DefaultText(
                                      text: 'Archived',
                                      fontSize: 12.sp,
                                      color: AppTheme.black,
                                    ),
                                    SizedBox(
                                      width: 58.5.w,
                                    ),
                                    const Icon(
                                      Iconsax.arrow_right_3,
                                      color: AppTheme.black,
                                    )
                                  ],
                                ),
                              )),
                        ]),
                      ),
                    ])),
              ]));
        });
  }

}
