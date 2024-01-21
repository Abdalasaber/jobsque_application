// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../cubit/profile_cubit/profile_cubit.dart';
// import '../../../model/country_flag_model/complete_profile_model.dart';
// import '../../../widget/default_text.dart';
// class CompleteProfileBuilder extends StatefulWidget {
//   final CompleteProfileModel completeProfileModel;
//   final Widget icon;
//   final void Function() onPressed;
//   final int index; // Add index as a parameter
//   final Color color; // Add color as a parameter
//
//   const CompleteProfileBuilder({
//     Key? key,
//     required this.completeProfileModel,
//     required this.icon,
//     required this.onPressed,
//     required this.index,
//     required this.color,
//   }) : super(key: key);
//
//   @override
//   State<CompleteProfileBuilder> createState() => _CompleteProfileBuilderState();
// }
//
// class _CompleteProfileBuilderState extends State<CompleteProfileBuilder> {
//   late ProfileCubit cubit;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     cubit=ProfileCubit.get(context);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(
//               builder: (context) => widget.completeProfileModel.screens));
//         },
//         child: Container(
//         height: 15.h,
//         width: 90.w,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color(0xff84A9FF),
//           ),
//           borderRadius: BorderRadius.circular(10),
//           color: widget.completeProfileModel.isSelected ? const Color(0xffD6E4FF) : widget.color,
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
//           child: ListTile(
//             leading: Padding(
//               padding: EdgeInsets.only(right: 3.h),
//               child: IconButton(
//                 onPressed: widget.onPressed,
//                 icon: widget.icon,
//               ),
//             ),
//             title: DefaultText(
//               text: widget.completeProfileModel.text,
//               fontSize: 15.sp,
//               color: Colors.black,
//             ),
//             subtitle: Padding(
//               padding: EdgeInsets.symmetric(vertical: 1.h),
//               child: DefaultText(
//                 text: widget.completeProfileModel.subText,
//                 maxLines: 2,
//                 fontSize: 9.sp,
//                 color: Colors.black,
//               ),
//             ),
//             trailing: Column(
//               children: [
//                 Icon(widget.completeProfileModel.icon),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
