import 'package:flutter/material.dart';



class DefaultSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;

  const DefaultSearchBar({super.key,
    required this.searchController,
    required this.hintText,
    this.onTap,
    this.keyboardType,
  });

  @override
  State<DefaultSearchBar> createState() => _DefaultSearchBarState();
}

class _DefaultSearchBarState extends State<DefaultSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child:
      TextFormField(
        onTap: widget.onTap,
        controller: widget.searchController,
        keyboardType: widget.keyboardType,
        // onChanged: (value){
        //   searchJob(name: value);
        // },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: const Color(0xFF292D32),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        ),

    );
  }
}
