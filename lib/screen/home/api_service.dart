import 'package:dio/dio.dart';
import 'package:todo_list/models/item_user.dart';

import '../../models/item_post.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<ItemPost>> getPosts() async {
    try {
      Response response = await _dio.get('$baseUrl/posts');
      List<dynamic> data = response.data;

      List<ItemPost> posts =
          data.map((json) => ItemPost.fromJson(json)).toList();
      return posts;
    } catch (error) {
      throw error;
    }
  }
}
