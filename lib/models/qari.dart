class Qari {
  String? name;
  String? path;
  String? format;
  Qari({this.name, this.path, this.format});

  factory Qari.fromjson(Map<String, dynamic> json) {
    return Qari(
      name: json["name"],
      format: json['file_formats'],
      path: json['relative_path'],
    );
  }
}
