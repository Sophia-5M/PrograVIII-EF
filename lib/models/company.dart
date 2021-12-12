import 'dart:convert';

class Company {
  Company({
    required this.logoPath,
    required this.headquarters,
    required this.homepage,
    required this.id,
    required this.name,
    required this.originCountry,
  });

  String logoPath;
  String headquarters;
  String homepage;
  int id;
  String name;
  String originCountry;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        logoPath: json["logo_path"],
        headquarters: json['headquarters'],
        homepage: json['homepage'],
        id: json['id'],
        name: json['name'],
        originCountry: json['origin_country'],
      );

  Map<String, dynamic> toMap() => {
        "logo_path": logoPath,
        "headquarters": headquarters,
        "homepage": homepage,
        "id": id,
        "name": name,
        "origin_country": originCountry,
      };
}
