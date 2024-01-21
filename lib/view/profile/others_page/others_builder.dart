import 'package:flutter/material.dart';
import 'package:jobsque/model/general_others_model/profile_model.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class OthersBuilder extends StatelessWidget {
  ProfileModel profileModel;
  OthersBuilder({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>profileModel.screens));
      },
      child: ListTile(
        title: DefaultText(text:profileModel.title,fontSize: 15.sp,color: AppTheme.black,),
        trailing: IconButton(
          onPressed: (){},
          icon: (Icon(profileModel.iconArrow,color: AppTheme.black,)),
        ),
      ),
    );
  }
}
