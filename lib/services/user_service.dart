import 'package:user/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  String baseurl = "https://jsonplaceholder.typicode.com/";
  String userurl = "users";
  Future<List<User>> getUser() async {
    List<User> users = [];
    Response response = await Dio().get("$baseurl$userurl");
    var data = response.data;
    data.forEach((element) {
      User user = User.fromJson(element);
      users.add(user);
    });
    return users;
  }
}
