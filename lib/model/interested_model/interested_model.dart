import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InterestedModel {
  IconData icon;
  String text;
  bool isSelected;


  InterestedModel({
    required this.icon,
    required this.text,
    this.isSelected = false,
  });
}
List<InterestedModel> itemInterestedModel = [
  InterestedModel(icon: Iconsax.bezier, text: 'UI/UX Designer'),
  InterestedModel(icon: Iconsax.pen_tool, text: 'Ilustrator Designer'),
  InterestedModel(icon: Iconsax.code, text: 'Developer'),
  InterestedModel(icon: Iconsax.graph, text: 'Management'),
  InterestedModel(icon: Iconsax.monitor_mobbile, text: 'Information Technology'),
  InterestedModel(icon: Iconsax.cloud_add, text: 'Research and Analytics'),
];
