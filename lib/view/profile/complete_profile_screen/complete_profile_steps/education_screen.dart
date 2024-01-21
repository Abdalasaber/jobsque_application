import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../../styles/color.dart';
import '../../../../widget/default_form_field_login.dart';
import '../../../../widget/default_text.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController universityController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController startYearController = TextEditingController();

  TextEditingController endYearController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: AppTheme.black,
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: DefaultText(
              text: 'Education',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
          child: Form(
            key: formKey,
            child:
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return
                  Column(
                  children: [
                    Container(
                      height: 71.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.h, vertical: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DefaultText(
                              text: 'University',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.universityController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'University',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const DefaultText(
                              text: 'Title',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'Title',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const DefaultText(
                              text: 'Start Year',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.startYearController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              obscureText: false,
                              hintText: 'Start Year',
                              suffixIcon: const Icon(Iconsax.calendar_1),
                              suffixIconColor: AppTheme.black,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2101));
                                String formattedDate =
                                    DateFormat.yMMM().format(pickedDate!);
                                cubit.startYearController.text =
                                    formattedDate;
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const DefaultText(
                              text: 'End Year',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.endYearController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              obscureText: false,
                              hintText: 'End Year',
                              suffixIcon: const Icon(Iconsax.calendar_1),
                              suffixIconColor: AppTheme.black,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2101));
                                String formattedDate =
                                    DateFormat.yMMM().format(pickedDate!);
                                cubit.endYearController.text =
                                    formattedDate;
                              },
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    cubit.addEducation();
                                  },
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(35.w, 7.h)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppTheme.baseColor),
                                  ),
                                  child: const DefaultText(
                                    text: 'Add',
                                    fontSize: 15,
                                  ),
                                ),
                                BlocConsumer<ProfileCubit, ProfileState>(
                                    listener: (context, state) {
                                  if (state is AddItemCompleteProfileSuccess) {
                                    IconSnackBar.show(
                                        context: context,
                                        snackBarType: SnackBarType.save,
                                        label:
                                            'Education Details Updated Successfully');
                                    Navigator.pop(context);
                                  }
                                }, builder: (context, state) {
                                  return
                                    ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.addItem('Education');
                                        }
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(35.w, 7.h)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                        backgroundColor: MaterialStateProperty.all(
                                            AppTheme.baseColor),
                                      ),
                                      child: const DefaultText(
                                        text: 'Save',
                                        fontSize: 15,
                                      ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                            itemCount: cubit.entriesEducation.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 11.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.white_2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: ListTile(
                                        leading: const Icon(Iconsax.book),
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DefaultText(
                                              text:
                                                  '${cubit.entriesEducation[index]['University']}',
                                              color: AppTheme.black,
                                            ),
                                            DefaultText(
                                                text:
                                                    '${cubit.entriesEducation[index]['Major']}',
                                                color: AppTheme.black),
                                            DefaultText(
                                              text:
                                                  ' ${cubit.entriesEducation[index]['Start']} - ${cubit.entriesEducation[index]['End']} ',
                                              color: AppTheme.black26,
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            cubit.removeEducation(index);
                                          },
                                        ),
                                      )));
                            });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),

    );
  }
}

