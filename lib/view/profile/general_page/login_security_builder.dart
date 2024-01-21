import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../model/login_security_model/login_security_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class LoginSecurityBuilder extends StatelessWidget {
  final LoginSecurityModel loginSecurityModel;

  const LoginSecurityBuilder({super.key,required this.loginSecurityModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginSecurityModel.screen));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          DefaultText(text:loginSecurityModel.title,fontSize: 15.sp,color: AppTheme.black,),
          SizedBox(width: 14.w,),
          DefaultText(text: loginSecurityModel.subtitle,color: AppTheme.black,),

          const Icon(Iconsax.arrow_right_1,color: AppTheme.black,),
        ],
      ),
    );
  }
}
