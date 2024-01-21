import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../app_route/app_route.dart';
import '../../../../cubit/login_security_cubit/login_security_cubit.dart';
import '../../../../styles/color.dart';
import '../../../../widget/default_elevated_button_blue.dart';
import '../../../../widget/default_form_field_login.dart';
import '../../../../widget/default_text.dart';

class EmailAddressLoginSecurityScreen extends StatefulWidget {
  const EmailAddressLoginSecurityScreen({super.key});

  @override
  State<EmailAddressLoginSecurityScreen> createState() => _EmailAddressLoginSecurityScreenState();
}

class _EmailAddressLoginSecurityScreenState
    extends State<EmailAddressLoginSecurityScreen> {

  late LoginSecurityCubit cubit;

  @override
  void initState() {
    cubit = LoginSecurityCubit.get(context);
    super.initState();
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
        title: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: DefaultText(
            text: 'Email Address',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: BlocBuilder<LoginSecurityCubit, LoginSecurityState>(
          builder: (context, state) {
            return Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: "Main e-mail address",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DefaultFormFieldLogin(
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' cant be empty';
                      }
                      final bool isValid = EmailValidator.validate(value);
                      if (!isValid) {
                        return "please enter right email";
                      }
                      return null;
                    },
                    obscureText: false,
                    prefixIcon: const Icon(Iconsax.sms),
                    prefixIconColor: AppTheme.black,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: DefaultElevatedButtonBlue(
        onPressed: () {
          if (cubit.formKey.currentState!.validate()) {
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
            backgroundColor:
                MaterialStateProperty.all(AppTheme.baseColor)),
      ),
    );
  }

}
