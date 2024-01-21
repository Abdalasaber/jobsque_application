import 'package:flutter/material.dart';
import 'package:jobsque/shimmer/shimmer_container_effect.dart';
import 'package:sizer/sizer.dart';

class ShimmerRecentJob extends StatelessWidget {
  const ShimmerRecentJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () {
              ShimmerContainerEffect(
                height: 1.2.h,
                width: 1.2.w,
              );
            },
            leading: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child:
                ShimmerContainerEffect(
                  height: 1.2.h,
                  width: 1.2.w,
                ),
            ),
            title:
            ShimmerContainerEffect(
              height: 1.2.h,
              // width: 1.2.w,
            ),
            subtitle: Row(
              children: [
                SizedBox(height: 5.h,),
                ShimmerContainerEffect(
                  height: 1.2.h,
                  // width: 1.2.w,
                ),
                Expanded(
                  child:
                  ShimmerContainerEffect(
                    height: 1.2.h,
                    // width: 1.2.w,
                  ),
                ),
              ],
            ),
            trailing:
                  Column(
                    children: [
                    ShimmerContainerEffect(
                    height: 1.2.h,
                    width: 1.2.w,
                  ),
              ]
            )
        ),
      ],
    );
  }
}
