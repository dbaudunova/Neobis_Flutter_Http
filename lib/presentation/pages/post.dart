import 'package:flutter/material.dart';
import 'package:neobis_flutter_http/data/api_client/api_client.dart';
import 'package:neobis_flutter_http/data/model/post_model.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late Future<List<PostModel>> posts;

  @override
  void initState() {
    super.initState();
    posts = ApiClient().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
