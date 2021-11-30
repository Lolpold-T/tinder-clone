import 'dart:convert';

import 'package:tinder_clone/models/user_model.dart';

import 'package:http/http.dart' as http;

class TinderServices {
  Future<List<UserModel>?> fetchAllUsers() async {
    try {
      Uri path = Uri.parse("http://10.0.2.2:8000/user");
      var request = await http.get(path);

      if (request.statusCode == 200) {
        List<UserModel> userModels = [];
        for (var item in jsonDecode(request.body)) {
          UserModel userModel = UserModel.fromJson(item);
          userModels.add(userModel);
        }
        return userModels;
      }
    } catch (err) {
      print(err);
    }
  }

  Future<List<UserModel>?> fetchAllLeos() async {
    try {
      Uri path = Uri.parse("http://10.0.2.2:8000/leo");
      var request = await http.get(path);

      if (request.statusCode == 200) {
        List<UserModel> userModels = [];
        for (var item in jsonDecode(request.body)) {
          UserModel userModel = UserModel.fromJson(item);
          userModels.add(userModel);
        }
        return userModels;
      }
    } catch (err) {
      print(err);
    }
  }
}
