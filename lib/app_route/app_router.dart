import 'package:flutter/material.dart';
import 'package:jobsque/view/message/chat_screen.dart';
import 'package:jobsque/view/message/messages_screen.dart';
import 'package:jobsque/view/message/un_archived_screen.dart';
import 'package:jobsque/view/on_boarding/on_boarding_screen.dart';
import 'package:jobsque/view/save/saved_screen.dart';
import '../model/job_model/job_data_model.dart';
import '../view/applied_job/applied_job_screen.dart';
import '../view/apply_now/apply_job_step.dart';
import '../view/apply_now/apply_step/apply_successfully_screen.dart';
import '../view/apply_now/job_info_details_screen/job_details_screen.dart';
import '../view/home/home_screen.dart';
import '../view/layout/layout_screen.dart';
import '../view/login/check_email_screen.dart';
import '../view/login/forget_password_screen.dart';
import '../view/login/login_screen.dart';
import '../view/login/reset_password_screen.dart';
import '../view/message/unread_screen.dart';
import '../view/login/password_changed_successfully_screen.dart';
import '../view/profile/complete_profile_screen/complete_profile_screen.dart';
import '../view/profile/complete_profile_screen/complete_profile_steps/education_screen.dart';
import '../view/profile/complete_profile_screen/complete_profile_steps/experience_screen.dart';
import '../view/profile/complete_profile_screen/complete_profile_steps/portfolio_complete_screen.dart';
import '../view/profile/general_page/pdf_args.dart';
import '../view/profile/general_page/pdf_screen.dart';
import '../view/profile/profile_screen.dart';
import '../view/profile/complete_profile_screen/complete_profile_steps/edit_personal_screen.dart';
import '../view/profile/general_page/login_security_screen.dart';
import '../view/register/interested_work_screen.dart';
import '../view/register/preferred_location_register_screen.dart';
import '../view/register/register_screen.dart';
import '../view/register/success_register_screen.dart';
import '../view/search/search_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_route.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
  switch(routeSettings.name) {
    case(AppRouters.splashPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      }
    case(AppRouters.onboardPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      }


    case(AppRouters.loginPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      }
    case(AppRouters.registerPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      }
      case(AppRouters.interestedWorkScreenPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const InterestedWorkScreen());
      }
      case(AppRouters.preferredLocationPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const PreferredLocationScreen());
      }
      case(AppRouters.successRegisterPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SuccessRegisterScreen());
      }
      case(AppRouters.resetPasswordPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
      }
      case(AppRouters.checkEmailPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const CheckEmailScreen());
      }
      case(AppRouters.forgetPasswordPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());
      }
      case(AppRouters.passwordChangedPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const PasswordChangedSuccessfullyScreen());
      }


    case(AppRouters.layoutPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      }


      case(AppRouters.homePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      }
      case(AppRouters.searchPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      }

      case(AppRouters.jobDetailsPageRoute):
      {
        final args = routeSettings.arguments as JobDataModel;
        return MaterialPageRoute(builder: (context) =>JobDetailsScreen(jobDataModel: args,));
      }


    case(AppRouters.applyJobStepPageRoute):
      {
        final args = routeSettings.arguments as JobDataModel;
        return MaterialPageRoute(builder: (context) =>ApplyJobStepScreen(jobDataModel: args,));
      }
      case(AppRouters.applySuccessfullyPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const ApplySuccessfullyScreen());
      }

      case(AppRouters.messagePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const MessagesScreen());
      }
    case (AppRouters.chatPageRoute) :
      {
        return MaterialPageRoute(builder: (context) => const ChatScreen(),
          settings: routeSettings);
      }
    case(AppRouters.unreadPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const UnreadScreen());
      }
    case(AppRouters.unArchivedPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const UnArchivedScreen());
      }

    case(AppRouters.appliedPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const AppliedJobScreen());
      }


    case(AppRouters.savedPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const SavedScreen());
      }


    case(AppRouters.completeProfilePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const CompleteProfileScreen());
      }
      case(AppRouters.editDetailsPageRoute):
      {
        return MaterialPageRoute(builder: (context) =>  const EditDetailsScreen());
      }
      case(AppRouters.educationPageRoute):
      {
        return MaterialPageRoute(builder: (context) =>  const EducationScreen());
      }
      case(AppRouters.experiencePageRoute):
      {
        return MaterialPageRoute(builder: (context) =>  const ExperienceScreen());
      }
      case(AppRouters.portfolioCompletePageRoute):
      {
        return MaterialPageRoute(builder: (context) =>  const PortfolioCompleteScreen());
      }
    case(AppRouters.pdfScreenPageRoute):
      {
        final args = routeSettings.arguments as PdfScreenArguments;
        return MaterialPageRoute(builder: (context) => PDFSViewerScreen(text: args.text, selectedCV: args.file,));
      }


    case(AppRouters.profilePageRoute):
      {
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      }
    case(AppRouters.loginSecurityPageRoute):
      {
        return MaterialPageRoute(builder: (context) => const LoginSecurityScreen());
      }


    default:
      return null;
      }

}

