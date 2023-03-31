import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTag extends StatefulWidget {
  const MyTag({Key? key, required this.textJob}) : super(key: key);
  final String textJob;
  @override
  State<MyTag> createState() => _MyTagState();
}

class _MyTagState extends State<MyTag> {
  var notifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child:
      ValueListenableBuilder<bool>(
        valueListenable: notifier,
        builder: (context,value,_){
          return Container(
              padding: const EdgeInsets.only(
                  left: 26.5, top: 9.5, bottom: 11.5, right: 29.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier.value
                      ? Colors.grey.shade500
                      : const Color(0xfffF9F9FB)),
              child: Text(
                widget.textJob,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: notifier.value
                        ? Colors.white
                        : const Color(0xfffB1B8C7),
                  ),
                ),
              )


          );
        },

      ),

    );
  }
}
