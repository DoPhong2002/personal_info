import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:getx_test/testadobexd/common/card.dart';
import 'package:getx_test/testadobexd/const/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'controller/wrapper_controller.dart';

class TestAdobeXD extends StatefulWidget {
  const TestAdobeXD({Key? key}) : super(key: key);

  @override
  State<TestAdobeXD> createState() => _TestAdobeXDState();
}

class _TestAdobeXDState extends State<TestAdobeXD> {
  final mySwitchValue = ValueNotifier<bool>(false);
  final WrapperController wrapperController = Get.put(WrapperController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        // backgroundColor: const Color(0xffff7f7fa),
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
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          child: buildTitleAvatar(),
                          padding: const EdgeInsets.only(right: 30, left: 30),
                        ),
                        const SizedBox(height: 26),
                        buildABigCard(),
                        buildCard(),
                        const SizedBox(height: 25),
                        buildScooterOptions(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
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
                ? const Color(0xfff4354dd)
                : null,
            width: 23,
            height: 22,
          ),
          const SizedBox(height: 10),
          Image.asset(
            '${baseAssets}Ellipse 11.png',
            height: 4,
            width: 4,
          )
        ],
      ),
    );
  }

  Widget buildTitleAvatar() {
    return Row(
      children: [
        Image.asset('assets/Avatar.png'),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Mike!",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color(0xfff000b22),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Welcome back to your account",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xfffb0b3ba),
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('object');
          },
          child: Image.asset('${baseAssets}Menu Button.png'),
        )
      ],
    );
  }

  Widget buildABigCard() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 353,
          height: 271,
        ),
        Positioned(
          top: 16,
          child: Container(
            width: 235,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xfffbdc9f9),
              borderRadius: BorderRadius.circular(20),
              // boxShadow:   [
              //   BoxShadow(
              //     color: Color(0xFFF000000),
              //     blurRadius: 5,
              //     spreadRadius: 3,
              //   )
              // ],
            ),
          ),
        ),
        Positioned(
          top: 26,
          child: Container(
            width: 275,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xfff95a9f7),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 36,
          child: Container(
            width: 315,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xfff3e64ff),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          left: 40,
          width: 333,
          height: 271,
          child: Stack(
            children: [
              Image.asset('${baseAssets}pngfuel 12.png'),
              Positioned(
                top: 66,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We updated your scooter!",
                      style: GoogleFonts.rubik(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Reach up to 45km of range\nwith the new soft.",
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: const Color(0xfffffffff).withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 51,
                right: 53,
                child: InkWell(
                  onTap: () {
                    print('close');
                  },
                  child: Image.asset('${baseAssets}close_11.png'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 150 / 81),
        itemBuilder: (context, index) {
          return const MyCard(
              title: 'title', speed: 'speed', color: Colors.red);
        },
        itemCount: 4,
      ),
    );
  }

  Widget buildScooterOptions() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xfffb0b3ba).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset('${baseAssets}padlock (1).png'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mike’s Scooter',
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color(0xfff000b22),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'LOCKED',
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Color(0xfffb0b3ba),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AdvancedSwitch(
              controller: mySwitchValue,
              enabled: true,
              height: 22,
              width: 38,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              activeColor: const Color(0xfff3e64ff),
              thumb: InkWell(
                onTap: () {
                  print(mySwitchValue.value);
                },
                child: Image.asset('${baseAssets}Ellipse 10.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
