import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/view/profile/others_page/help_screen.dart';
import 'package:jobsque/view/profile/others_page/privacy_policy_screen.dart';
import 'package:jobsque/view/profile/others_page/terms_conditions_screen.dart';
import '../../view/profile/complete_profile_screen/complete_profile_steps/edit_personal_screen.dart';
import '../../view/profile/general_page/language_profile_screen.dart';
import '../../view/profile/general_page/login_security_screen.dart';
import '../../view/profile/general_page/notification_profile_screen.dart';
import '../../view/profile/general_page/portfolio_screen.dart';

class ProfileModel{

  Widget screens;
  String title;
  IconData icon;
  IconData iconArrow ;


  ProfileModel({
    required this.screens,
    required this.title,
    required this.icon,
    required this.iconArrow,
  });
}
List<ProfileModel> itemProfileModel=[

  ProfileModel(screens: const EditDetailsScreen(), title: 'Edit Profile', icon: Iconsax.frame_1, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const PortfolioScreen(), title: 'Portfolio', icon: Iconsax.folder_favorite, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const LanguageProfileScreen(), title: 'Language', icon: Iconsax.global, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const NotificationProfileScreen(), title: 'Notification', icon: Iconsax.notification, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const LoginSecurityScreen(), title: 'Login And Security', icon: Iconsax.lock, iconArrow: Iconsax.arrow_right_1),

  ];
List<ProfileModel> itemOthers=[

  ProfileModel(screens: const HelpScreen(), title: 'Accesibillity', icon: Iconsax.frame_1, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const HelpScreen(), title: 'Help Center', icon: Iconsax.frame_1, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const TermsConditionsScreen(), title: 'Terms & Conditions', icon: Iconsax.frame_1, iconArrow: Iconsax.arrow_right_1),
  ProfileModel(screens: const PrivacyPolicyScreen(), title: 'Privacy Policy', icon: Iconsax.lock, iconArrow: Iconsax.arrow_right_1),

  ];