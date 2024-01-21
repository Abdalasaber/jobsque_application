import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/color.dart';
import '../../../widget/default_search_bar.dart';
import '../../../widget/default_text.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Iconsax.arrow_left,color: AppTheme.black,),
        ),
        title: Padding(
          padding:  EdgeInsets.only(left: 20.0.w),
          child: DefaultText(
            text: 'Help Center',
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
            DefaultSearchBar(
                searchController: searchController,
                hintText: 'What can we help?',
              ),

            SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
            children: [
              ListTile(
                title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
              )
            ],
            ),
            SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),          SizedBox(height: 1.h,),
            ExpansionTile(title: DefaultText(text: 'Lorem ipsum dolor sit amet',fontSize: 15.sp,color: AppTheme.black,),
              children: [
                ListTile(
                  title:DefaultText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'
                    ,maxLines: 8,fontSize: 10.sp,color: AppTheme.black,),
                )
              ],
            ),

          ],
        ),
      ),
    ),
    );
  }
}
