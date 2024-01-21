import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:jobsque/widget/default_elevated_button_blue.dart';
import 'package:sizer/sizer.dart';

import '../../../../styles/color.dart';
import '../../../../widget/default_phone_field.dart';
import '../../../../widget/default_text.dart';

class PhoneNumberLoginsSecurityScreen extends StatelessWidget {
  const PhoneNumberLoginsSecurityScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    var myCountry = CountryCode(name:"EG",dialCode: "+20");
    final formKey = GlobalKey<FormState>();



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
        title: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: DefaultText(
            text: 'Phone Number',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(text: "Main phone number",fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppTheme.black,),
              SizedBox(height: 2.h,),
              DefaultPhoneField(
                keyBoardType: TextInputType.number,
                hintText: "PhoneNumber",
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter valid data";
                  }
                  if (value.length <= 10) {
                    return 'Phone must be 11 characters';
                  }
                  else{
                    return null;
                  }
                },
                onChange: (code) {
                  myCountry = code;
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: DefaultElevatedButtonBlue(
        onPressed: () {
          if(formKey.currentState!.validate()){
            Navigator.pushNamed(context, AppRouters.loginSecurityPageRoute);
          }
        },
        text: 'save',
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppTheme.baseColor)),
      ),
    );
  }
}
