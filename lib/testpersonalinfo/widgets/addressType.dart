import 'package:flutter/material.dart';
import 'package:getx_test/testpersonalinfo/controllers/controller.dart';

// ignore: must_be_immutable
class AddressType extends StatelessWidget {
  final List<String> cities;
  MyController controller;
  final String address;
  final Function(String) onPressed;

  AddressType(
      {super.key,
      required this.address,
      required this.cities,
      required this.controller,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      offset: const Offset(50, 50),
      itemBuilder: (context) {
        return cities
            .map(
              (city) => PopupMenuItem<int>(
                value: cities.indexOf(city),
                child: Text(
                  city,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'NotoSans-Regular'),
                ),
              ),
            )
            .toList();
      },
      onSelected: (value) {
        onPressed(cities[value]);
      },
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
              address == '' ? address : address,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xfffB1B8C7),
                  fontFamily: "NotoSans-Regular"),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
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
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xfffB1B8C7),
                    fontFamily: "NotoSans-Regular"),
              ),
              buildMenu(controller)
            ],
          ),
        )
  */
/*
PopupMenuButton<int>(
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
          ),
        ),
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
    )
 */
