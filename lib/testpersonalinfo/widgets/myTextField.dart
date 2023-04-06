import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChange;

  const MyTextField({
    Key? key,
    this.titleText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChange, this.hintText,
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
              // ignore: use_full_hex_values_for_flutter_colors
              color: Color(0xfff38385E),
              fontFamily: "NotoSans-Bold"),
        ),
        const SizedBox(height: 9),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // ignore: use_full_hex_values_for_flutter_colors
              color: const Color(0xfffF9F9FB)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: 1,
                  minLines: 1,
                  maxLength: 20,
                  keyboardType: keyboardType,

                  decoration:   InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xfffB1B8C7),
                          fontFamily: "NotoSans-Regular"),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 20.0, top: 12.5, bottom: 15.5),
                      counterText: ''),
                  style: const TextStyle(
                      fontSize: 14,
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(0xfff1F1F39),
                      fontFamily: "NotoSans-Regular"),
                  onChanged: onChange,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
