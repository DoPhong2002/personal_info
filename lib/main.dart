import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_test/testpersonalinfo/views/PersonalInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
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
      ),
    );
  }
}
