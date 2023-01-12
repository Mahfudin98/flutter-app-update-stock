import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_stock_app/models/user_model.dart';
import 'package:update_stock_app/services/api.dart';

class AuthController extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late UserModel profile;

  // ignore: prefer_typing_uninitialized_variables
  var token;

  _getToken() async {
    SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data');
  }

  auth(data) async {
    return await http.post(
      ApiNetwork().login,
      body: jsonEncode(data),
      headers: setHeader(),
    );
  }

  getData(apiUrl) async {
    await _getToken();
    return await http.get(
      ApiNetwork().login,
      headers: setHeader(),
    );
  }

  setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<void> getProfile() async {
    String? token;
    final SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data')?.replaceAll("\"", "");
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(ApiNetwork().userLogin, headers: headers);

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['data'] as Map<String, dynamic>;
      profile = UserModel(
        namaDepan: result['nama_depan'],
        namaBelakang: result['nama_belakang'],
        username: result['username'],
        division: result['division_name'],
        image: result['image'],
      );
      // print(profile.namaDepan);
    } else {
      // ignore: avoid_print
      print(response.statusCode.toString());
      // print(token);
    }
  }
}
