import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MangaPage extends StatelessWidget {
  MangaPage({Key? key}) : super(key: key);
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MangaController>(
        init: MangaController(),
        builder: (controller) {
          return Scaffold(
            appBar:AppBar(title: Text('Manga Page'),),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  data.toList().length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.toList().length,
                          itemBuilder: (context, index) {
                            final product = data.toList()[index];
                            return Text(product);
                          })
                      : const Center(
                          child: Text('Chưa có dữ liệu'),
                        )
                ],
              ),
            ),
          );
        });
  }
}
