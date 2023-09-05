import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/models/products.dart';

// import 'package:rest_api_example/constants.dart';
// import 'package:rest_api_example/model/user_model.dart';

class ApiService {
  Future<Products>? getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Products _model = productsFromJson(response.body);
        log(_model.toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to load data!');
  }
}
