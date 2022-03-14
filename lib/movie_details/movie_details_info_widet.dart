import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/images.dart';

import '../movie_list/movie_list_page.dart';

class MovieDetailsInfoWidet extends StatelessWidget {
  final Movie movie;
  const MovieDetailsInfoWidet({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopPosterWidget()
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          AppImages.backgroundSpiderMan,
          fit: BoxFit.fitHeight,
          height: 300,
        ),
        Image.asset(AppImages.posterSpiderMan,
            height: 200, alignment: Alignment.centerLeft),
      ],
    );
  }
}
