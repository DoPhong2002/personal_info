import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LightDarkController extends GetxController {
  bool checkMode = false;
  int a = 0;

  void numberRemove() {
    a--;
    update();
  }

  void numberAdd() {
    a++;
    update();
  }

  void check() {
    checkMode = !checkMode;
    update();
  }
}
