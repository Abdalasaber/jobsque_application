import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/view/profile/complete_profile_screen/complete_profile_screen.dart';
import '../../enums.dart';
import '../../local_database/cache_helper.dart';
import '../../view/applied_job/applied_job_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/message/messages_screen.dart';
import '../../view/profile/profile_screen.dart';
import '../../view/save/saved_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  void getCompleteProfile(){
    if (CashHelper.getString(key: MyKeyCache.completeProfile) == 'true') {
      screens[4] = const ProfileScreen();
    } else {
      screens[4] = const CompleteProfileScreen();
      // screens[4] = const LoginScreen();
    }
  }

  List<Widget> screens =  [
    const HomeScreen(),
    const MessagesScreen(),
    const AppliedJobScreen(),
    const SavedScreen(),
    const CompleteProfileScreen()
  ];

  List<String> labels = [
    'Home',
    'Messages',
    'Applied',
    'Saved',
    'Profile'
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNacBarState());
  }
}
