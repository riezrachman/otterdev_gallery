import '../models/photo.dart';
import '../networks/api_provider.dart';

class PhotoServices {
  final ApiProvider apiProvider = ApiProvider();

  Future<List<Photo>> getList({
    int? albumId,
  }) async {
    final response = await apiProvider.dio.get(
      "/photos",
      queryParameters: {
        "albumId": albumId,
      },
    );
    return photoFromJson(response.data);
  }

  Future<Photo> getDetails(String id) async {
    final response = await apiProvider.dio.get(
      "/photos/$id",
    );
    return Photo.fromJson(response.data);
  }
}
