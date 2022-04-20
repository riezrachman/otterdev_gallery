import 'package:get/get.dart';
import 'package:otterdev_gallery/services/album_services.dart';
import 'package:otterdev_gallery/services/photo_services.dart';
import 'package:otterdev_gallery/services/user_services.dart';

import '../models/album.dart';
import '../networks/api_response.dart';

class AlbumController extends GetxController {
  var status = Status.LOADING.obs;

  var data = <Album>[].obs;

  AlbumController({
    int? userId,
  }) {
    _userId = userId;
  }

  int? _userId;
  String? _title;

  Future<void> fetch({
    String? title,
  }) async {
    status(Status.LOADING);
    try {
      _title = title;
      var response = await AlbumServices().getList(
        userId: _userId,
        title: _title,
      );
      for (var x in response) {
        x.user = await UserServices().getDetails(x.userId ?? 0);
        x.photos = await PhotoServices().getList(albumId: x.id);
      }
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
