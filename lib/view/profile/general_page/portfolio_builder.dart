import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import '../../../app_route/app_route.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';
import 'pdf_args.dart';

class PortfolioBuilder extends StatelessWidget {
  final String text;
  final String size;
  final File selectedFile;
  final bool? isImage;
  const PortfolioBuilder({super.key, required this.text, required this.size, this.isImage=false, required this.selectedFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side:  const BorderSide(color: AppTheme.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.network(
            isImage!?
            'https://cdn.icon-icons.com/icons2/2570/PNG/512/image_icon_153794.png':
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRZJY2YZTyHwVQqbb9Dzsrz2bAdR2JfJCzito195cDsUnjnjCSf',
            width: 5.5.h,
            height: 5.5.h,
          ),
          title: DefaultText(text:
            text,
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w500,
            color: AppTheme.black,
            ),
          subtitle: DefaultText(text:
            isImage!? 'IMG $size MB':
            'CV.pdf $size MB',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.black54,
            ),
          trailing: SizedBox(
            width: 27.w,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {
                  // if(isImage!)
                  // {
                  //   Navigator.pushNamed(context, AppRouters.imagePageRoute);
                  // }
                  // else{
                    final PdfScreenArguments args = PdfScreenArguments(selectedFile, text);
                    Navigator.pushNamed(context, AppRouters.pdfScreenPageRoute,arguments:args );
                  // }
                },
                  icon: Icon(
                    Iconsax.edit_2,
                    color: AppTheme.blueAccent,
                    size: 20.sp,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                  try {
                    await selectedFile.delete();
                  } catch (e) {
                    // ignore: avoid_print
                    print(e);
                  }
                },
                  icon: Icon(
                    Iconsax.close_circle,
                    color: AppTheme.redAccent,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}