class User {
  final int id;
  final String name;
  final String username;
  final String password;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User( {
    required this.id,
    required this.name,
    required this.password,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      password: json['password']as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: json['address'] as Address,
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: json['company'] as Company,
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final List<Geopos> geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: (json['geo'] as List<Geopos>)
          .map((dynamic e) => Geopos.fromJson(e as Map<String, String>))
          .toList(),
    );
  }
}

class Geopos {
  final String lat;
  final String lng;

  Geopos({required this.lat, required this.lng});

  factory Geopos.fromJson(Map<String, String> json) {
    return Geopos(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  factory Company.fromJson(Map<String, String> json) {
    return Company(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }
  // factory Company.toJson(Map<String, String> json){
  //   return Company(name: name, catchPhrase: catchPhrase, bs: bs)
  // }
}
