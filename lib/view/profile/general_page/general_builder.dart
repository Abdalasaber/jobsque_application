import 'package:flutter/material.dart';
import 'package:jobsque/model/general_others_model/profile_model.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class GeneralProfileBuilder extends StatelessWidget {
  ProfileModel profileModel;
  GeneralProfileBuilder({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>profileModel.screens));
      },
      child: ListTile(
        leading: CircleAvatar(
            radius: 4.h,
            backgroundColor: AppTheme.whitBlue,
            child: IconButton(
              onPressed: (){},
              icon: (Icon(profileModel.icon,color: AppTheme.baseColor,)),
            )),
        title: DefaultText(text:profileModel.title,fontSize: 15.sp,color: AppTheme.black,),
        trailing: IconButton(
          onPressed: (){},
          icon: (Icon(profileModel.iconArrow,color: AppTheme.black,)),
        ),
      ),
    );
  }
}
