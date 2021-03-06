import 'package:flutter_complex_json/models/user.dart';
import 'package:flutter_complex_json/models/photos.dart';
import 'package:http/http.dart' as http;

class ServiceHelper {

  static const String url = "http://jsonplaceholder.typicode.com/users";

  Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(url);
      if(response.statusCode == 200) {
        final List<User> user = userFromJson(response.body);
        return user;
      }
    } catch (e) {
      return List<User>();
    }
  }

  Future<List<Photos>> getAllPhotos() async {
    try {
      final response = await http.get("http://jsonplaceholder.typicode.com/photos");
      if(response.statusCode == 200) {
        final List<Photos> photos = photosFromJson(response.body);
        return photos;
      }
    } catch (e) {
      return List<Photos>();
    }
  }

}
