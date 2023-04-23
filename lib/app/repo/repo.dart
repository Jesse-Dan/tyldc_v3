import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tyldc_v3/app/model/api_data_model.dart';

import '../../build/constants/urls.dart';

class ApiRepository {
  Future<List<Api>> getPosts() async {
    final response = await http.get(Uri.parse('$BASE_URL/todos'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      return jsonList.map((json) => Api.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
