import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/api_client.dart/api_client.dart';
import 'package:the_movie_db/domain/entity/post.dart';

class HttpModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    final posts = await apiClient.getPosts();
    _posts += posts;
    // posts.map((e) => _posts += e);
    notifyListeners();
  }

  void createPost() async {
    final post = await apiClient.createPost(body: 'vsdfew', title: 'stol');

  }
}

class HttpProvider extends InheritedNotifier {
  final HttpModel model;
  const HttpProvider({Key? key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static HttpProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HttpProvider>();
  }

  static HttpProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<HttpProvider>()?.widget;
    return widget is HttpProvider ? widget : null;
  }
}
