import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String? text;
  final TextInputType keyboardType;

  const MyTextField({
    Key? key,
    this.text,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              fontSize: 12,
              // ignore: use_full_hex_values_for_flutter_colors
              color: Color(0xfff38385E),
            ),
          ),
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
                  keyboardType: keyboardType,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20.0, top: 12.5, bottom: 15.5),
                  ),
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(0xfff1F1F39),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
