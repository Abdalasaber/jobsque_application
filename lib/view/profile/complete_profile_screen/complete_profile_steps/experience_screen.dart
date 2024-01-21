import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../../../widget/default_form_field_login.dart';
import '../../../../../widget/default_text.dart';
import '../../../../styles/color.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "Full time",
        child: DefaultText(text:
          'Full time',
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w500,
  color: AppTheme.black,

  ),
        ),
    DropdownMenuItem(
        value: "Part time",
        child: DefaultText(text:
          'Part time',
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w500,
  color: AppTheme.black,

  ),
        ),
  ];

  String selectedValue = "Full time";
  final formKey = GlobalKey<FormState>();

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
              text: 'Experience',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 0.h),
          child: Form(
            key: formKey,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 87.5.h,
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
                              text: 'Position *',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.positionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'Position',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const DefaultText(
                              text: 'Type of work',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DropdownButtonFormField(
                                icon: const Icon(
                                  Iconsax.arrow_down_14,
                                  color: AppTheme.black,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: AppTheme.white_2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: AppTheme.baseColor,
                                    ),
                                  ),
                                ),
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  selectedValue = newValue!;
                                },
                                items: menuItems),
                            SizedBox(
                              height: 1.h,
                            ),
                            const DefaultText(
                              text: 'Company',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.companyController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'Company',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const DefaultText(
                              text: 'Location',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.locationController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              prefixIcon: const Icon(Iconsax.location),
                              prefixIconColor: AppTheme.black,
                              keyboardType: TextInputType.text,
                              hintText: 'Location',
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    activeColor: AppTheme.baseColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    value: cubit.isCheck,
                                    onChanged: (newCheck) {
                                      cubit.checkButton(newCheck);
                                    }),
                            const DefaultText(
                              text: "I am currently working in this role",
                              fontSize: 15,
                              color: AppTheme.black,
                            ),],
                            ),

                            const DefaultText(
                              text: 'Start Year *',
                              color: AppTheme.grey,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            DefaultFormFieldLogin(
                              controller: cubit.startYearExperienceController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' cant be empty';
                                }
                                return null;
                              },
                              obscureText: false,
                              hintText: 'Start Year ',
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
                                cubit.startYearExperienceController.text =
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
                                    cubit.addExperience();
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
                                    if (state is AddExperienceItemCompleteProfileSuccess) {
                                      IconSnackBar.show(
                                          context: context,
                                          snackBarType: SnackBarType.save,
                                          label:
                                          'Experience Updated Successfully');
                                            Navigator.pop(context);
                                    }
                                    else
                                    if (state is AddExperienceItemCompleteProfileError) {
                                      IconSnackBar.show(
                                          context: context,
                                          snackBarType: SnackBarType.fail,
                                          label:
                                          'There something wrong, Try Again');
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is! AddExperienceItemCompleteProfileLoading) {
                                      return ElevatedButton(onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.addExpItem('Experience');
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
                                        child: const DefaultText(text:"Save"),
                                      );
                                    }
                                    else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
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
                            separatorBuilder: (context, index)=>
                                SizedBox(
                              height: 2.h,
                            ),
                            itemCount: cubit.entriesExperience.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 11.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: AppTheme.white_2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h),
                                      child: ListTile(
                                        leading: const Icon(Iconsax.quote_down),
                                        title: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            DefaultText(
                                              text:
                                              '${cubit
                                                  .entriesExperience[index]['Position']}',
                                              color: AppTheme.black,
                                            ),
                                            DefaultText(
                                                text:
                                                'work in ${cubit.entriesExperience[index]['Company']} . in '
                                                    '${cubit.entriesExperience[index]['location']}',
                                                color: AppTheme.black),
                                            DefaultText(
                                              text:
                                              ' ${cubit
                                                  .entriesExperience[index]['Start']}',
                                              color: AppTheme.black26,
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            cubit.removeExperience(index);
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