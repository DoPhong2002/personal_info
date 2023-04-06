// // ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable
//
// import 'package:flutter/material.dart';
// import '../controllers/controller.dart';
//
// class MyTag extends StatelessWidget {
//   final String textJob;
//   MyController controller;
//   var notifier = ValueNotifier<bool>(false);
//
//   MyTag({super.key, required this.textJob, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         notifier.value = !notifier.value;
//         controller.onAddJobToList(textJob);
//       },
//       child: ValueListenableBuilder<bool>(
//         valueListenable: notifier,
//         builder: (context, value, _) {
//           return Container(
//             padding: const EdgeInsets.only(
//                 left: 26.5, top: 9.5, bottom: 11.5, right: 29.5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: notifier.value
//                     ? Colors.grey.shade500
//                     : const Color(0xffff9f9fb)),
//             child: Text(
//               textJob,
//               style: TextStyle(
//                   fontSize: 14,
//                   color:
//                       notifier.value ? Colors.white : const Color(0xfffb1b8c7),
//                   fontFamily: "NotoSans-Regular"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';

class MyTag extends StatelessWidget {
  final String textJob;
  final MyController controller;

  const MyTag({Key? key, required this.textJob, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.listJob.contains(textJob)) {
          controller.onRemoveListJob(textJob);
        } else {
          controller.onAddListJob(textJob);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: 26.5, top: 9.5, bottom: 11.5, right: 29.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: controller.listJob.contains(textJob)
                ? Colors.grey.shade500
                : const Color(0xffff9f9fb)),
        child: Text(
          textJob,
          style: TextStyle(
              fontSize: 14,
              color: controller.listJob.contains(textJob)
                  ? Colors.white
                  : const Color(0xfffb1b8c7),
              fontFamily: "NotoSans-Regular"),
        ),
      ),
    );
  }
}
