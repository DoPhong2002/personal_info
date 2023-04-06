// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:getx_test/testpersonalinfo/controllers/controller.dart';

class MyTextField extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final String? errorText;
  final MyController controller2;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Function? onChangeError;

  const MyTextField({
    Key? key,
    this.titleText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChange,
    this.hintText,
    this.errorText,
    this.onChangeError,  required this.controller2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText!,
          style: const TextStyle(
              fontSize: 12,
              color: Color(0xfff38385E),
              fontFamily: "NotoSans-Bold"),
        ),
        const SizedBox(height: 9),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfffF9F9FB)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      maxLines: 1,
                      minLines: 1,
                      maxLength: 20,
                      keyboardType: keyboardType,
                      decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xfffB1B8C7),
                              fontFamily: "NotoSans-Regular"),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 12.5, bottom: 15.5),
                          counterText: ''),
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xfff1F1F39),
                          fontFamily: "NotoSans-Regular"),
                      onChanged: onChange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (errorText != null) ...{
          Text(
            '*$errorText',
            style: const TextStyle(
              fontSize: 8,
              color: Colors.red,
              fontFamily: "NotoSans-Regular",
            ),
          ),
        },
      ],
    );
  }
}
