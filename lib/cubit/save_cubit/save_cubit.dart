// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'save_state.dart';
//
// class SaveCubit extends Cubit<SaveState> {
//   SaveCubit() : super(SaveInitial());
//
//   static SaveCubit get(context)=>BlocProvider.of(context);
//
//   // void bottomSheet(context, int index) {
//   //   showModalBottomSheet(
//   //     backgroundColor: Colors.transparent,
//   //     context: context,
//   //     builder: (BuildContext bc) {
//   //       return SizedBox(
//   //         height: 40.h,
//   //         child: Column(
//   //           children: [
//   //             Container(
//   //               height: 40.h,
//   //               padding: const EdgeInsets.only(
//   //                 top: 12,
//   //                 left: 24,
//   //                 right: 24,
//   //               ),
//   //               decoration: const ShapeDecoration(
//   //                 color: Colors.white,
//   //                 shape: RoundedRectangleBorder(
//   //                   borderRadius: BorderRadius.only(
//   //                     topLeft: Radius.circular(16),
//   //                     topRight: Radius.circular(16),
//   //                   ),
//   //                 ),
//   //               ),
//   //               child: Column(
//   //                 children: [
//   //                   Container(
//   //                     height: 1.3.h,
//   //                     width: 20.w,
//   //                     decoration: ShapeDecoration(
//   //                       shape: RoundedRectangleBorder(
//   //                         side: const BorderSide(),
//   //                         borderRadius: BorderRadius.circular(25.0),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(height: 3.h),
//   //                   Container(
//   //                     height: 8.h,
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(color: Colors.grey),
//   //                       borderRadius: BorderRadius.circular(20),
//   //                     ),
//   //                     child: Column(
//   //                       children: [
//   //                         InkWell(
//   //                           onTap: () {
//   //                             // Handle "Apply Job" action
//   //                             Navigator.push(
//   //                               context,
//   //                               MaterialPageRoute(
//   //                                 builder: (context) => ApplyNowScreen(),
//   //                               ),
//   //                             );
//   //                           },
//   //                           child: Padding(
//   //                             padding: EdgeInsets.all(2.h),
//   //                             child: Row(
//   //                               mainAxisAlignment: MainAxisAlignment.start,
//   //                               children: [
//   //                                 Icon(
//   //                                   Iconsax.message_2,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 3.w,
//   //                                 ),
//   //                                 DefaultText(
//   //                                   text: 'Apply Job',
//   //                                   fontSize: 12.sp,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 48.2.w,
//   //                                 ),
//   //                                 Icon(
//   //                                   Iconsax.arrow_right_3,
//   //                                   color: Colors.black,
//   //                                 )
//   //                               ],
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                   SizedBox(height: 2.h),
//   //                   Container(
//   //                     height: 8.h,
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(color: Colors.grey),
//   //                       borderRadius: BorderRadius.circular(20),
//   //                     ),
//   //                     child: Column(
//   //                       children: [
//   //                         InkWell(
//   //                           onTap: () {
//   //                             // Handle "Share Via" action
//   //                             Navigator.push(
//   //                               context,
//   //                               MaterialPageRoute(
//   //                                 builder: (context) => ApplyNowScreen(),
//   //                               ),
//   //                             );
//   //                           },
//   //                           child: Padding(
//   //                             padding: EdgeInsets.all(2.h),
//   //                             child: Row(
//   //                               mainAxisAlignment: MainAxisAlignment.start,
//   //                               children: [
//   //                                 Icon(
//   //                                   Iconsax.export_1,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 3.w,
//   //                                 ),
//   //                                 DefaultText(
//   //                                   text: 'Share Via',
//   //                                   fontSize: 12.sp,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 48.5.w,
//   //                                 ),
//   //                                 Icon(
//   //                                   Iconsax.arrow_right_3,
//   //                                   color: Colors.black,
//   //                                 )
//   //                               ],
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                   SizedBox(height: 2.h),
//   //                   Container(
//   //                     height: 8.h,
//   //                     decoration: BoxDecoration(
//   //                       border: Border.all(color: Colors.grey),
//   //                       borderRadius: BorderRadius.circular(20),
//   //                     ),
//   //                     child: Column(
//   //                       children: [
//   //                         InkWell(
//   //                           onTap: () {
//   //                               favorites.removeAt(index);
//   //                               Navigator.pop(context);
//   //                               emit(BottemState());
//   //                           },
//   //                           child: Padding(
//   //                             padding: EdgeInsets.all(2.h),
//   //                             child: Row(
//   //                               mainAxisAlignment: MainAxisAlignment.start,
//   //                               children: [
//   //                                 Icon(
//   //                                   Iconsax.archive_minus,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 3.w,
//   //                                 ),
//   //                                 DefaultText(
//   //                                   text: 'Cancel Save',
//   //                                   fontSize: 12.sp,
//   //                                   color: Colors.black,
//   //                                 ),
//   //                                 SizedBox(
//   //                                   width: 43.w,
//   //                                 ),
//   //                                 Icon(
//   //                                   Iconsax.arrow_right_3,
//   //                                   color: Colors.black,
//   //                                 )
//   //                               ],
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //       },
//   //   );
//   // }
//
//   // InkOnTap(context, int index){
//   //   favorites.removeAt(index);
//   //   Navigator.pop(context);
//   //   emit(OnTapState());
//   // }
//
//
// }
