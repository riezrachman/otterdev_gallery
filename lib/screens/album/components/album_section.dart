import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/components/custom_button.dart';
import 'package:otterdev_gallery/components/custom_shimmer.dart';
import 'package:otterdev_gallery/controllers/album_controller.dart';
import 'package:otterdev_gallery/networks/api_response.dart';

import 'album_item.dart';

class AlbumSection extends StatelessWidget {
  const AlbumSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlbumController c = Get.find(tag: "album");
    return Obx(() {
      switch (c.status.value) {
        case Status.LOADING:
          return buildLoading(context);
        case Status.COMPLETED:
          return buildCompleted(context);
        case Status.ERROR:
          return buildError(context);
        default:
          return buildLoading(context);
      }
    });
  }

  Widget buildLoading(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(
        6,
        (index) => CustomShimmer(
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCompleted(BuildContext context) {
    AlbumController c = Get.find(tag: "album");
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(
        c.data.length,
        (index) => AlbumItem(c.data[index]),
      ),
    );
  }

  Widget buildError(BuildContext context) {
    AlbumController c = Get.find(tag: "album");
    return Column(
      children: [
        const Text("Oops! Something went wrong..."),
        const SizedBox(height: 10.0),
        CustomButton(
          "Reload",
          onPressed: c.fetch,
        ),
      ],
    );
  }
}
