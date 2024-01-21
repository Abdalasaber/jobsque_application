import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/language_profile_cubit/language_profile_cubit.dart';
import '../../../model/language_model/language_model.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class LanguageProfileBuilderScreen extends StatefulWidget {
  final LanguageModel languageModel;
  final int value;

  const LanguageProfileBuilderScreen({
    Key? key,
    required this.languageModel,
    required this.value
  }) : super(key: key);

  @override
  State<LanguageProfileBuilderScreen> createState() => _LanguageProfileBuilderScreenState();
}

class _LanguageProfileBuilderScreenState extends State<LanguageProfileBuilderScreen> {

  late LanguageProfileCubit cubit;

  @override
  void initState() {
    cubit = LanguageProfileCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<LanguageProfileCubit, LanguageProfileState>(
  builder: (context, state) {
    return ListTile(
        onTap: () {
          cubit.choice(widget.value);
        },
        leading: Image.network(widget.languageModel.flag),
          title: DefaultText(text: widget.languageModel.text, color: AppTheme.black,),
          trailing:Radio(
            value: widget.value,
            groupValue: cubit.selectedChoice,
            activeColor: AppTheme.baseColor,
            splashRadius: 25,
            onChanged: (value) {},
          ),
      );
  },
);
  }


}


