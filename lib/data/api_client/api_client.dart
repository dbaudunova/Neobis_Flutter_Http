import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neobis_flutter_http/data/model/post_model.dart';

class ApiClient {
  Future<List<PostModel>> getPosts() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);

    if(response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<PostModel> posts = responseData.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load');
    }
  }
}