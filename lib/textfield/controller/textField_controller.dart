import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TextFieldController extends GetxController {
  bool checkPassword = false;
  bool validPassword = false;
  bool validUser = false;
  bool valid = false;
  String errorPassword = '';
  String errorUserName = '';

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void addErrorPassword(String value) {
    errorPassword = value;
    update();
  }

  void addErrorUserName(String value) {
    errorUserName = value;
    update();
  }

  void checkValidPassword(bool value) {
    validPassword = value;
    update();
  }

  void checkValidUser(bool value) {
    validUser = value;
    update();
  }

  void checkValid() {
    if (validUser && validPassword) {
      valid = true;
    } else {
      valid = false;
    }
    update();
  }

  void check() {
    checkPassword = !checkPassword;
    update();
  }
}
