part of infraestructure.models;

class ModelLocation {
  final String name;
  final String url;

  ModelLocation({
    required this.name,
    required this.url,
  });

  ModelLocation.fromJson(Map<String, dynamic> json)
      : name = json["name"] ?? '',
        url = json["url"] ?? '';
}
