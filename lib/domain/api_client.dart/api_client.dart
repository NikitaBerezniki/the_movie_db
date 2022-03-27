import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final url = Uri(
        scheme: 'https', host: 'jsonplaceholder.typicode.com', path: 'posts');
    final response =
        await client.getUrl(url).then((request) => request.close());
    // response.transform(utf8.decoder).listen((event) {
    // });
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((strings) => jsonDecode(strings.join())) as List<dynamic>;
    final posts = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    // print(posts);
    return posts;
  }

  Future<Post?> createPost(
      {required String title, required String body}) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 102,
    };
    final requst = await client.postUrl(url);
    requst.headers.set('Content-type', 'application/json; charset=UTF-8');
    requst.write(jsonEncode(parameters));
    final response = await requst.close();
    final jsonString = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join());
    final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }
}
