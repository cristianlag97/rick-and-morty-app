part of domain.entities;

class Result {
  final int id;
  final String name;
  final Status status;
  final String species;
  final String type;
  final Gender gender;
  final LocationData origin;
  final LocationData location;
  final String image;
  final List<String>? episodes;
  final List<String>? characters;
  final List<String>? residents;
  final String url;
  final DateTime created;
  final String? airDate;
  final String? episode;
  final String? dimension;

  Result({
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
}
