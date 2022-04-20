import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/components/custom_shimmer.dart';
import 'package:otterdev_gallery/constants.dart';
import 'package:otterdev_gallery/controllers/photo_controller.dart';

import 'gallery_photo_view_wrapper.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    PhotoController c = Get.find(tag: "photo");
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kBoxShadow,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.to(
            GalleryPhotoViewWrapper(
              galleryItems: c.data,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              initialIndex: index,
              scrollDirection: Axis.horizontal,
            ),
          ),
          borderRadius: BorderRadius.circular(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              c.data[index].thumbnailUrl ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return CustomShimmer(
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported_outlined);
              },
            ),
          ),
        ),
      ),
    );
  }
}
