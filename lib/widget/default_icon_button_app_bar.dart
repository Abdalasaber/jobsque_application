import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../app_route/app_route.dart';

class DefaultIconButtonAppBar extends StatelessWidget {
  const DefaultIconButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pushNamed(context, AppRouters.layoutPageRoute);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
      },
      icon: const Icon(Iconsax.arrow_left,color: Colors.black,),
    );
  }
}
