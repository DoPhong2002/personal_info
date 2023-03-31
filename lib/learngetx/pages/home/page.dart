import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
            actions: [],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              IconButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  controller.checkThemeMode();
                  controller.update();
                },
                icon: controller.checkTheme
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.add();
                      },
                      icon: const Icon(Icons.add)),
                  const SizedBox(
                    width: 32,
                  ),
                  IconButton(
                      onPressed: () {
                        controller.remove();
                      },
                      icon: const Icon(Icons.remove)),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text('Count: ${controller.count}'),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Product'),
                onTap: () {},
                onChanged: (val) {
                  controller.product = val;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const Text('List Product'),
              const SizedBox(
                height: 32,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text('Product ${index + 1} :'),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(controller.product),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.products.length,
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    controller.addProduct(controller.product);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blueAccent,
                    child: const Text('Add Product'),
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  const Text('Manga favorite'),
                  IconButton(
                    onPressed: () {
                      controller.checkFavorite();
                    },
                    icon: controller.check
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/LightDark', arguments: null);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.blueAccent,
                        child: const Text('Send Data'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/LightDark', arguments: null);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.blueAccent,
                        child: const Text('Next Cart Page'),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/Manga', arguments: controller.products);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.blueAccent,
                    child: const Text('Send List Product '),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
