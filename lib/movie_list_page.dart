import 'package:flutter/material.dart';
import 'package:the_movie_database/images.dart';
import 'package:the_movie_database/main.dart';

List<Movie> movies = <Movie>[
  Movie(
    id: 1,
    imagePoster: AppImages.posterSpiderMan,
    imageBackground: AppImages.backgroundSpiderMan,
    title: 'Spider-man: not way home',
    time: '15 декабря 2021',
    description:
        'Действие фильма «Человек-паук: Нет пути домой» начинает своё развитие в тот момент, когда Мистерио удаётся выяснить истинную личность Человека-паука.',
  ),
  Movie(
    id: 2,
    imagePoster: AppImages.posterBatman,
    imageBackground: AppImages.backgroundSpiderMan,
    title: 'Бэтмен',
    time: '1 марта 2022',
    description:
        'После двух лет поисков правосудия на улицах Готэма для своих сограждан Бэтмен становится олицетворением беспощадного возмездия.',
  ),
  Movie(
      id: 3,
      imagePoster: AppImages.posterEnkanto,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Энканто',
      time: '24 ноября 2021',
      description:
          'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель'),
  Movie(
      id: 4,
      imagePoster: AppImages.posterKrik,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Крик',
      time: '12 января 2022',
      description:
          'Спустя 25 лет после жестоких убийств, потрясших тихий городок Вудсборо, и выхода серии культовых слэшеров на основе тех событий старшеклассница Тара подвергается нападению, такому же, как и в фильме. Узнав о случившемся, в Вудсборо возвращается её старшая сестра Сэм и просит помощи у бывшего шерифа городка Дьюи Райли в поимке нового убийцы, скрывающегося за маской Призрачного лица.'),
  Movie(
      id: 5,
      imagePoster: AppImages.posterKingsman,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Kings Man: Начало',
      time: '22 декабря 2021',
      description:
          'Kingsman — организация супершпионов, действующая на благо человечества вдали от любопытных глаз. И один из первых и самых талантливых оперативников в истории организации — Конрад, молодой и наглый сын герцога Оксфордского. Как и многие его друзья он мечтал служить на благо Англии, но в итоге оказался втянут в тайный мир шпионов и убийц.'),
  Movie(
      id: 6,
      imagePoster: AppImages.posterkimi,
      imageBackground: AppImages.backgroundSpiderMan,
      title: 'Кими',
      time: '10 февраля 2022',
      description:
          'В центре сюжета фильма — Анджела Чайлдс, которая занимается расшифровкой аудиозаписей и работает на компанию, создавшую популярного голосового помощника KIMI. Именно он однажды записывает ссору двух людей, которая, как полагает Чайлдс, закончилась убийством. Девушка решает найти виновного, но её работодатели почему-то отказываются дать делу ход.')
];

class Movie {
  final int id;
  final String imagePoster;
  final String imageBackground;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
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
          padding: isVisibleSearch ? const EdgeInsets.only(top: 70) : null,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppStyleClass.whiteColor,
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
                              movie.time,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              movie.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ]),
                    ),
                  ]),
                ),
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
        Padding(
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
        )
      ],
    );
  }
}
