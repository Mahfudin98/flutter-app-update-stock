import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:update_stock_app/models/product_model.dart';
import 'package:update_stock_app/services/api.dart';

class ProductController extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<ProductModel> _product = [];
  List<ProductModel> get dataProduct => _product;

  Future<List<ProductModel>> getDataProduct() async {
    String? token;
    final SharedPreferences localStorage = await _prefs;
    token = localStorage.getString('data')?.replaceAll("\"", "");
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(ApiNetwork().listProduk, headers: headers);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _product = result
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return _product;
    } else {
      throw Exception();
    }
  }
}
