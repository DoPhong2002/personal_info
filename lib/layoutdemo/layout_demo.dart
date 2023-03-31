import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutDemo extends StatelessWidget {
  RxBool isTapTap = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055__340.jpg',
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                buildTitle(context),
                const SizedBox(height: 20),
                buildButton(),
                const SizedBox(height: 40),
                buildStatus()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildStatus() {
    return Container(
      child: const Text(
          'This guide then takes a step back to explain Flutter’s approach to layout, and shows how to place a single widget on the screen. After a discussion of how to lay widgets out horizontally and vertically, some of the most common layout widgets are covered.'),
    );
  }

  Widget buildTitle(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This guide then takes a step bac ter’s',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Th guide then take lutter’s',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.black26,
                  ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            isTapTap.value = !isTapTap.value;
          },
          child: Obx(() => isTapTap.value
              ?   Icon(Icons.add)
              :   Icon(Icons.abc_sharp)),
        )
      ],
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(
          Icons.call,
          color: Colors.blue,
          size: 30,
        ),
        Icon(
          Icons.access_alarms_rounded,
          color: Colors.blue,
          size: 30,
        ),
        Icon(
          Icons.home,
          color: Colors.blue,
          size: 30,
        ),
      ],
    );
  }
}
