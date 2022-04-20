import 'package:get/get.dart';
import 'package:otterdev_gallery/services/user_services.dart';

import '../models/user.dart';
import '../networks/api_response.dart';

class UserController extends GetxController {
  var status = Status.LOADING.obs;

  var data = <User>[].obs;

  String? _name;

  Future<void> fetch({
    String? name,
  }) async {
    status(Status.LOADING);
    try {
      _name = name;
      var response = await UserServices().getList(name: _name);
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
