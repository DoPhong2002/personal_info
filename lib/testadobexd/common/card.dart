import 'package:flutter/material.dart';
import 'package:getx_test/testadobexd/const/const.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String speed;
  final Color color;

  const MyCard({
    super.key,
    required this.title,
    required this.speed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        right: 15,
        left: 15,
        bottom: 20,
      ),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 12,
                color: const Color(0xfffb0b3ba).withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$speed km',
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: const Color(0xfff000b22).withOpacity(0.8),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    '${baseAssets}Ellipse 9.png',
                    color: color,
                  ),
                  Image.asset(
                    '${baseAssets}Ellipse 8.png',
                    color: color,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
