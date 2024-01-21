import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'default_text.dart';
class DefaultElevatedButtonAccount extends StatelessWidget {
  final void Function() onPressed;
  final ImageProvider<Object> image;
  final String text;
  const DefaultElevatedButtonAccount({super.key,required this.onPressed,required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xff9CA3AF)),
          ),),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          fixedSize: MaterialStateProperty.all(Size(41.w, 8.h,))

      ),
      onPressed: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: image),
          const SizedBox(width: 5,),
          DefaultText(text: text,color: Colors.black,)
        ],
      ),
    );
  }
}
