import 'package:dio/dio.dart';

import '../../models/item_user.dart';

class ApiService2 {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<ItemUser>> getUsers() async {
    try {
      Response response = await _dio.get('$baseUrl/users');
      List<dynamic> data = response.data;

      List<ItemUser> users =
          data.map((json) => ItemUser.fromJson(json)).toList();
      return users;
    } catch (error) {
      throw error;
    }
  }
}
