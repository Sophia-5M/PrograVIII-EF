import 'dart:convert';

class ImagesC {
  ImagesC(
      {required this.filePath,
      required this.height,
      required this.width,
      required this.id,
      required this.fileType});

  String filePath;
  int? height;
  int? width;
  int id;
  String? fileType;

  factory ImagesC.fromJson(String str) => ImagesC.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImagesC.fromMap(Map<String, dynamic> json) => ImagesC(
        filePath: json["file_path"],
        height: json["height"],
        width: json["width"],
        id: json["id"] ?? 0,
        fileType: json["file_type"],
      );

  Map<String, dynamic> toMap() => {
        "file_path": filePath,
        "height": height,
        "width": width,
        "id": id,
        "file_type": fileType,
      };
}
