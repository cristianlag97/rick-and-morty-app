part of infraestructure.models;

class ModelResult {
  final DateTime created;
  final Gender gender;
  final int id;
  final List<String>? characters;
  final List<String>? episodes;
  final List<String>? residents;
  final ModelLocation location;
  final ModelLocation origin;
  final Status status;
  final String image;
  final String name;
  final String species;
  final String type;
  final String url;
  final String? airDate;
  final String? dimension;
  final String? episode;

  ModelResult({
    required this.created,
    required this.gender,
    required this.id,
    required this.image,
    required this.location,
    required this.name,
    required this.origin,
    required this.species,
    required this.status,
    required this.type,
    required this.url,
    this.airDate,
    this.characters,
    this.dimension,
    this.episode,
    this.episodes,
    this.residents,
  });

  ModelResult.fromJson(Map<String, dynamic> json)
      : created = DateTime.parse(json["created"] ?? DateTime.now()),
        gender = genderValues.map[json["gender"]] ?? Gender.unknown,
        id = json["id"] ?? 0,
        image = json["image"] ?? '',
        location = ModelLocation.fromJson(json["location"] ?? {}),
        name = json["name"] ?? '',
        origin = ModelLocation.fromJson(json["origin"] ?? {}),
        species = json["species"] ?? '',
        status = statusValues.map[json["status"]] ?? Status.unknown,
        type = json["type"] ?? '',
        url = json["url"] ?? '',
        airDate = json["air_date"] ?? '',
        characters = List<String>.from(
            json["characters"] != null ? json["characters"].map((x) => x) : []),
        dimension = json["dimension"] ?? '',
        episode = json["episode"] is String
            ? json["episode"]
            : (json["episode"] is List<String> ? json["episode"][0] : ''),
        episodes = json["episode"] is List<dynamic>
            ? List<String>.from(json["episode"])
            : [],
        residents = List<String>.from(
            json["residents"] != null ? json["residents"].map((x) => x) : []);
}
