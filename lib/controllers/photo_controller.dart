import 'package:get/get.dart';
import 'package:otterdev_gallery/services/photo_services.dart';

import '../models/photo.dart';
import '../networks/api_response.dart';

class PhotoController extends GetxController {
  var status = Status.LOADING.obs;

  var data = <Photo>[].obs;

  PhotoController({
    int? albumId,
  }) {
    _albumId = albumId;
  }

  int? _albumId;

  Future<void> fetch() async {
    status(Status.LOADING);
    try {
      var response = await PhotoServices().getList(
        albumId: _albumId,
      );
      data(response);
      status(Status.COMPLETED);
    } catch (error) {
      status(Status.ERROR);
    }
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}
