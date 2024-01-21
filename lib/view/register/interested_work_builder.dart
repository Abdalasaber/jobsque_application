import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../cubit/register_cubit/register_cubit.dart';
import '../../../../widget/default_text.dart';
import '../../styles/color.dart';

class InterestedWorkBuilder extends StatefulWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

   const InterestedWorkBuilder({super.key,
    required this.text,
    required this.icon, this.onTap ,
  });


  @override
  State<InterestedWorkBuilder> createState() => _InterestedWorkBuilderState();
}

class _InterestedWorkBuilderState extends State<InterestedWorkBuilder> {
  late RegisterCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=RegisterCubit.get(context);

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(cubit.interestedWork.contains(widget.text)){
          cubit.deleteItem(widget.text);
        }
        else{
          cubit.addItem(widget.text);
        }
        print(cubit.interestedWork);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        decoration: ShapeDecoration(
          color: cubit.interestedWork.contains(widget.text)?  AppTheme.baseColor:AppTheme.unActiveButton,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5, color: cubit.interestedWork.contains(widget.text)? AppTheme.baseColor: AppTheme.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: cubit.interestedWork.contains(widget.text)? AppTheme.white : AppTheme.unActiveButton,
            shape: RoundedRectangleBorder(
              side: BorderSide(color:cubit.interestedWork.contains(widget.text)? AppTheme.baseColor:AppTheme.unActiveButton),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Icon(widget.icon,color:cubit.interestedWork.contains(widget.text)? AppTheme.baseColor:AppTheme.black,),
          ),
            SizedBox(height: 1.h,),
            Flexible(
              child: DefaultText(text:
                widget.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
