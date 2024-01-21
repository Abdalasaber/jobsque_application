import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../../model/country_flag_model/country_flag_model.dart';
import '../../styles/color.dart';
import '../../widget/default_text.dart';


class CountryFlagBuilder extends StatefulWidget {
  final CountryFlagModel countryFlagModel;
  const CountryFlagBuilder(this.countryFlagModel, {super.key});

  @override
  State<CountryFlagBuilder> createState() => _CountryFlagBuilderState();
}

class _CountryFlagBuilderState extends State<CountryFlagBuilder> {
  late RegisterCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(cubit.selectedCountries.contains(widget.countryFlagModel.flagName)){
          cubit.deleteItemCountry(widget.countryFlagModel.flagName);
        }
        else{
          cubit.addItemCountry(widget.countryFlagModel.flagName);
        }
        print(cubit.selectedCountries);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 42,
          padding:
          const EdgeInsets.only(top: 8, left: 10, right: 14, bottom: 8),
          decoration: ShapeDecoration(
            color: cubit.selectedCountries.contains(widget.countryFlagModel.flagName)
                ? AppTheme.whitBlue
                : AppTheme.nonSelectFlag,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: cubit.selectedCountries.contains(widget.countryFlagModel.flagName)
                      ? AppTheme.baseColor
                      : AppTheme.nonSelectFlag
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.countryFlagModel.flagImage),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
               SizedBox(width: 1.5.w),
              Flexible(
                child: DefaultText( text:
                  widget.countryFlagModel.flagName,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

