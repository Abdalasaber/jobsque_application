// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:jobsque/model/type_work_apply_model/type_work_model.dart';
// import 'package:sizer/sizer.dart';
// import '../../../styles/color.dart';
// import '../../../widget/default_elevated_button_blue.dart';
// import '../../../widget/default_form_field_login.dart';
// import '../../../widget/default_phone_field.dart';
// import '../../../widget/default_text.dart';
// import '../../apply_now/type_work_builder.dart';
// import '../../apply_now/apply_step/step_circle.dart';
//
// class AccesibillityScreen extends StatefulWidget {
//   const AccesibillityScreen({super.key});
//
//   @override
//   State<AccesibillityScreen> createState() => _AccesibillityScreenState();
// }
//
// class _AccesibillityScreenState extends State<AccesibillityScreen> {
//   final formKey= GlobalKey<FormState>();
//   final usernameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final towController = TextEditingController();
//   final threeController = TextEditingController();
//   var myCountry = CountryCode(name:"EG",dialCode: "+20");
//
//
//   final controller =PageController();
//   bool isLadt=false;
//
//   int currentStep=0;
//   // File? selectedCVFile;
//   // File? selectedOtherFile;
//   bool? result;
//
//
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//           backgroundColor: AppTheme.white,
//       appBar: AppBar(
//         backgroundColor: AppTheme.white,
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: const Icon(Iconsax.arrow_left,color: AppTheme.black,),
//         ),
//       title: Padding(
//         padding:  EdgeInsets.only(left: 15.0.w),
//         child: DefaultText(
//             text: 'Accesibillity',
//             fontSize: 20.sp,
//             color: AppTheme.black,
//           ),
//       ),
//       ),
//       body: Form(
//           key: formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 1.h,),
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         StepCircle(
//                           1,
//                           "Bio Data",
//                           currentStep >= 0,
//                         ),
//                         StepCircle(
//                           2,
//                           'Type of work',
//                           currentStep >= 1,
//                         ),
//                         StepCircle(
//                             3,
//                             'Upload portfolio',
//                             currentStep == 2,
//                             lineState: false),
//                       ]),
//                   SizedBox(height: 4.5.h,),
//                   SizedBox(
//                     height: 150.h,
//                     child: PageView.builder(
//                       onPageChanged: (index) {
//                         if (index == 3 - 1) {
//                           setState(() {
//                             isLadt = true;
//                           });
//                         } else {
//                           setState(() {
//                             isLadt = false;
//                           });
//                         }
//                       },
//                       scrollDirection: Axis.horizontal,
//                       controller: controller,
//                       itemCount: 3,
//                       itemBuilder: (BuildContext context, int index) {
//                         return
//                           Padding(
//                           padding:  EdgeInsets.symmetric(horizontal: 0.0.w,vertical: 0.h),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               index==0?
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 6.0.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                   'Bio data',
//                                   style: TextStyle(
//                                     color: AppTheme.black,
//                                     fontSize: 16.5.sp,
//                                     fontFamily: 'SFProDisplay',
//                                     fontWeight: FontWeight.w500,
//
//                                   ),
//                                 ),
//                                 DefaultText(
//                                   text:
//                                   'Fill in your bio data correctly',
//                                   color: AppTheme.black26,
//                                   fontSize: 11.5.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                                 SizedBox(height: 3.h,),
//                                 Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: 'Full Name',
//                                         style: TextStyle(
//                                           color: AppTheme.black,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: '*',
//                                         style: TextStyle(
//                                           color: AppTheme.red,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 1.h,),
//                                     DefaultFormFieldLogin(
//                                                 controller: usernameController,
//                                                 keyboardType: TextInputType.text,
//                                                 validator: (value) {
//                                                   if (value!.isEmpty) {
//                                                     return 'Username cant be empty';
//                                                   }
//                                                   else{
//                                                     return null;
//                                                   }
//                                                 },
//
//                                                 hintText: 'Username',
//                                                 prefixIcon: const Icon(Iconsax.user),
//                                                 prefixIconColor: MaterialStateColor.resolveWith((states) =>
//                                                 states.contains(MaterialState.focused)
//                                                     ? const Color(0xff111827)
//                                                     : const Color(0xffD1D5DB),
//                                                 )),
//                                 SizedBox(height: 2.h,),
//                                 Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: 'Email',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: '*',
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 1.h,),
//                               DefaultFormFieldLogin(
//                                 // focusNode: cubit.usernameFocus,
//                                   controller: emailController,
//                                   // onChanged: cubit.updateButtonColor,
//                                   keyboardType: TextInputType.text,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Email cant be empty';
//                                     }
//                                     else{
//                                       return null;
//                                     }
//                                   },
//                                   hintText: 'Email',
//                                   prefixIcon: const Icon(Iconsax.user),
//                                   prefixIconColor: MaterialStateColor.resolveWith((states) =>
//                                   states.contains(MaterialState.focused)
//                                       ? const Color(0xff111827)
//                                       : const Color(0xffD1D5DB),
//                                   )),
//                                 SizedBox(height: 2.h,),
//                                 Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: 'No.Headphone',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: '*',
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 13.5.sp,
//                                           fontWeight: FontWeight.w400,
//
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 1.h,),
//                                     DefaultPhoneField(
//                                 keyBoardType: TextInputType.number,
//                                 hintText: "PhoneNumber",
//                                 controller: phoneController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return "please enter valid data";
//                                   }
//                                   if (value.length < 10) {
//
//
//                                     return 'Phone must be 11 characters';
//                                   }
//
//                                   else{
//                                     return null;
//                                   }
//                                 },
//                                 onChange: (code) {
//                                   myCountry = code;
//                                 },
//                               ),
//                             ],
//                           ),
//                               ):
//                               index==1?
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 6.0.w),child:Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             DefaultText(text:
//                               'Type of work',
//                                 fontSize: 16.5.sp,
//                                 fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                             SizedBox(height: 1.h,),
//                             DefaultText(
//                               text:
//                               'Fill in your bio data correctly',
//                               color: Colors.black26,
//                               fontSize: 11.5.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                             SizedBox(height: 3.h,),
//                                 SizedBox(
//                             height: 50.h,
//                             width: 85.w,
//                             child: ListView.separated(
//                             scrollDirection: Axis.vertical,
//                             separatorBuilder: (context,index)=>SizedBox(
//                               height: 2.h,
//                             ),
//                             itemCount: itemTypeWorkModel.length,
//                             itemBuilder: (context, index) {
//                             return InkWell(
//                             onTap: () {
//                             setState(() {
//                               itemTypeWorkModel[index].isSelected =
//                             !itemTypeWorkModel[index].isSelected;
//                             });},
//                             child: TypeWorkBuilderScreen(
//                               typeWorkModel: itemTypeWorkModel[index],
//                             ),
//                             );
//                             },
//                             ),
//                             ),
//                           ],
//                         )
//                               )
//                                   : index==2?
//                           //     DefaultFormField(controller: threeController,
//                           // keyboardType: TextInputType.text,
//                           // labelText: 'page 3',
//                           // validator: (value){
//                           // if(value!.isEmpty){
//                           // return 'cant';
//                           // }
//                           // },)
//                         ElevatedButton(
//                         onPressed: ()async{
//                         var file = await FilePicker.platform.pickFiles(type:FileType.custom,allowedExtensions: ['pdf','docx']);
//
//                         },
//                         child: const Text('File'),
//                         )
//                                   :const DefaultText(text: 'non',color: Colors.black,),
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//
//
//
//                           //       // child: isLadt!
//                           //       //     ? Container(
//                           //       //     width: 84.w,
//                           //       //     height: 5.h,
//                           //       //     decoration: BoxDecoration(
//                           //       //         borderRadius: BorderRadius.circular(25),
//                           //       //         color: Color(0xff3366FF)),
//                           //       //     child: Center(
//                           //       //       child: DefaultText(
//                           //       //         text: 'Get Started',
//                           //       //         fontSize: 20,
//                           //       //       ),
//                           //       //     ))
//                           //       //     : Container(
//                           //       //   width: 84.w,
//                           //       //   height: 5.h,
//                           //       //   decoration: BoxDecoration(
//                           //       //       borderRadius: BorderRadius.circular(25),
//                           //       //       color: Color(0xff3366FF)),
//                           //       //   child: Center(
//                           //       //     child: DefaultText(
//                           //       //       text: 'Next',
//                           //       //       fontSize: 20,
//                           //       //     ),
//                           //       //   ),
//                           // // ),
//                           // ),
//                           //     Center(
//                           //       child: DefaultElevatedButtonBlue(
//                           //         onPressed: (){
//                           //           if (currentStep < 2) {
//                           //             if(formKey.currentState!.validate()){
//                           //               // cubit.addStep();
//                           //               setState(() {
//                           //                 currentStep++;
//                           //                 controller.nextPage(
//                           //                     duration: Duration(microseconds: 1000000),
//                           //                     curve: Curves.easeInOut);
//                           //               });
//                           //               // pageController.animateToPage(currentStep,
//                           //               //     duration: const Duration(milliseconds: 500),
//                           //               //     curve: Curves.decelerate);
//                           //             }
//                           //           } else {
//                           //             // cubit.applyJob(usernameController.text, emailController.text, phoneController.text, widget.jobData.id.toString());
//                           //           }
//                           //         },
//                           //         text: currentStep < 2 ? 'Next' : 'Submit', style: ButtonStyle(
//                           //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           //             borderRadius: BorderRadius.circular(25),
//                           //           ),),
//                           //           backgroundColor: MaterialStateProperty.all(Color(0xff3366FF))
//                           //       ),
//                           //         // child: Text(currentStep < 2 ? 'Next' : 'Submit')
//                           //       ),
//                           //     )
//
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//
//     //   Row(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         StepIndication(
//     //           1,
//     //           "Bio Data",
//     //           currentStep >= 0,
//     //         ),
//     //         StepIndication(
//     //           2,
//     //           'Type of work',
//     //           currentStep >= 1,
//     //         ),
//     //         StepIndication(
//     //             3,
//     //             'Upload portfolio',
//     //             currentStep == 2,
//     //             lineState: false),
//     //       ]),
//     //   SizedBox(
//     //     height: 50.h,
//     //     child: PageView(
//     //         controller: pageController,
//     //         physics: const NeverScrollableScrollPhysics(),
//     //         onPageChanged: (int i) {
//     //           //FocusScope.of(context).requestFocus(FocusNode());
//     //           currentStep = i;
//     //         },
//     //         children: [
//     //           BioDataScreen(),
//     //           ProfileScreen(),
//     //           // BioDataScreen(),
//     //           // const TypeOfWorkScreen(),
//     //           // const UploadPortfolio()
//     //         ]),
//     //   ),
//     //       ElevatedButton(
//     //     onPressed: (){
//     //   if (currentStep < 2) {
//     //     if(formKey.currentState!.validate()){
//     //       // cubit.addStep();
//     //       setState(() {
//     //         currentStep++;
//     //       });
//     //
//     //       // pageController.animateToPage(currentStep,
//     //       //     duration: const Duration(milliseconds: 500),
//     //       //     curve: Curves.decelerate);
//     //     }
//     //   } else {
//     //     // cubit.applyJob(usernameController.text, emailController.text, phoneController.text, widget.jobData.id.toString());
//     //
//     //   }
//     // },
//     // child: Text(currentStep < 2 ? 'Next' : 'Submit')
//     // ),
//
//
//                   ],
//               ),
//             ),
//           ),
//            floatingActionButton: DefaultElevatedButtonBlue(
//             onPressed: () {
//             if (currentStep < 2) {
//               if(formKey.currentState!.validate()) {
//                 // cubit.addStep();
//                 setState(() {
//                   currentStep++;
//                   controller.nextPage(
//                       duration: const Duration(microseconds: 1000000),
//                       curve: Curves.easeInOut);
//                 });
//               }}},
//     text: currentStep < 2 ? 'Next' : 'Submit',
//     style: ButtonStyle(
//     shape: MaterialStateProperty.all(
//     RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(25),
//     ),
//     ),
//     backgroundColor: MaterialStateProperty.all(const Color(0xff3366FF))),
//     ),
//     );
//   }
//   void Change(index){
//     setState(() {
//     currentStep = index;
//     });
//   }
// }
