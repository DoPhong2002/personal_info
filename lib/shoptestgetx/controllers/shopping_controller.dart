import 'package:get/get.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(1, 'Chicken', "abc", 'some', 30),
      Product(1, 'Dog', "abc", 'some', 50),
      Product(1, 'Cat', "abc", 'some', 40),
      Product(1, 'Mew', "abc", 'some', 80),
    ];
    products.value = productResult;
  }
}
