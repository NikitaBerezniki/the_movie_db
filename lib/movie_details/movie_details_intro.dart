import 'package:flutter/material.dart';
import '../models/movie_temporary.dart';
import '../resources/styles.dart';
import '../widgets/progress_bar_widget.dart';

class MyMovieDetailsIntroWidget extends StatefulWidget {
  final MovieTemporary movie;
  const MyMovieDetailsIntroWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MyMovieDetailsIntroWidget> createState() => _MyMovieDetailsIntroWidgetState();
}

class _MyMovieDetailsIntroWidgetState extends State<MyMovieDetailsIntroWidget> {
  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    const ratioHeightSize = 0.45;
    return Column(
      children: [
        _PosterWidget(movie: movie, ratioHeightSize: ratioHeightSize),
        SizedBox(height: 20),
        NameMovieWidget(movie: movie),
        SizedBox(height: 10),
        _ScoreAndVideoWidget(movie: movie),
        SizedBox(height: 10),
        _MetadataFilmWidget(movie: movie),
        SizedBox(height: 10),
        _InformationFilmWidget(movie: movie),
        SizedBox(height: 20),
      ],
    );
  }
}

class _InformationFilmWidget extends StatelessWidget {
  const _InformationFilmWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieTemporary movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(movie.quote, style: TextStyle(color: Colors.grey, fontSize: 22)),
        SizedBox(height: 10),
        Text('Обзор', style: AppTextStyle.textStyleDrawer),
        SizedBox(height: 10),
        Text(movie.description, style: AppTextStyle.textWhite16),
      ]),
    );
  }
}

class _ScoreAndVideoWidget extends StatefulWidget {
  final MovieTemporary movie;
  _ScoreAndVideoWidget({Key? key, required this.movie}) : super(key: key);

  @override
  State<_ScoreAndVideoWidget> createState() => _ScoreAndVideoWidgetState();
}

class _ScoreAndVideoWidgetState extends State<_ScoreAndVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                RadialProgressBar(sizeBar: 50, percent: widget.movie.rating),
                SizedBox(width: 10),
                Text('Рейтинг фильма', style: AppTextStyle.textWhite16),
              ],
            )),
        TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                SizedBox(width: 5),
                Text('Воспроизвести', style: AppTextStyle.textWhite16)
              ],
            )),
      ],
    );
  }
}

class _MetadataFilmWidget extends StatelessWidget {
  const _MetadataFilmWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieTemporary movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: AppColorStyle.darkbrownBackgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratingAgeSystem(),
              SizedBox(width: 10),
              movieDate(),
              SizedBox(width: 5),
              Text('(RU) -', style: AppTextStyle.textWhite16),
              SizedBox(width: 5),
              Text(movie.duration, style: AppTextStyle.textWhite16),
            ],
          ),
          SizedBox(height: 5),
          genresOfTheFilm()
        ],
      ),
    );
  }

  Text movieDate() {
    return Text(
      '${movie.time?.day}/${movie.time?.month}/${movie.time?.year}',
      style: AppTextStyle.textWhite16,
    );
  }

  Container ratingAgeSystem() {
    return Container(
      child: Text(
        'PG-13',
        style: TextStyle(color: Colors.grey),
      ),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, border: Border.all(color: Colors.grey)),
    );
  }

  Row genresOfTheFilm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
                children: [TextSpan(text: movie.genre.keys.join(', '))],
                style: AppTextStyle.textWhite16))
      ],
    );
  }
}

class NameMovieWidget extends StatefulWidget {
  const NameMovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieTemporary movie;

  @override
  State<NameMovieWidget> createState() => _NameMovieWidgetState();
}

class _NameMovieWidgetState extends State<NameMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SelectableText.rich(
        TextSpan(children: [
          TextSpan(
              text: '${widget.movie.title} ',
              style: TextStyle(color: Colors.white, fontSize: 28),
              children: [
                widget.movie.time?.year != null
                    ? TextSpan(
                        text: '(${widget.movie.time?.year})',
                        style: TextStyle(color: Colors.grey, fontSize: 22))
                    : TextSpan(text: '')
              ]),
        ]),
      ),
    );
  }
}

class _PosterWidget extends StatelessWidget {
  const _PosterWidget({
    Key? key,
    required this.movie,
    required this.ratioHeightSize,
  }) : super(key: key);

  final MovieTemporary movie;
  final double ratioHeightSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(context),
        darkeningTheArea(context),
        smallPosterImage(context),
      ],
    );
  }

  Container backgroundImage(BuildContext context) {
    return Container(
      color: AppColorStyle.brownBackgroundColor,
      child: Image.asset(
        movie.imageBackground,
        alignment: Alignment.centerRight,
        fit: BoxFit.fitHeight,
        height: MediaQuery.of(context).size.width * ratioHeightSize,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Container darkeningTheArea(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * ratioHeightSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          AppColorStyle.brownBackgroundColor,
          AppColorStyle.brownBackgroundColor.withOpacity(0.9),
          AppColorStyle.brownBackgroundColor.withOpacity(0.3),
          Colors.transparent,
        ]),
      ),
    );
  }

  Container smallPosterImage(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.width * ratioHeightSize,
      constraints: BoxConstraints(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(movie.imagePoster),
      ),
    );
  }
}
