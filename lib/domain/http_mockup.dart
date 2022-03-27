import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/http_model.dart';

class HttpMockup extends StatelessWidget {
  final model = HttpModel();
  HttpMockup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ApiClient().getPosts(); очень плохо
    return Scaffold(
      body: SafeArea(
        child: HttpProvider(
          model: model,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _ReloadButton(),
                _CreateButton(),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _PostsWidget(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostsWidget extends StatelessWidget {
  const _PostsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: HttpProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (context, index) {
        return _PostRowWidget(index: index);
      },
    );
  }
}

class _PostRowWidget extends StatelessWidget {
  final int index;

  const _PostRowWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = HttpProvider.read(context)!.model.posts.elementAt(index);
    return Card(
        child: Column(
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10),
        Text(post.title.toString()),
        const SizedBox(height: 10),
        Text(post.body.toString()),
      ],
    ));
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => HttpProvider.read(context)?.model.createPost(),
      child: Text('Создать посты (Create)'),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => HttpProvider.read(context)?.model.reloadPosts(),
      child: Text('Обновить посты (Reload)'),
    );
  }
}
