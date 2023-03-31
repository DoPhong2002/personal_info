import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_test/lightdark/page.dart';
import 'package:getx_test/testadobexd/bottomNavigatorBar.dart';
import 'package:getx_test/testadobexd/common/card.dart';
import 'package:getx_test/testadobexd/page.dart';
import 'package:getx_test/testpersonalinfo/views/PersonalInfo.dart';
import 'package:getx_test/textfield/textfield.dart';

import 'image_picker_demo/image_picker_demo_page.dart';
import 'learngetx/pages/cart/page.dart';
import 'learngetx/pages/home/page.dart';
import 'learngetx/pages/manga/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      home: PersonalInfo(),
      // getPages: [
      //   GetPage(name: '/', page: () => LightDark()),
      //   GetPage(name: '/Card', page: () => Card()),
      //   // GetPage(name: '/Manga', page: () => MangaPage()),
      // ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_test/shoptestgetx/views/shopping_page.dart';
//
// import 'layoutdemo/layout_demo.dart';
// import 'opensea/controllers/opensea_controller.dart';
//
// void main() {
//   runApp(GetMaterialApp(home: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   OpenseaController openseaController = Get.put(OpenseaController());
//
//   int a = 0;
//
//   MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LayoutDemo(),
//     );
//     //   Scaffold(
//     //     body: Obx(
//     //   () => Center(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         TextButton(
//     //           onPressed: () {
//     //             sum(a);
//     //           },
//     //           child: const Text(
//     //             "Tap",
//     //             style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
//     //           ),
//     //         ),
//     //         Text(a.toString(),
//     //             style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
//     //       ],
//     //     ),
//     //   ),
//     // )
//     //
//     //     //   Column(
//     //     //       // children: [
//     //     //       //   TextButton(
//     //     //       //       onPressed: () {
//     //     //       //         showProgressDialog(context);
//     //     //       //       },
//     //     //       //       child: Text('Check')),
//     //     ///
//     //     //         Obx(
//     //     //   () => openseaController.isLoading.value
//     //     //       ? const Center(
//     //     //           child: CircularProgressIndicator(),
//     //     //         )
//     //     //       : ListView.builder(
//     //     //           itemBuilder: (context, index) {
//     //     //             return ListTile(
//     //     //               title: Text(
//     //     //                   openseaController.openseaModel?.assets![index].name ??
//     //     //                       'a'),
//     //     //               subtitle: Text(openseaController
//     //     //                       .openseaModel?.assets?[index].description ??
//     //     //                   'a'),
//     //     //               leading:
//     //     //                   openseaController.openseaModel?.assets![index].imageUrl ==
//     //     //                           null
//     //     //                       ? const Icon(Icons.image)
//     //     //                       : Image.network(openseaController
//     //     //                           .openseaModel!.assets![index].imageUrl!),
//     //     //             );
//     //     //           },
//     //     //           itemCount: openseaController.openseaModel?.assets?.length ?? 0,
//     //     //         ),
//     //     //   // ),
//     //     // ),
//     //     );
//   }
//
//   Future<void> showProgressDialog(BuildContext context) async {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Container(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const CircularProgressIndicator(),
//                 Container(
//                   margin: const EdgeInsets.only(left: 20.0),
//                   child: const Text("Đang tải dữ liệu..."),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     await Future.delayed(
//         const Duration(seconds: 3)); // Giả lập một quá trình tải dữ liệu
//     Navigator.pop(context); // Ẩn ProgressDialog khi quá trình xử lý kết thúc
//   }
//
//   void sum(int a) {
//     a++;
//   }
// }
