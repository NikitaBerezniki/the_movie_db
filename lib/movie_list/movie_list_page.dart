import 'package:flutter/material.dart';
import '../resources/images.dart';
import '../resources/styles.dart';

List<Movie> movies = <Movie>[
  Movie(
    id: 1,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
    duration: '2h 28m',
    quote: '«Мультивселенная на свободе»',
    rating: 84,
    imagePoster: AppImages.posterSpiderMan,
    imageBackground: AppImages.backgroundSpiderMan,
    title: 'Человек-паук: Нет пути домой',
    time: DateTime.tryParse('2021-12-15'),
    description:
        'Мистерио удаётся выяснить истинную личность Человека-паука. С этого момента жизнь Питера Паркера становится невыносимой. Если ранее он мог успешно переключаться между своими амплуа, то сейчас это сделать невозможно. Переворачивается с ног на голову не только жизнь Человека-пауку, но и репутация. Понимая, что так жить невозможно, главный герой фильма «Человек-паук: Нет пути домой» принимает решение обратиться за помощью к своему давнему знакомому Стивену Стрэнджу. Питер Паркер надеется, что с помощью магии он сможет восстановить его анонимность. Стрэндж соглашается помочь.',
  ),
  Movie(
    id: 2,
    rating: 84,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
    duration: '2h 28m',
    quote: '«Мультивселенная на свободе»',
    imagePoster: AppImages.posterBatman,
    imageBackground: AppImages.backgroundSpiderMan,
    title: 'Бэтмен',
    time: DateTime.tryParse('1 марта 2022'),
    description:
        'После двух лет поисков правосудия на улицах Готэма для своих сограждан Бэтмен становится олицетворением беспощадного возмездия.',
  ),
  Movie(
      id: 3,
      rating: 84,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
      duration: '2h 28m',
      quote: '«Мультивселенная на свободе»',
      imagePoster: AppImages.posterEnkanto,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Энканто',
      time: DateTime.tryParse('24 ноября 2021'),
      description:
          'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель'),
  Movie(
      id: 4,
      rating: 84,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
      duration: '2h 28m',
      quote: '«Мультивселенная на свободе»',
      imagePoster: AppImages.posterKrik,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Крик',
      time: DateTime.tryParse('12 января 2022'),
      description:
          'Спустя 25 лет после жестоких убийств, потрясших тихий городок Вудсборо, и выхода серии культовых слэшеров на основе тех событий старшеклассница Тара подвергается нападению, такому же, как и в фильме. Узнав о случившемся, в Вудсборо возвращается её старшая сестра Сэм и просит помощи у бывшего шерифа городка Дьюи Райли в поимке нового убийцы, скрывающегося за маской Призрачного лица.'),
  Movie(
      id: 5,
      rating: 84,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
      duration: '2h 28m',
      quote: '«Мультивселенная на свободе»',
      imagePoster: AppImages.posterKingsman,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Kings Man: Начало',
      time: DateTime.tryParse('22 декабря 2021'),
      description:
          'Kingsman — организация супершпионов, действующая на благо человечества вдали от любопытных глаз. И один из первых и самых талантливых оперативников в истории организации — Конрад, молодой и наглый сын герцога Оксфордского. Как и многие его друзья он мечтал служить на благо Англии, но в итоге оказался втянут в тайный мир шпионов и убийц.'),
  Movie(
      id: 6,
      rating: 84,
      genre: {'action':'', 'adventures':'', 'fantastic':''},
      duration: '2h 28m',
      quote: '«Мультивселенная на свободе»',
      imagePoster: AppImages.posterkimi,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Кими',
      time: DateTime.tryParse('10 февраля 2022'),
      description:
          'В центре сюжета фильма — Анджела Чайлдс, которая занимается расшифровкой аудиозаписей и работает на компанию, создавшую популярного голосового помощника KIMI. Именно он однажды записывает ссору двух людей, которая, как полагает Чайлдс, закончилась убийством. Девушка решает найти виновного, но её работодатели почему-то отказываются дать делу ход.')
];


class Movie {
  final int id;
  final double rating;
  final Map genre;
  final String duration;
  final String quote;
  final String imagePoster;
  final String imageBackground;
  final String title;
  final DateTime? time;
  final String description;

  Movie(
      {required this.id,
      required this.rating,
      required this.genre,
      required this.duration,
      required this.quote,
      required this.imagePoster,
      required this.imageBackground,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> filteredMovies = <Movie>[];

  TextEditingController searchController = TextEditingController();

  bool isVisibleSearch = false;

  void onMovieTap(int index) {
    final id = movies.elementAt(index).id;
    Navigator.of(context).pushNamed('/movie_details_page', arguments: id);
  }

  void searchMovies() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchMovies();
    searchController.addListener(searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          // padding: isVisibleSearch ? const EdgeInsets.only(top: 70) : null,
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = filteredMovies.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Stack(children: [
                CardFilmWidget(movie: movie),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => onMovieTap(index),
                  ),
                ),
              ]),
            );
          },
        ),
        // SearchWidget(isVisibleSearch: isVisibleSearch, searchController: searchController)
      ],
    );
  }
}

class CardFilmWidget extends StatelessWidget {
  const CardFilmWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorStyle.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 8)
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(children: [
        Image.asset(movie.imagePoster),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "${movie.time?.day} ${movie.time?.month} ${movie.time?.year}",
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
              ]),
        ),
      ]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.isVisibleSearch,
    required this.searchController,
  }) : super(key: key);

  final bool isVisibleSearch;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Visibility(
        visible: isVisibleSearch,
        child: TextField(
          controller: searchController,
          // onEditingComplete: searchMovies,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              // if (searchController.text.isNotEmpty){}
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                },
              ),
              prefixIcon: const Icon(Icons.search),
              // labelText: 'Поиск',
              hintText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder()),
        ),
      ),
    );
  }
}
