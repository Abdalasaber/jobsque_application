import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/apply_now_cubit/apply_now_cubit.dart';
import '../../model/type_work_apply_model/type_work_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';

class TypeWorkBuilderScreen extends StatefulWidget {
  final TypeWorkModel typeWorkModel;
  const TypeWorkBuilderScreen({
    Key? key,
    required this.typeWorkModel,
  }) : super(key: key);

  @override
  State<TypeWorkBuilderScreen> createState() => _TypeWorkBuilderScreenState();
}

class _TypeWorkBuilderScreenState extends State<TypeWorkBuilderScreen> {
  late ApplyNowCubit cubit;

  @override
  void initState() {
    cubit = ApplyNowCubit.get(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.typeWorkModel.isSelected
              ? AppTheme.baseColor
              : AppTheme.whitBlue,
        ),
        borderRadius: BorderRadius.circular(11),
        color: widget.typeWorkModel.isSelected
            ? AppTheme.whitBlue
            : AppTheme.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: widget.typeWorkModel.text,
                  fontSize: 15.sp,
                  color: AppTheme.black,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DefaultText(
                  text: widget.typeWorkModel.subtext,
                  fontSize: 11.sp,
                  color: AppTheme.subText,
                ),
              ],
            ),
            Radio(
              activeColor: AppTheme.baseColor,
              value: widget.typeWorkModel.isSelected,
              groupValue: true,
              onChanged: (newCheck) {
                cubit.checkButton(newCheck);
              },
            ),
          ],
        ),
      ),
    );
  }
}

