import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/components/custom_shimmer.dart';
import 'package:otterdev_gallery/constants.dart';
import 'package:otterdev_gallery/models/album.dart';
import 'package:otterdev_gallery/screens/photo/photo_screen.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem(
    this.data, {
    Key? key,
  }) : super(key: key);

  final Album data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kBoxShadow,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.to(PhotoScreen(data.id ?? 0)),
          borderRadius: BorderRadius.circular(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  data.photos?.first.thumbnailUrl ?? "",
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user?.name ?? "-",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(data.title ?? "-"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
