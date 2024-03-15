import 'package:flutter/material.dart';
import 'package:neobis_flutter_http/data/api_client/api_client.dart';
import 'package:neobis_flutter_http/data/model/post_model.dart';
import 'package:neobis_flutter_http/presentation/widgets/list_style_widget.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late Future<List<PostModel>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = ApiClient().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else {
            List<PostModel>? posts = snapshot.data;
            return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blue[100],
                      child: ListStyle(
                        title: posts![index].title,
                        subtitle: posts[index].body,
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
