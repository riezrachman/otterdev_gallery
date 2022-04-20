import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/controllers/user_controller.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserController(), tag: "user");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otterdev Gallery"),
      ),
      body: const Body(),
    );
  }
}
