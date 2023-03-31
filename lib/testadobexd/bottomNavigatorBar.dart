import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_test/learngetx/pages/home/page.dart';
import 'package:getx_test/testadobexd/const/const.dart';
import 'package:getx_test/testadobexd/controller/wrapper_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'page.dart';
import '../testtable/testTable.dart';

class Bar extends StatelessWidget {
  Bar({super.key});

  final WrapperController wrapperController = Get.put(WrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: wrapperController.pageController,
          physics: const BouncingScrollPhysics(),
          children: const [TestAdobeXD(), HomePage(), MyStatefulWidget()],
        ),
      ),
      bottomNavigationBar: Container(
        height: 93,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomAppBar(
                context,
                icon: '${baseAssets}home.png',
                page: 0,
              ),
              _bottomAppBar(
                context,
                icon: '${baseAssets}pin.png',
                page: 1,
              ),
              _bottomAppBar(
                context,
                icon: '${baseAssets}setting.png',
                page: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBar(BuildContext context, {required icon, required page}) {
    return ZoomTapAnimation(
      onTap: () {
        wrapperController.goToTab(page);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            color: wrapperController.currentPage.value == page
                ? const Color(0xfff4354DD)
                : null,
            width: 23,
            height: 22,
          ),
          Image.asset(
            '${baseAssets}Ellipse 11.png',
            height: 4,
            width: 4,
          )
        ],
      ),
    );
  }
}
