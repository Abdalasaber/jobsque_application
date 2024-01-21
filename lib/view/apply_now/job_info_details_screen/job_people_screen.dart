import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/default_text.dart';
import 'job_details_people_tile.dart';


class JobDetailsPeople extends StatelessWidget {
  JobDetailsPeople({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "UI/UX Designer",
        child:
        DefaultText(text:
        'UI/UX Designer',
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
    DropdownMenuItem(value: "BackEnd",
        child:
        DefaultText(text:
          'BackEnd',
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
    DropdownMenuItem(value: "FrontEnd",
        child:
        DefaultText(text:
          'FrontEnd',
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
  ];

  String selectedValue = "UI/UX Designer";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title:
              DefaultText(text:
              '6 Employees For',
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w500,
                color: Colors.black,
                ),
              subtitle:
              DefaultText(text:
              'UI/UX Design',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                color: Colors.black,

                ),
              trailing:  SizedBox(
                width: 40.w,
                child:
                DropdownButtonFormField(
                    padding: EdgeInsets.zero,
                    icon:  Icon(Iconsax.arrow_down_14,color: Colors.black,size: 14.sp,),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,),
                      ),
                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      selectedValue = newValue!;
                    },
                    items: menuItems),
              ),
            ),
            SizedBox(height: 3.h,),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index)=> const JobDetailsPeopleTile(image:"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZClNi2dGGXiI5K7tZaMrc2CT6Ysy5zmeBXaORUA7dz2ZNFYeR", name: "Dimas Adi Saputro", job: "Senior UI/UX Designer at Twitter", yearsOfExp: "5 Years"),
                separatorBuilder: (context,index)=>const Divider(),
                itemCount: 5
            ),
          ],
        ),
      ),
    );
  }
}
