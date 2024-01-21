import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../cubit/profile_cubit/profile_cubit.dart';
import '../../../../styles/color.dart';
import '../../../../widget/default_text.dart';

class UploadFile extends StatefulWidget {
  final String target;
  const UploadFile({Key? key, required this.target}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=ProfileCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        cubit.pickFile(widget.target);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8.0),
        dashPattern: const [8, 5],
        color: AppTheme.baseColor,
        child: Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.whitBlue,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 17.w,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppTheme.base2,
                  shape: BoxShape.circle,
                ),
                child:  Center(
                  child: Icon(
                    Iconsax.document_upload5,
                    color: AppTheme.baseColor,
                    size: 27.sp,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              DefaultText(text:
                widget.target=='CV'? 'Upload your CV':
                'Upload your other file',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.black,
              ),
              SizedBox(height: 1.h),
              DefaultText(text:
                'Max. file size 1 MB',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.black,
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 5.5.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: AppTheme.whitBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppTheme.baseColor,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.export_1,
                        color: AppTheme.baseColor,
                        size: 17.sp,
                      ),
                      const SizedBox(width: 10.0),
                      DefaultText(text:
                        'Add file',
                        textAlign: TextAlign.center,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w500,
                        color: AppTheme.baseColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
