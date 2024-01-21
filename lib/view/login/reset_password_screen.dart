import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/app_route/app_route.dart';
import 'package:sizer/sizer.dart';

import '../../cubit/login_cubit/login_cubit.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';
import '../../styles/color.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_form_field_login.dart';
import '../../widget/default_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  late LoginCubit cubit;
  @override
  void initState() {
    cubit = LoginCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.transparent,
        elevation: 0,
        actions: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SvgPicture.asset("assets/images/Logo (1).svg"),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: 'Login',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.black,
                ),
                SizedBox(
                  height: 1.h,
                ),
                const DefaultText(
                  text: 'Please login to find your dream job',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.subText,
                ),
                SizedBox(
                  height: 5.h,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return DefaultFormFieldLogin(
                      focusNode: cubit.usernameFocusReset,
                      controller: cubit.usernameResetController,
                      onChanged: cubit.updateButtonColorReset,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username cant be empty';
                        }
                        return null;
                      },
                      hintText: 'Username',
                      prefixIcon: const Icon(Iconsax.user),
                      prefixIconColor: MaterialStateColor.resolveWith(
                        (states) => states.contains(MaterialState.focused)
                            ? AppTheme.deepBlue
                            : AppTheme.white_2,
                      ),
                    );
                  },
                ),
                SizedBox(height: 1.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: DefaultElevatedButtonBlue(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            CashHelper.putString(
                key: MyKeyCache.email,
                value: cubit.usernameResetController.text);
          }
          Navigator.pushNamed(context, AppRouters.checkEmailPageRoute);
        },
        text: "Request password reset",
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(cubit.buttonColor)),
      ),
    );
  }
}
