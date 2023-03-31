import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/learngetx/pages/cart/controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cart Page'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Manga: '),
                  const SizedBox(
                    height: 16,
                  ),
                  data != null
                      ? Text('Manga: ${data.toString()}')
                      : const Center(
                          child: Text(
                            'Chưa có dữ liệu',
                          ),
                        ),

                ],
              ),
            ),
          );
        });
  }
}
