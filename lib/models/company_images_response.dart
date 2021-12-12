import 'dart:convert';

import 'package:cartelera/models/company_images.dart';

import 'models.dart';

class CompanyImagesResponse {
  CompanyImagesResponse({
    required this.id,
    required this.logos,
  });

  int id;
  List<ImagesC> logos;

  factory CompanyImagesResponse.fromJson(String str) =>
      CompanyImagesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyImagesResponse.fromMap(Map<String, dynamic> json) =>
      CompanyImagesResponse(
        id: json["id"],
        logos: List<ImagesC>.from(
            json["backdrops"].map((x) => ImagesC.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "backdrops": List<dynamic>.from(logos.map((x) => x.toMap())),
      };
}
