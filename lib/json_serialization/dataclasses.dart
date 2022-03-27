class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  String toString() {
    return 'User: $id $name $username $email $address $phone $website $company\n';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: Address.fromJson(json['address']),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company: Company.fromJson(json['company']),
    );
  }

        Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'address': address.toJson(),
      'phone':phone,
      'website':website,
      'company':company.toJson(),
    };
  }

}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geopos geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  String toString() {
    return '(Address: $street $suite $city $zipcode $geo)';
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: Geopos.fromJson(json['geo']),
    );
  }

      Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }

}

class Geopos {
  final String lat;
  final String lng;

  Geopos({required this.lat, required this.lng});

  @override
  String toString() {
    return '(geo: $lat, $lng)';
  }

  factory Geopos.fromJson(Map<String, dynamic> paredJson) {
    return Geopos(
      lat: paredJson['lat'].toString(),
      lng: paredJson['lng'].toString(),
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng
    };
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

  @override
  String toString() {
    return '(Company: $name, $catchPhrase, $bs)';
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs
    };
  }
}
