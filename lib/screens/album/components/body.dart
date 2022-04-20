import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/constants.dart';
import 'package:otterdev_gallery/controllers/album_controller.dart';

import 'album_section.dart';
import 'search_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlbumController c = Get.find(tag: "album");
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: RefreshIndicator(
          onRefresh: c.fetch,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: const [
                  SearchSection(),
                  SizedBox(height: 20.0),
                  AlbumSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
