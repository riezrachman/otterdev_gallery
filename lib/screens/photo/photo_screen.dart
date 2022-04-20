import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/controllers/photo_controller.dart';

import 'components/body.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen(
    this.albumId, {
    Key? key,
  }) : super(key: key);

  final int albumId;

  @override
  Widget build(BuildContext context) {
    Get.put(PhotoController(albumId: albumId), tag: "photo");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo"),
      ),
      body: const Body(),
    );
  }
}
