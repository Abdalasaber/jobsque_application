import 'package:flutter/material.dart';
import 'package:jobsque/shimmer/shimmer_container_effect.dart';
import 'package:sizer/sizer.dart';

class ShimmerSuggestedJob extends StatelessWidget {
  const ShimmerSuggestedJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 40.5.h,
        width: 85.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        // padding: EdgeInsets.all(0.8.h),
        // height: 200,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: ShimmerContainerEffect(
                    height: 1.2.h,
                    width: 1.2.w,
                  ),
                ),
                title: ShimmerContainerEffect(
                  height: 1.2.h,
                ),
                subtitle: Row(
                  children: [
                    ShimmerContainerEffect(
                      height: 1.2.h,
                    ),
                    Expanded(
                      child: ShimmerContainerEffect(
                        height: 1.2.h,
                      ),
                    ),
                  ],
                ),
                trailing: const ShimmerContainerEffect(
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  ShimmerContainerEffect(
                    height: 2.h,
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  const ShimmerContainerEffect(
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainerEffect(
                    height: 5.h,
                    width: 25.w,
                  ),
                  ShimmerContainerEffect(
                    height: 5.h,
                    width: 25.w,
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 6.h,
                width: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
