import 'package:flutter/material.dart';
import 'package:the_movie_db/models/movie_temporary.dart';
import 'package:the_movie_db/resources/images.dart';
import 'package:the_movie_db/widgets/progress_bar_widget.dart';




/*
Версия LOADLAZY
*/

final textWhite16 = TextStyle(color: Colors.white, fontSize: 16);
final textWhite18bold =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

class MovieDetailsInfoWidet extends StatelessWidget {
  final MovieTemporary movie;
  MovieDetailsInfoWidet({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
        _NameFilmWidget(movie: movie),
        _ScoreAndVideoWidget(movie: movie),
        _MetadataFilmWidget(),
        _InfoFIlmWidget(movie: movie),
        _PeopleFilmWidget(),
      ],
    );
  }
}

class _PeopleFilmWidget extends StatelessWidget {
  const _PeopleFilmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Table(
        // columnWidths: const {2: FractionColumnWidth(.8)},
        defaultColumnWidth: FlexColumnWidth(),
        children: [
          TableRow(children: [
            RichText(
              text: TextSpan(
                text: 'Steve Ditko ',
                children: [
                  TextSpan(text: '\nCharacters', style: textWhite16)
                ],
                style: textWhite18bold,
              ),
            ),
            Text(
              'Stan Lee \nCharacters',
              style: textWhite16,
            ),
          ]),
          TableRow(
              children: const [SizedBox(height: 20), SizedBox(height: 20)]),
          TableRow(children: [
            Text(
              'Jon Watts \nDirector',
              style: textWhite16,
            ),
            Text(
              'Chris McKenna \nWriter',
              style: textWhite16,
            ),
          ]),
        ],
      ),
    );
  }
}

class _InfoFIlmWidget extends StatelessWidget {
  final MovieTemporary movie;

  const _InfoFIlmWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Text('Обзор', style: textWhite18bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(movie.description,
              style: textWhite16, textAlign: TextAlign.justify),
        ),
      ],
    );
  }
}

class _MetadataFilmWidget extends StatelessWidget {
  const _MetadataFilmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(0, 0, 0, 1.0),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: Text(
          'PG-13 15/12/2021 2h 28m (RU) боевик, приключения, фантастика',
          textAlign: TextAlign.center,
          style: textWhite16,
        ));
  }
}

class _ScoreAndVideoWidget extends StatelessWidget {
  const _ScoreAndVideoWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieTemporary movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadialProgressBar(percent: movie.rating, sizeBar: 50),
              SizedBox(width: 10),
              Text('Рейтинг фильма', style: textWhite16),
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 10),
                Text('Воспроизвести', style: textWhite16)
              ],
            ))
      ]),
    );
  }
}

class _NameFilmWidget extends StatelessWidget {
  const _NameFilmWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieTemporary movie;

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: movie.title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: ' (${movie.time?.year})',
              style: TextStyle(fontSize: 18, color: Colors.grey))
        ]));
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: Image.asset(
            AppImages.backgroundSpiderMan2,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          top: 20,
          bottom: 20,
          left: 20,
          child: Image.asset(AppImages.posterSpiderMan,
              alignment: Alignment.centerLeft),
        ),
      ],
    );
  }
}
