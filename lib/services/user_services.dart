import '../models/user.dart';
import '../networks/api_provider.dart';

class UserServices {
  final ApiProvider apiProvider = ApiProvider();

  Future<List<User>> getList({
    String? name,
  }) async {
    var queryParameters = <String, dynamic>{};
    if (name != null && name != "") {
      queryParameters["name"] = name;
    }
    final response = await apiProvider.dio.get(
      "/users",
      queryParameters: queryParameters,
    );
    return userFromJson(response.data);
  }

  Future<User> getDetails(int id) async {
    final response = await apiProvider.dio.get(
      "/users/$id",
    );
    return User.fromJson(response.data);
  }
}
