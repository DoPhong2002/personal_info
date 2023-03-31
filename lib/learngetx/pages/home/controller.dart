import 'package:get/get.dart';

class HomeController extends GetxController {
  int count = 0;
  String product = '';
  bool check = false;

  bool checkTheme = false;
  List<String> products = [];
  void add() {
    count++;
    update();
  }
  void remove() {
    count--;
    update();
  }

  void addProduct(String product) {
    products.add(product);
    update();
  }
  void checkFavorite() {
    check = !check;
    update();
  }

  void checkThemeMode() {
    checkTheme = !checkTheme;
    update();
  }
}