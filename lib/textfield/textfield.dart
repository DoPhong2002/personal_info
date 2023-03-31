import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/textfield/controller/textField_controller.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  String passwordError = '';
  bool isEmail(String email) {
    // Xây dựng biểu thức chính quy kiểm tra định dạng email
    final emailRegex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');

    // Kiểm tra sự khớp của chuỗi email với biểu thức chính quy
    return emailRegex.hasMatch(email);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: TextFieldController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('TexField'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: controller.userName,
                    onChanged: (value) {
                      if (!isEmail(value)) {
                        controller.addErrorUserName('Pls enter EMAIL');
                        controller.checkValidUser(false);
                      }
                      else {
                        controller.addErrorUserName('');
                        controller.checkValidUser(true);
                      }
                      controller.checkValid();
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: controller.errorUserName,
                      hintText: 'UserName',
                      labelText: 'UserName',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1000),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 3),
                        gapPadding: 10,
                      ),
                    ),
                    // maxLength: 8,
                    // maxLength: 8,
                    maxLines: 1,
                    minLines: 1,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    onChanged: (value) {
                      if (value.length < 6) {
                        controller.addErrorPassword('Longer than 6 characters');
                        controller.checkValidPassword(false);
                      } else if (value.length > 10) {
                        controller.addErrorPassword('Less than 10 characters');
                        controller.checkValidPassword(false);
                      } else {
                        controller.addErrorPassword('');
                        controller.checkValidPassword(true);
                      }
                      controller.checkValid();
                    },
                    controller: controller.password,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorText: controller.errorPassword,
                        hintText: 'Password',
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1000),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 3),
                          gapPadding: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1000),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 3),
                          gapPadding: 10,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.check();
                            },
                            icon: controller.checkPassword
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye))),
                    obscureText: !controller.checkPassword,
                    // maxLength: 8,
                    maxLines: 1,
                    minLines: 1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:
                            controller.valid ? Colors.blueAccent : Colors.grey,
                      ),
                      child: const Text('abc'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
