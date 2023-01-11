import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:update_stock_app/models/product_model.dart';

class ServiceApi extends ChangeNotifier {
  List<ProductModel> _product = [];
  List<ProductModel> get dataProduct => _product;

  final String link = "https://api-report.lsskincare.id/api/";

  Future<List<ProductModel>> getDataProduct() async {
    final url = Uri.parse('${link}product-list-gudang');
    final response = await http.get(url);

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
