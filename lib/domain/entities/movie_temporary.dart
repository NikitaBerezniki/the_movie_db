// import 'package:json_annotation/json_annotation.dart';

// import '../../resources/images.dart';

// // GET /movie/{movie_id}

// @JsonSerializable()
// class MovieTemporary {

  
//   final int id;
//   final double rating;
//   final Map genre;
//   final String duration;
//   final String quote;
//   final String imagePoster;
//   final String imageBackground;
//   final String title;
//   final DateTime? time;
//   final String description;

//   MovieTemporary(
//   {
//     required this.id,
//   required this.rating,
//   required this.genre,
//   required this.duration,
//   required this.quote,
//   required this.imagePoster,
//   required this.imageBackground,
//   required this.title,
//   required this.time,
//   required this.description
//   });
// }

// List<MovieTemporary> movies = <MovieTemporary>[
//   MovieTemporary(
//     id: 1,
//     genre: {"action": "", "adventures": "", "fantastic": ""},
//     duration: '2h 28m',
//     quote: '«Мультивселенная на свободе»',
//     rating: 84,
//     imagePoster: AppImages.posterSpiderMan,
//     imageBackground: AppImages.backgroundSpiderMan,
//     title: 'Человек-паук: Нет пути домой',
//     time: DateTime.tryParse('2021-12-15'),
//     description:
//         'Мистерио удаётся выяснить истинную личность Человека-паука. С этого момента жизнь Питера Паркера становится невыносимой. Если ранее он мог успешно переключаться между своими амплуа, то сейчас это сделать невозможно. Переворачивается с ног на голову не только жизнь Человека-пауку, но и репутация. Понимая, что так жить невозможно, главный герой фильма «Человек-паук: Нет пути домой» принимает решение обратиться за помощью к своему давнему знакомому Стивену Стрэнджу. Питер Паркер надеется, что с помощью магии он сможет восстановить его анонимность. Стрэндж соглашается помочь.',
//   ),
//   MovieTemporary(
//     id: 2,
//     rating: 84,
//     genre: {'action': '', 'adventures': '', 'fantastic': ''},
//     duration: '2h 28m',
//     quote: '«Мультивселенная на свободе»',
//     imagePoster: AppImages.posterBatman,
//     imageBackground: AppImages.backgroundSpiderMan,
//     title: 'Бэтмен',
//     time: DateTime.tryParse('1 марта 2022'),
//     description:
//         'После двух лет поисков правосудия на улицах Готэма для своих сограждан Бэтмен становится олицетворением беспощадного возмездия.',
//   ),
//   MovieTemporary(
//       id: 3,
//       rating: 84,
//       genre: {'action': '', 'adventures': '', 'fantastic': ''},
//       duration: '2h 28m',
//       quote: '«Мультивселенная на свободе»',
//       imagePoster: AppImages.posterEnkanto,
//       imageBackground: AppImages.backgroundSpiderMan,
//       title: 'Энканто',
//       time: DateTime.tryParse('24 ноября 2021'),
//       description:
//           'Удивительная семья Мадригалов живет в спрятанном в горах Колумбии волшебном доме, расположенном в чудесном и очаровательном уголке под названием Энканто. Каждого ребёнка в семье Мадригалов магия этого места благословила уникальным даром — от суперсилы до способности исцелять. Увы, магия обошла стороной одну лишь юную Мирабель. Обнаружив, что магия Энканто находится в опасности, Мирабель'),
//   MovieTemporary(
//       id: 4,
//       rating: 84,
//       genre: {'action': '', 'adventures': '', 'fantastic': ''},
//       duration: '2h 28m',
//       quote: '«Мультивселенная на свободе»',
//       imagePoster: AppImages.posterKrik,
//       imageBackground: AppImages.backgroundSpiderMan,
//       title: 'Крик',
//       time: DateTime.tryParse('12 января 2022'),
//       description:
//           'Спустя 25 лет после жестоких убийств, потрясших тихий городок Вудсборо, и выхода серии культовых слэшеров на основе тех событий старшеклассница Тара подвергается нападению, такому же, как и в фильме. Узнав о случившемся, в Вудсборо возвращается её старшая сестра Сэм и просит помощи у бывшего шерифа городка Дьюи Райли в поимке нового убийцы, скрывающегося за маской Призрачного лица.'),
//   MovieTemporary(
//       id: 5,
//       rating: 84,
//       genre: {'action': '', 'adventures': '', 'fantastic': ''},
//       duration: '2h 28m',
//       quote: '«Мультивселенная на свободе»',
//       imagePoster: AppImages.posterKingsman,
//       imageBackground: AppImages.backgroundSpiderMan,
//       title: 'Kings Man: Начало',
//       time: DateTime.tryParse('22 декабря 2021'),
//       description:
//           'Kingsman — организация супершпионов, действующая на благо человечества вдали от любопытных глаз. И один из первых и самых талантливых оперативников в истории организации — Конрад, молодой и наглый сын герцога Оксфордского. Как и многие его друзья он мечтал служить на благо Англии, но в итоге оказался втянут в тайный мир шпионов и убийц.'),
//   MovieTemporary(
//       id: 6,
//       rating: 84,
//       genre: {'action': '', 'adventures': '', 'fantastic': ''},
//       duration: '2h 28m',
//       quote: '«Мультивселенная на свободе»',
//       imagePoster: AppImages.posterkimi,
//       imageBackground: AppImages.backgroundSpiderMan,
//       title: 'Кими',
//       time: DateTime.tryParse('10 февраля 2022'),
//       description:
//           'В центре сюжета фильма — Анджела Чайлдс, которая занимается расшифровкой аудиозаписей и работает на компанию, создавшую популярного голосового помощника KIMI. Именно он однажды записывает ссору двух людей, которая, как полагает Чайлдс, закончилась убийством. Девушка решает найти виновного, но её работодатели почему-то отказываются дать делу ход.')
// ];
