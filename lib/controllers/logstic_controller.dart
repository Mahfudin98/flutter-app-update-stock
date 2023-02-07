import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_stock_app/models/logistic_model.dart';
import 'package:update_stock_app/services/api.dart';

class LogisticController extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List<LogisticModel> _logistic = [];
  List<LogisticModel> get dataLogistic => _logistic;

  Future<List<LogisticModel>> getDataLogistic() async {
    String? token;
    final SharedPreferences localStorage = await _pref;
    token = localStorage.getString('data')?.replaceAll("\"", "");
    var headers = {'Authorization': 'Bearer  $token'};
    final response =
        await http.get(ApiNetwork().listLogistic, headers: headers);
    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _logistic = result
          .map<LogisticModel>((json) => LogisticModel.formJson(json))
          .toList();
      return _logistic;
    } else {
      throw Exception();
    }
  }

  Future<LogisticModel> findIdLogistic(String id) async {
    return _logistic.firstWhere((i) => i.id == id);
  }
}
