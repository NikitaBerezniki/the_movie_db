import 'dart:convert';
import 'package:the_movie_db/json_serialization/dataclasses.dart';

const String jsonUser = '''{
    "id": 1,
    "name": "Leanne Graham",
    "password": "123",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": [
          {
          "lat": "-37.3159",
          "lng": "81.1496"
        },
        {
          "lat": "-37.3159",
          "lng": "81.1496"
        },
      ]
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
  ''';

class JsonCoder {
  void decode() {
    // из строки в объект fromJson
    final user = jsonDecode(jsonUser) as User;
    // final users =
    // json.map((e) => User.fromJson(e) as Map<String, dynamic>).toList();
    print(user);
  }

  void encode() {
    // из объекта в строку toJson
  }
}
