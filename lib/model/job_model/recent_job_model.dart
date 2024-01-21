import 'package:flutter/material.dart';
class RecentJobModel {
  // final int id;
   String image;
   String name;
   String subtext;
   List<String>? jopReq;
   String option;
   Color? color;
   Color? colorText;
   bool? isSelect;
   String salary;
   String time;

   RecentJobModel({
    required this.image,
    required this.name,
    required this.subtext,
     this.jopReq,
     this.color,
     this.isSelect,
     this.colorText,
     required this.salary,
     required this.time,
    required this.option,
  });
}

List<RecentJobModel> itemsRecentModel = [
  RecentJobModel(image: 'assets/images/Twitter Logo.png', name: 'Senior UI Designer',option: 'Fulltime',subtext:'Twitter • Jakarta, Indonesia', salary: '', time: ''),
  RecentJobModel(image: 'assets/logos/Facebook.png', name: 'Senior Flutter',option: 'Fulltime',subtext:'Twitter • Jakarta, Indonesia', salary: '', time: ''),
  // Add more items as needed
];

List<RecentJobModel> itemsSuggestedModel = [
  RecentJobModel(image: 'assets/images/Zoom Logo.png', name: 'Product Designer',option: 'Zoom • United States',jopReq: ['Fulltime',
    'Remotely',
    'Senior'],
      subtext:'Zoom • United States',
      salary:'\$12k-15k',
      time: '\n/Month',
      color: Color(0xff091A7A),
      isSelect: true,
      colorText: Colors.white,
  ),

  RecentJobModel(image: 'assets/images/Zoom Logo.png', name: 'Product Designer',option: 'Zoom • United States',subtext:'Zoom • United States'
    ,jopReq: ['Fulltime',
    'Remotely',
    'Senior'],
    salary:'\$12k-15k',
    time: '\n/Month',
      color: Color(0xffF4F4F5),
    isSelect: false,
    colorText: Colors.black,
  ),

  RecentJobModel(image: 'assets/images/Zoom Logo.png', name: 'Product Designer',option: 'Zoom • United States',subtext:'Zoom • United States'
    ,jopReq: ['Fulltime',
    'Remotely',
    'Senior'],
    salary:'\$12k-15k',
    time: '\n/Month',
      color: Color(0xffF4F4F5),
    isSelect: false,
    colorText: Colors.black,
  ),

  RecentJobModel(image: 'assets/images/Zoom Logo.png', name: 'Product Designer',option: 'Zoom • United States',subtext:'Zoom • United States'
    ,jopReq: ['Fulltime',
    'Remotely',
    'Senior'],
    salary:'\$12k-15k',
    time: '\n/Month',
      color: Color(0xffF4F4F5),
    isSelect: false,
    colorText: Colors.black,
  ),

];

List<RecentJobModel> favorites = [];