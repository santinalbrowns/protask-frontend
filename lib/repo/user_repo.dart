import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:protask/models/user.dart';
import 'package:protask/repo/auth_repo.dart';

class UserRepo extends AuthRepo {
  static const url = "http://localhost:5000/api/users";

  Future<User> getUser() async {
    try {
      final token = await restore();
      final response = await get(Uri.parse('$url/me'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      Map<String, dynamic> json = jsonDecode(response.body);

      final user = User.fromJson(json);

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final token = await restore();

      final response = await get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      final json = jsonDecode(response.body);

      final users = json.map<User>((user) => User.fromJson(user)).toList();

      return users;
    } catch (e) {
      throw Exception(e);
    }
  }
}
