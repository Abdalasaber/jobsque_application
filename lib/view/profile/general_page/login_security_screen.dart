import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/model/login_security_model/login_security_model.dart';
import 'package:jobsque/view/profile/general_page/login_security_builder.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';
import '../../../widget/default_header_star.dart';

class LoginSecurityScreen extends StatelessWidget {

  const LoginSecurityScreen({super.key});

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
          padding: EdgeInsets.only(left: 9.5.w),
          child: DefaultText(
            text: 'Login and security',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Column(children: [
        const DefaultHeaderStart(
          text: 'Account access',
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          height: 5.h,
                        ),
                    itemCount: itemLoginSecurityModel.length,
                    itemBuilder: (context, index) {
                      return LoginSecurityBuilder(
                          loginSecurityModel: itemLoginSecurityModel[index]);
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
