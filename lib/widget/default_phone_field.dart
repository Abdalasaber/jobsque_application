import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class DefaultPhoneField extends StatelessWidget{
  final TextEditingController ? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final Function(CountryCode)? onChange;
  final String? hintText;
  final String? labelText;

  const DefaultPhoneField({super.key,required this.controller,this.hintText,this.labelText,
    required this.validator, this.keyBoardType,
    this.onChange,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator: validator,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          onChanged:onChange ,
          initialSelection: 'EG',
          favorite: const ['+20','EG'],
        ),
        hintText: hintText,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff3366FF)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
      ),
      // ),

    );
  }

}

