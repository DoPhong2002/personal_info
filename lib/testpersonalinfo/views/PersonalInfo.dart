// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, prefer_const_constructors

// ignore: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_test/testpersonalinfo/controllers/controller.dart';
import 'package:getx_test/testpersonalinfo/widgets/myTextField.dart';
import 'package:getx_test/testpersonalinfo/widgets/tag.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  final mySwitchValue = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
        init: MyController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfff6E6EFF),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35),
                                bottomLeft: Radius.circular(35),
                              ),
                            ),
                            child: Container(
                              height: 167,
                              margin: const EdgeInsets.only(
                                  right: 32.5, left: 32.5),
                              decoration: BoxDecoration(
                                color: Color(0xfff6E6EFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 87),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/assets_info/icons8-camera-96.png',
                                        width: 27,
                                        height: 27,
                                      ),
                                      Text(
                                        "Personal Info",
                                        style: GoogleFonts.notoSans(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 27)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfff6E6EFF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 23),
                                    buildAvat(controller, context),
                                    const MyTextField(
                                      text: 'Your name',
                                      keyboardType: TextInputType.name,
                                    ),
                                    const SizedBox(height: 19),
                                    const MyTextField(
                                      text: 'Phone number',
                                      keyboardType: TextInputType.number,
                                    ),
                                    const SizedBox(height: 19),
                                    const MyTextField(
                                      text: 'Email',
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(height: 19),
                                    buildPlaceholder(),
                                    const SizedBox(height: 23),
                                    buildAddress(controller),
                                    const SizedBox(height: 19),
                                    buildExperience(controller),
                                    const SizedBox(height: 16),
                                    buildDescription(),
                                    const SizedBox(height: 16),
                                    buildSwitch(),
                                    const SizedBox(height: 14),
                                    buildJobType(controller),
                                    const SizedBox(height: 45),
                                    buildSave()
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget buildAvat(MyController controller, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 101.0,
          height: 101.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                100.0), // set độ cong cho border nếu muốn bo cạnh
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: controller.selectedImagePath == ''
                ? Image.asset(
                    'assets/assets_info/hinh-anh-3d.jpg',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(controller.selectedImagePath),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        CircleAvatar(
          radius: 50.5,
          backgroundColor: const Color(0xfff000000).withOpacity(0.2),
          child: InkWell(
              onTap: () {
                showCustomDialog(context, controller);
                print('hello');
              },
              child: Image.asset('assets/assets_info/icons8-camera-96.png')),
        ),
        // Positioned.fill(
        //   child: Align(
        //     alignment: Alignment.center,
        //     child:
        //   ),
        // )
      ],
    );
  }

  Widget buildPlaceholder() {
    return SizedBox(
      height: 51,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Link",
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xfff38385E),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "ADD",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Color(0xfffB1B8C7),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12.5,
                      backgroundColor: const Color(0xfffE2DDDD),
                      child: Image.asset(
                          'assets/assets_info/icons8-facebook-messenger-150.png'),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "daovu197",
                      style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: Color(0xfff38385E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "remove",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 11,
                      color: Color(0xfffF02353),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildAddress(MyController controller) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Address",
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xfff38385E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 12.5, bottom: 15.5, right: 10.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xfffF9F9FB)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedAddress == ''
                                  ? "Province/city"
                                  : controller.selectedAddress,
                              style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xfffB1B8C7),
                                ),
                              ),
                            ),
                            buildMenu(controller)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 12.5, bottom: 15.5, right: 10.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xfffF9F9FB)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedAddress == ''
                                  ? "Province/city"
                                  : controller.selectedAddress,
                              style: GoogleFonts.notoSans(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xfffB1B8C7),
                                ),
                              ),
                            ),
                            buildMenu(controller)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xfffF9F9FB)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 20.0, top: 12.5, bottom: 15.5),
                          ),
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xfff1F1F39),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildExperience(MyController controller) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Experience",
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xfff38385E),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, top: 12.5, bottom: 15.5, right: 10.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfffF9F9FB)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.selectedAddress == ''
                    ? "Province/city"
                    : controller.selectedAddress,
                style: GoogleFonts.notoSans(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xfffB1B8C7),
                  ),
                ),
              ),
              buildMenu(controller)
            ],
          ),
        )
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
            ),
          ),
        ),
        const SizedBox(height: 9),
        Container(
          height: 118,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xfffF9F9FB),
            // color: Colors.red,
          ),
          child: TextField(
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Description\n\n\n\n\n\n',
              hintStyle: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xfffB1B8C7),
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 20, top: 15),
            ),
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xfff1F1F39),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildSwitch() {
    return Row(
      children: [
        AdvancedSwitch(
          controller: mySwitchValue,
          height: 24,
          width: 40,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          activeColor: const Color(0xfff3845AB),
          inactiveColor: const Color(0xfff3845AB),
          thumb: InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.all(2),
                  child: SvgPicture.asset(
                    'assets/assets_info/Rectangle 24.svg',
                  ))),
        ),
        const SizedBox(width: 9),
        Text(
          'Worker',
          style: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildJobType(MyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Type',
          style: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 14.0,
            runSpacing: 11.0,
            children: const [
              MyTag(textJob: 'text b'),
              MyTag(textJob: 'textadsfb'),
              MyTag(textJob: 'wqer'),
              MyTag(textJob: 'texsdffstJob'),
              MyTag(textJob: 'texsdffstfsdJob')
            ],
          ),
        )
      ],
    );
  }

  Widget buildSave() {
    return Container(
      height: 46,
      padding: const EdgeInsets.only(top: 14.6, bottom: 12.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xfff3845AB)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            'Save',
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffffffff),
              ),
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  void showCustomDialog(BuildContext context, MyController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          content: const SizedBox(
            height: 150,
            width: 300,
            child: Center(
              child: Text("zozo!"),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              onTap: () async {
                controller.selectedImagePath =
                    await controller.selectImageFromCamera();
                print('Image_Path:-');
                print('show Url: ${controller.selectedImagePath}');

                if (controller.selectedImagePath != '') {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("No Image Captured !"),
                  ));
                }
                controller.update();
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [Icon(Icons.camera)],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildMenu(MyController controller) {
    return PopupMenuButton<int>(
      offset: const Offset(0, 0),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 0,
            child: Text(
              'Ha Noi',
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            )),
        PopupMenuItem<int>(
          value: 1,
          child: Text(
            'TP HCM',
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Text(
            'Da Nang',
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 3,
          child: Text(
            'Hai Phong',
            style: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            controller.onTapAddress('Ha Noi');
            break;
          case 1:
            controller.onTapAddress('TP HCM');
            break;
          case 2:
            controller.onTapAddress('Da Nang');
            break;
          case 3:
            controller.onTapAddress('Hai Phong');
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.arrow_drop_down,
            size: 16,
          ),
        ],
      ),
    );
  }
}
 