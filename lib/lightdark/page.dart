import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LightDark extends StatelessWidget {
  const LightDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightDarkController>(
      init: LightDarkController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  controller.check();
                  controller.update();
                },
                child: controller.checkMode ? const Text('Light') : const Text('Dark'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/Card', arguments: null);
                },
                child: const Text('Tap to Card'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.numberAdd();
                },
                child: const Text('Tap to Number +'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.numberRemove();
                },
                child: const Text('Tap to Number -'),
              ),
              Text(
                controller.a.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    color: Colors.red),
              )
            ],
          ),
        );
      },
    );
  }
}
