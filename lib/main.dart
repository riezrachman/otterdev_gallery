import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otterdev_gallery/constants.dart';

import 'screens/splash/splash_screen.dart';
import 'theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Otterdev Gallery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        colorScheme: colorSchemeLight,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        appBarTheme: appBarTheme,
        tabBarTheme: tabBarTheme,
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
      ),
      home: const SplashScreen(),
    );
  }
}
