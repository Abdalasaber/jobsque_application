import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/enums.dart';

import 'package:sizer/sizer.dart';

import '../../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../../local_database/cache_helper.dart';
import '../../../../styles/color.dart';
import '../../../../widget/default_elevated_button_blue.dart';
import '../../../../widget/default_form_field_login.dart';
import '../../../../widget/default_phone_field.dart';
import '../../../../widget/default_text.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController workController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
    nameController.text =
        cubit.profile.isNotEmpty ? cubit.profile[0].name! : '';
    bioController.text = cubit.profileDetails.isNotEmpty
        ? cubit.profileDetails[0].bio ?? ''
        : '';
    addressController.text = cubit.profileDetails.isNotEmpty
        ? cubit.profileDetails[0].address ?? ''
        : '';
    phoneController.text = cubit.profileDetails.isNotEmpty
        ? cubit.profileDetails[0].mobile ?? ''
        : '';
    workController.text = cubit.profileDetails.isNotEmpty
        ? cubit.profileDetails[0].interestedWork?? ''
        : '';
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
            padding: EdgeInsets.only(right: 5.w),
            child: DefaultText(
              text: 'Personal Details',
              fontSize: 20.sp,
              color: AppTheme.black,
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              BlocConsumer<ProfileCubit, ProfileState>(
                                listener: (context,state){
                                  if(state is PickImageSuccess){
                                  }
                                  else if(state is PickImageError){
                                    if(state is PickImageSuccess){
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if(state is PickImageLoading){
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                  else{
                                    return InkWell(
                                      onTap: () {
                                        cubit.pickAndSaveProfileImage();
                                      },
                                      child: Container(
                                        width: 24.5.w,
                                        height: 11.5.h,
                                        decoration:  ShapeDecoration(
                                          image: cubit.savedImage != null
                                              ? DecorationImage(
                                            image: FileImage(cubit.savedImage!),
                                            fit: BoxFit.fill,
                                          )
                                              : const DecorationImage(
                                            image: NetworkImage(
                                                "https://icons-for-free.com/iconfiles/png/512/man+person+profile+user+icon-1320073176482503236.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: const OvalBorder(
                                            side: BorderSide(width: 2, color: AppTheme.black26),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              const Icon(
                                Iconsax.camera,
                                color: AppTheme.white,
                              ),
                            ],
                          ),
                        ),
                        const DefaultText(
                          text: 'name',
                          color: AppTheme.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            return DefaultFormFieldLogin(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'cant be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'Name',
                            );
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const DefaultText(
                          text: 'Bio',
                          color: AppTheme.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormFieldLogin(
                          controller: bioController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ' cant be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'Bio',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const DefaultText(
                          text: 'Work interested',
                          color: AppTheme.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                          return DefaultFormFieldLogin(
                            controller: workController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' cant be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            hintText: 'Work interested',
                          );
                        }),
                        SizedBox(
                          height: 2.h,
                        ),
                        const DefaultText(
                          text: 'Address',
                          color: AppTheme.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultFormFieldLogin(
                          controller: addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ' cant be empty';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'Address',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const DefaultText(
                          text: 'No.HandPhone',
                          color: AppTheme.grey,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        DefaultPhoneField(
                          keyBoardType: TextInputType.number,
                          hintText: "PhoneNumber",
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter valid data";
                            }
                            if (value.length < 10) {
                              return 'Phone must be 11 characters';
                            } else {
                              return null;
                            }
                          },
                          onChange: (code) {
                            cubit.myCountry = code;
                          },
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton:
        BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is UpdateProfileSuccessfully) {
                    IconSnackBar.show(
                        context: context,
                        snackBarType: SnackBarType.save,
                        label: 'Personal Details Success');
                    Navigator.pop(context);
                  } else if (state is UpdateProfileError) {
                    IconSnackBar.show(
                        context: context,
                        snackBarType: SnackBarType.fail,
                        label: 'Personal Details Error');
                  }
                },
                builder: (context, state) {
                  if (state is! UpdateProfileLoading) {
                    return DefaultElevatedButtonBlue(
                        onPressed: () {
                          if (CashHelper.getString(
                                  key: MyKeyCache.completeProfile) ==
                              '') {
                            cubit.addItem('Personal Details');
                            cubit.updateProfileNameAndPassword(
                                name: nameController.text,
                                password: CashHelper.getString(
                                    key: MyKeyCache.password));
                            cubit.updateUserData(
                                interestedWork: workController.text,
                                mobile: phoneController.text,
                                address: addressController.text,
                                bio: bioController.text);
                          } else {
                            cubit.updateProfileNameAndPassword(
                                name: nameController.text,
                                password: CashHelper.getString(
                                    key: MyKeyCache.password));
                            cubit.updateUserData(
                                interestedWork: workController.text,
                                mobile: phoneController.text,
                                address: addressController.text,
                                bio: bioController.text);
                          }
                          },
                        text: "Save",
                      style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),),
                            backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)
                        ),);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
    ),
    );
  }

}

