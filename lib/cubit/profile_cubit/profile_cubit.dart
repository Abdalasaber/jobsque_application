import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/enums.dart';
import '../../local_database/cache_helper.dart';
import '../../model/edit_personal_model/edit_personal_model.dart';
import '../../model/profile_model/profile_model.dart';
import '../../remote_database/dio_helper.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../../remote_database/endpoints.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  bool isCheck = false;
  var formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var myCountry = CountryCode(name: "EG", dialCode: "+20");


  final TextEditingController universityController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startYearController = TextEditingController();
  final TextEditingController endYearController = TextEditingController();
  final List<Map<String, String>> entriesEducation = [];

  final TextEditingController positionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startYearExperienceController =
  TextEditingController();
  final List<Map<String, String>> entriesExperience = [];

  bool isChecked = false;

  void changeCheck(newValue){
    isChecked=newValue;
    emit(ChangeCheckExperienceState());
  }
  checkButton(newCheck) {
    isCheck = newCheck!;
    emit(CurrentLocationState());
  }
  addEducation() {
    entriesEducation.add({
      'University': universityController.text,
      'Major': titleController.text,
      'Start': startYearController.text,
      'End': endYearController.text,
    });
    emit(AddEducationState());
  }
  void removeEducation(int index) {
    entriesEducation.removeAt(index);
    emit(RemoverEducationState());
  }

  addExperience() {
    entriesExperience.add({
      'Position': positionController.text,
      'Type': typeController.text,
      'Company': companyController.text,
      'location': locationController.text,
      'Start': startYearExperienceController.text,
    });
    emit(AddExperienceState());
  }
  void removeExperience(int index) {
    entriesExperience.removeAt(index);
    emit(RemoverExperienceState());
  }


  Set<String> completeProfile = {};

  void addItem(String item) {
    emit(AddItemCompleteProfileLoading());
    completeProfile.add(item);
    if (completeProfile.length == 4) {
      CashHelper.putString(key: MyKeyCache.completeProfile, value: 'true');
    }
    emit(AddItemCompleteProfileSuccess());
  }

  void addProfileItem(String item) {
    emit(AddProfileItemCompleteProfileLoading());
    completeProfile.add(item);
    if (completeProfile.length == 0 || completeProfile.length == 1 || completeProfile.length == 2 || completeProfile.length == 3) {
      CashHelper.putString(key: MyKeyCache.completeProfile, value: 'true');
    }
    emit(AddProfileItemCompleteProfileSuccess());
  }

  void addExpItem(String item) {
    emit(AddExperienceItemCompleteProfileLoading());
    completeProfile.add(item);
    if (completeProfile.length == 0 || completeProfile.length == 1 || completeProfile.length == 2 || completeProfile.length == 3) {
      CashHelper.putString(key: MyKeyCache.completeProfile, value: 'true');
      emit(AddExperienceItemCompleteProfileSuccess());
    } else{
      emit(AddExperienceItemCompleteProfileError());
    }

  }

  List<Portfolio> portfolios = [];
  List<Profile> profileDetails = [];

  getProfileDetailsAndPortfolios() {
    emit(GetPortfolioLoading());
    DioHelper.getData(url: portfolioEndPoint)
        .then((value) {
      // print(value.data);
      for (var portfolio in value.data['data']['portfolio']) {
        portfolios.add(Portfolio.fromJson(portfolio));
        // ignore: avoid_print
        print(portfolio);
      }
      profileDetails.add(Profile.fromJson(value.data['data']['profile']));
      // ignore: avoid_print
      print(profileDetails[0]);
      emit(GetPortfolioSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetPortfolioError());
    });
  }


  File? selectedCVFile;
  File? selectedOtherFile;


  Future<void> pickFile(String target) async {
    emit(PickCVLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: target == 'CV' ? ['pdf'] : ['jpg', 'png','heic','jpeg','gif','svg'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      if (target == 'CV') {
        selectedCVFile = file;
      } else if (target == 'Other') {
        selectedOtherFile = file;
      }
      emit(PickCVSuccess());
    } else {
      emit(PickCVError());
      return;
    }
  }

  List<ProfileData> profile=[];
  getProfileNameAndEmail(){
    profileDetails.clear();
    profile.clear();
    emit(GetProfileLoading());
    DioHelper.getData(url: profileEndPoint)
        .then((value) {
      // print(value.data);
      profile.add(ProfileData.fromJson(value.data['data']) );
      emit(GetProfileSuccessfully());
    })
        .catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GetProfileError());
    });
  }
  void updateProfileNameAndPassword(
      {
        required String name,
        required String password,
      }
      )
  {
    emit(UpdateProfileLoading());
    DioHelper.PostData(url: updateProfileEndPoint, data: {
      'name': name,
      'password':password,
    },
    ).then((value) {
      profile.clear();
      profileDetails.clear();
      getProfileNameAndEmail();
      emit(UpdateProfileSuccessfully(
      ));
    }).catchError((error) {
      // ignore: avoid_print
      print('The error is $error');
      emit(UpdateProfileError());
    });
  }

  void updateUserData(
      {
        required String interestedWork,
        required String mobile,
        required String address,
        required String bio,
      }
      )
  {
    emit(UpdateProfileDetailsLoading());
    DioHelper.PutData(url: editProfile, data: {
      'interested_work': interestedWork,
      'mobile':mobile,
      'address':address,
      'bio':bio
    },
    ).then((value) {
      profileDetails.clear();
      profile.clear();
      // ignore: avoid_print
      print(value.data);
      getProfileDetailsAndPortfolios();
      emit(UpdateProfileDetailsSuccessfully());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(UpdateProfileDetailsError());
    });
  }
  void addPortofolio(
      ) async {
    try {
      emit(AddCVLoadingState());
      FormData formData = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(selectedCVFile!.path),
        'image': await MultipartFile.fromFile(selectedCVFile!.path),

      });

      final response = await DioHelper.PostFormData(url: portfolioEndPoint, data: formData);

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.data);
        getProfileDetailsAndPortfolios();
        emit(AddCVSuccessState());
      } else {
        // ignore: avoid_print
        print('Request failed with status: ${response.statusCode}');
        emit(AddCVErrorState());
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
      emit(AddCVErrorState());
    }
  }


  File? savedImage;
  Future<void> pickAndSaveProfileImage() async {
    final ImagePicker picker = ImagePicker();
    emit(PickImageLoading());
    try {
      final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
      if (imageFile == null) {
        emit(PickImageError());
        return;
      }
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/profile_image.png';
      // ignore: avoid_print
      print(' from picked $imagePath');
      final File oldImage = File(imagePath);
      if (await oldImage.exists()) {
        await oldImage.delete();
      }
      savedImage = await File(imageFile.path).copy(imagePath);
      emit(PickImageSuccess());
    } catch (e) {
      // ignore: avoid_print
      print("Error picking and saving image: $e");
      emit(PickImageError());
    }
  }

  Future<void> loadSavedProfileImage() async {
    emit(GetImageLoading());

    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/profile_image.png';
      // ignore: avoid_print
      print(' from device load $imagePath');

      savedImage = File(imagePath);

      if (await savedImage!.exists()) {
        emit(GetImageSuccess());
      }
      else{
        savedImage=null;
        emit(GetImageError());

      }
    } catch (e) {
      // ignore: avoid_print
      print("Error loading saved profile image: $e");
      emit(GetImageError());

    }
  }



}
