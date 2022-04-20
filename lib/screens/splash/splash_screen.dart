import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/screens/home/home_screen.dart';

import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }

  void _onLoad() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(
        const HomeScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(seconds: 1),
      );
    });
  }
}
