import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/enums.dart';

import '../../local_database/cache_helper.dart';
import '../../view/profile/general_page/login_security_pages/Two_step_verification_screen.dart';
import '../../view/profile/general_page/login_security_pages/change_password_logins_security_screen.dart';
import '../../view/profile/general_page/login_security_pages/email_address_login_security_screen.dart';
import '../../view/profile/general_page/login_security_pages/phone_number_logins_security_screen.dart';

class LoginSecurityModel{
  String title;
  String subtitle;
  IconData icon;
  Widget screen;


  LoginSecurityModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.screen
  });
}

List<LoginSecurityModel> itemLoginSecurityModel=[
  LoginSecurityModel(screen: const EmailAddressLoginSecurityScreen(),title: 'Email address', subtitle: '${CashHelper.getString(key: MyKeyCache.email)}',icon: Iconsax.arrow_right_1),
  LoginSecurityModel(screen: const PhoneNumberLoginsSecurityScreen(),title: 'Phone Number', subtitle:'',icon: Iconsax.arrow_right_1),
  LoginSecurityModel(screen: const ChangePasswordLoginsSecurityScreen(),title: 'Change Password', subtitle:'',icon: Iconsax.arrow_right_1),
  LoginSecurityModel(screen: const TwoStepVerificationLScreen(),title: 'Two-step verification', subtitle: 'Non active',icon: Iconsax.arrow_right_1),
  LoginSecurityModel(screen: const EmailAddressLoginSecurityScreen(),title: 'Face ID', subtitle:'',icon: Iconsax.arrow_right_1),
];