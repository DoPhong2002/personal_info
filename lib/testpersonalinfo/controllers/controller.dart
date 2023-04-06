import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyController extends GetxController   {

  String selectedImagePath = '';
  List<String> listJob = [];
  String selectedExperience = 'Experience';
  String selectedCity = 'Province/city';
  String selectedStreet = 'Street/District';

  final mySwitchValue = ValueNotifier<bool>(false);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  bool onTapAnimated = false;
  bool onTapTag = false;
  bool checkInput = false;
  bool lock = false;
  bool isExpanded = false;
  void isLock(VoidCallback onTap) {

    if (lock == false && checkInput) {
      lock = true;
       onTap();
      update();
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      lock = false;
    });
    update();
  }

  void checkTextField(String string1, String string2) {
    if (string1.isNotEmpty && string2.isNotEmpty) {
      checkInput = true;
    } else {
      checkInput = false;
    }
    update();
  }

  void startAnimation() async {
    onTapAnimated = !onTapAnimated;
    update();
  }
  void tagSelected() async {
    onTapTag = !onTapTag;
    update();
  }



  void onAddListJob(String s) {
    listJob.add(s);
    update();
  }
  void onRemoveListJob(String s) {
    listJob.remove(s);
    update();
  }

  void onAddCity(String s) {
    selectedCity = s;
    update();
  }

  void onAddStreet(String s) {
    selectedStreet = s;
    update();
  }

  void onAddExperience(String s) {
    selectedExperience = s;
    update();
  }

  void onTapMenu() {
    isExpanded = !isExpanded;
    update();
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}