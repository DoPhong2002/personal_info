import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24)),
                                    Text(
                                        '${controller.products[index].productDescription}',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.products.length,
                );
              }),
            ),
            const Text('Total amount:'),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
