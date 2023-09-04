part of infraestructure.models;

class ModelResult {
  final int id;
  final String name;
  final Status status;
  final String species;
  final String type;
  final Gender gender;
  final ModelLocation origin;
  final ModelLocation location;
  final String image;
  final List<String>? episodes;
  final List<String>? characters;
  final List<String>? residents;
  final String url;
  final DateTime created;
  final String? airDate;
  final String? episode;
  final String? dimension;

  ModelResult({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.url,
    required this.created,
    this.episodes,
    this.characters,
    this.airDate,
    this.episode,
    this.dimension,
    this.residents,
  });

  ModelResult.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json["name"] ?? '',
        status = statusValues.map[json["status"]] ?? Status.unknown,
        species = json["species"] ?? '',
        type = json["type"] ?? '',
        gender = genderValues.map[json["gender"]] ?? Gender.unknown,
        origin = ModelLocation.fromJson(json["origin"] ?? {}),
        location = ModelLocation.fromJson(json["location"] ?? {}),
        image = json["image"] ?? '',
        episodes = json["episode"] is List<dynamic>
            ? List<String>.from(json["episode"])
            : [],
        characters = List<String>.from(
            json["characters"] != null ? json["characters"].map((x) => x) : []),
        residents = List<String>.from(
            json["residents"] != null ? json["residents"].map((x) => x) : []),
        url = json["url"] ?? '',
        created = DateTime.parse(json["created"] ?? DateTime.now()),
        airDate = json["air_date"] ?? '',
        episode = json["episode"] is String
            ? json["episode"]
            : (json["episode"] is List<String> ? json["episode"][0] : ''),
        dimension = json["dimension"] ?? '';
}
