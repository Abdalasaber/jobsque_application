import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/model/language_model/language_model.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_text.dart';
import 'language_builder.dart';

class LanguageProfileScreen extends StatefulWidget {
  const LanguageProfileScreen({super.key});

  @override
  State<LanguageProfileScreen> createState() => _LanguageProfileScreenState();
}

class _LanguageProfileScreenState extends State<LanguageProfileScreen> {
  bool isSelected=false;

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
          padding: EdgeInsets.only(left: 19.0.w),
          child: DefaultText(
            text: 'Language',
            fontSize: 20.sp,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 2.h,
                  ),
                  itemCount: itemLanguageModel.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          itemLanguageModel[index].isSelected =
                          !itemLanguageModel[index].isSelected;
                        });},
                      child: LanguageProfileBuilderScreen(
                        languageModel: itemLanguageModel[index], value: index + 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
