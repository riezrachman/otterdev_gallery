import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/controllers/album_controller.dart';

import 'components/body.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    Get.put(AlbumController(userId: userId), tag: "album");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album"),
      ),
      body: const Body(),
    );
  }
}
