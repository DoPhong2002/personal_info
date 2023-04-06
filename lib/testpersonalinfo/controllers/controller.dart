import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyController extends GetxController {
  String selectedImagePath = '';
  List<String> listJob = [];
  String selectedExperience = 'Experience';
  String selectedCity = 'Province/city';
  String selectedStreet = 'Street/District';
  String? errorName;
  String? errorNumber;
  String? errorEmail;
  String? errorAddress;
  String? errorDescription;

  final mySwitchValue = ValueNotifier<bool>(false);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  bool onTapAnimated = false;
  bool onTapTag = false;
  bool checkInput = true;
  bool lock = false;
  bool isExpanded = false;
  bool isMissingInput = false;

  bool isPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^(0|\+849)[0-9]{8,10}$');
    return phone.isNotEmpty ? phoneRegex.hasMatch(phone) : true;
  }

  bool isEmail(String email) {
    final emailRegex =
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    return email.isNotEmpty ? emailRegex.hasMatch(email) : true;
  }

  void error1() {
    if (isPhoneNumber(phoneController.text) == false) {
      errorNumber = 'Nhập đúng định dạng số điện thoại..';
    } else if (phoneController.text == '') {
      errorNumber = 'Bắt buộc nhập';
    } else {
      errorNumber = null;
    }
    update();
  }

  void error3() {
    if (nameController.text == '') {
      errorName = 'Bắt buộc nhập';
    } else {
      errorName = null;
    }
    update();
  }

  void error4() {
    if (addressController.text == '') {
      errorAddress = 'Bắt buộc nhập';
    } else {
      errorAddress = null;
    }
    update();
  }

  void error5() {
    if (descriptionController.text == '') {
      errorDescription = 'Bắt buộc nhập';
    } else {
      errorDescription = null;
    }
    update();
  }

  void error2() {
    if (isEmail(emailController.text) == false) {
      errorEmail = 'Nhập đúng định dạng email..';
    } else if (emailController.text == '') {
      errorEmail = 'Bắt buộc nhập';
    } else {
      errorEmail = null;
    }
    update();
  }

  void isLock(VoidCallback onTap) {
    if (lock == false) {
      lock = true;
      onTap();
      update();
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      lock = false;
       update();
    });
  }

  void checkTextField(String string1, String string2) {
    // if (string1.isNotEmpty && string2.isNotEmpty) {
    //   checkInput = true;
    // } else {
    //   checkInput = false;
    // }
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
