import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tenan/model/photo.dart';
import 'package:tenan/utils/api/api.dart';

class ImageRepository {
  Future<List<Photo>> getImages() async {
    try {
      final uri = Uri.http(Tenan.baseUrl, "/api/gallery");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];

        return (data as List).map((photo) => Photo.fromJson(photo)).toList();
      } else {
        throw "Error getting list";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
