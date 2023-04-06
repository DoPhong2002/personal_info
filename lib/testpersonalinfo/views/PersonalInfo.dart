// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, prefer_const_constructors

// ignore: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_test/testpersonalinfo/controllers/controller.dart';
import 'package:getx_test/testpersonalinfo/widgets/tag.dart';
import '../widgets/addressType.dart';
import '../widgets/myTextField.dart';

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

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
                          height: 167,
                          padding:
                              const EdgeInsets.only(right: 32.5, left: 32.5),
                          decoration: BoxDecoration(
                              color: Color(0xfff6E6EFF),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35),
                                bottomLeft: Radius.circular(35),
                              ),
                              border: Border.all(
                                  color: Color(0xfff6E6EFF), width: 0)),
                          child: Column(
                            children: [
                              const SizedBox(height: 87),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/assets_info/Back.svg',
                                    width: 27,
                                    height: 27,
                                  ),
                                  Text(
                                    "Personal Info",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffffffff),
                                        fontFamily: "NotoSans-SemiBold"),
                                  ),
                                  const SizedBox(width: 27)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff6E6EFF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                              ),
                              border: Border.all(
                                  color: Color(0xfff6E6EFF), width: 0)),
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
                                  buildAvatar(controller, context),
                                  const SizedBox(height: 18),
                                  MyTextField(
                                      controller2: controller,
                                      hintText: 'Your name',
                                      titleText: 'Your name',
                                      errorText: controller.errorName,
                                      keyboardType: TextInputType.name,
                                      controller: controller.nameController,
                                      onChange: (_) {
                                        controller.checkTextField(
                                          controller.phoneController.text,
                                          controller.nameController.text,
                                        );
                                        controller.error3();
                                      }),
                                  const SizedBox(height: 19),
                                  MyTextField(
                                    controller2: controller,
                                    titleText: 'Phone number',
                                    hintText: 'Phone number',
                                    errorText: controller.errorNumber,
                                    keyboardType: TextInputType.number,
                                    controller: controller.phoneController,
                                    onChange: (_) {
                                      controller.checkTextField(
                                          controller.phoneController.text,
                                          controller.nameController.text);
                                      controller.error1();
                                    },
                                  ),
                                  const SizedBox(height: 19),
                                  MyTextField(
                                    controller2: controller,
                                    titleText: 'Email',
                                    hintText: 'Email',
                                    errorText: controller.errorEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: controller.emailController,
                                    onChange: (_) {
                                      controller.checkTextField(
                                          controller.phoneController.text,
                                          controller.nameController.text);
                                      controller.error2();
                                    },
                                  ),
                                  const SizedBox(height: 19),
                                  buildPlaceholder(),
                                  const SizedBox(height: 23),
                                  buildAddress(controller),
                                  const SizedBox(height: 19),
                                  buildExperience(controller),
                                  const SizedBox(height: 16),
                                  buildDescription(controller),
                                  const SizedBox(height: 16),
                                  buildSwitch(controller),
                                  const SizedBox(height: 14),
                                  buildAnimated(controller),
                                  buildSave(controller),
                                  const SizedBox(height: 23),
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
      },
    );
  }

  Widget buildAvatar(MyController controller, BuildContext context) {
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
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xfff38385E),
                    fontFamily: "NotoSans-Bold"),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Add",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xfffB1B8C7),
                      fontFamily: "NotoSans-Bold"),
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
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xfff38385E),
                          fontFamily: "NotoSans-Bold"),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "remove",
                  style: TextStyle(
                      fontSize: 11,
                      color: Color(0xfffF02353),
                      fontFamily: "NotoSans-Bold"),
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
            children: const [
              Text(
                "Address",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xfff38385E),
                    fontFamily: "NotoSans-Bold"),
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
                      child: AddressType(
                        address: controller.selectedCity,
                        cities: const [
                          'function',
                          'em bé',
                          'dinh dưỡng',
                          'gạo'
                        ],
                        controller: controller,
                        onPressed: controller.onAddCity,
                      ),
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: AddressType(
                        address: controller.selectedStreet,
                        cities: const ['chả lá ', 'bí đao', 'con sâu', 'da cá'],
                        controller: controller,
                        onPressed: controller.onAddStreet,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xfffF9F9FB)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (_) => controller.error4(),
                              controller: controller.addressController,
                              maxLines: 1,
                              minLines: 1,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Address info',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xfffB1B8C7),
                                      fontFamily: "NotoSans-Regular"),
                                  contentPadding: EdgeInsets.only(
                                      left: 20.0, top: 12.5, bottom: 15.5),
                                  counterText: ''),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xfff1F1F39),
                                  fontFamily: "NotoSans-Regular"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (controller.errorAddress != null) ...{
                      Text(
                        '*${controller.errorAddress}',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.red,
                          fontFamily: "NotoSans-Regular",
                        ),
                      ),
                    },
                  ],
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
          children: const [
            Text(
              "Experience",
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xfff38385E),
                  fontFamily: "NotoSans-Bold"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AddressType(
          address: controller.selectedExperience,
          cities: const ['con chim', 'bong da', 'cuc cu', 'dam nhau'],
          controller: controller,
          onPressed: controller.onAddExperience,
        )
      ],
    );
  }

  Widget buildDescription(MyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
              fontFamily: "NotoSans-Bold"),
        ),
        const SizedBox(height: 9),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xfffF9F9FB),
                // color: Colors.red,
              ),
              child: TextField(
                onChanged: (_) => controller.error5(),
                controller: controller.descriptionController,
                minLines: 1,
                maxLines: 4,
                maxLength: 50,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Description\n\n\n\n\n\n',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xfffB1B8C7),
                      fontFamily: "NotoSans-Regular"),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 20, top: 15),
                ),
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xfff1F1F39),
                    fontFamily: "NotoSans-Regular"),
              ),
            ),
            if (controller.errorDescription != null) ...{
              Text(
                '*${controller.errorDescription}',
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.red,
                  fontFamily: "NotoSans-Regular",
                ),
              ),
            },
          ],
        )
      ],
    );
  }

  Widget buildSwitch(MyController controller) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.startAnimation();
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 24,
            width: 40,
            decoration: BoxDecoration(
              color: controller.onTapAnimated
                  ? Color(0xfff3845AB)
                  : Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.onTapAnimated ? 20 : 4,
                  top: 4,
                  curve: Curves.fastOutSlowIn,
                  child: SvgPicture.asset(
                    'assets/assets_info/Rectangle 24.svg',
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 9),
        Text(
          'Worker',
          style: TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
              fontFamily: "NotoSans-Bold"),
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
          style: TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
              fontFamily: "NotoSans-Bold"),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 14.0,
            runSpacing: 11.0,
            children: [
              MyTag(
                textJob: 'text b',
                controller: controller,
              ),
              MyTag(
                textJob: 'textadsfb',
                controller: controller,
              ),
              MyTag(
                textJob: 'wqer',
                controller: controller,
              ),
              MyTag(
                textJob: 'texsdffstJob',
                controller: controller,
              ),
              MyTag(
                textJob: 'texsdffstfsdJob',
                controller: controller,
              )
            ],
          ),
        ),
        const SizedBox(height: 45),
      ],
    );
  }

  Widget buildSave(MyController controller) {
    return InkWell(
      onTap: () {
        controller.isLock(() {
          print('SAVE: \nName:${controller.nameController.text}'
              '\nPhone: ${controller.phoneController.text}'
              '\nEmail: ${controller.emailController.text}'
              '\nCity: ${controller.selectedCity}'
              '\nStreet: ${controller.selectedStreet}'
              '\nAddress info: ${controller.addressController.text}'
              '\nExperience: ${controller.selectedExperience}'
              '\nDescription: ${controller.descriptionController.text}'
              '\nListJob: ${controller.listJob}');
          controller.error2();
          controller.error1();
          controller.error3();
          controller.error4();
          controller.error5();

        });
      },
      child: Container(
        height: 46,
        padding: const EdgeInsets.only(top: 14.6, bottom: 12.4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            // color: (controller.lock || !controller.checkInput)
            color: (controller.lock)
                ? Colors.grey[400]
                : Color(0xfff3845AB)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            Text(
              'Save',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffffffff),
                  fontFamily: "NotoSans-SemiBold"),
            ),
            SizedBox(),
          ],
        ),
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

  Widget buildAnimated(MyController controller) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        height: controller.onTapAnimated ? null : 0,
        child: buildJobType(controller));
  }
}
