import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_profile_state.dart';

class LanguageProfileCubit extends Cubit<LanguageProfileState> {
  LanguageProfileCubit() : super(LanguageProfileInitial());

  static LanguageProfileCubit get(context)=>BlocProvider.of(context);

  bool isCheck = false;
  bool isSelected=false;

  int selectedChoice=1;

  void choice(value){
      selectedChoice=value;
      emit(SelectChoicesState());
  }

}
