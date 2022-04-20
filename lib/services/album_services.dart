import '../models/album.dart';
import '../networks/api_provider.dart';

class AlbumServices {
  final ApiProvider apiProvider = ApiProvider();

  Future<List<Album>> getList({
    int? userId,
    String? title,
  }) async {
    var queryParameters = <String, dynamic>{};
    if (userId != null) {
      queryParameters["userId"] = userId;
    }
    if (title != null && title != "") {
      queryParameters["title"] = title;
    }
    final response = await apiProvider.dio.get(
      "/albums",
      queryParameters: queryParameters,
    );
    return albumFromJson(response.data);
  }

  Future<Album> getDetails(String id) async {
    final response = await apiProvider.dio.get(
      "/albums/$id",
    );
    return Album.fromJson(response.data);
  }
}
