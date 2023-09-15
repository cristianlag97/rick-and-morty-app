part of domain.entities;

class Result {
  final DateTime created;
  final Gender gender;
  final int id;
  final List<String>? characters;
  final List<String>? episodes;
  final List<String>? residents;
  final LocationData location;
  final LocationData origin;
  final Status status;
  final String image;
  final String name;
  final String species;
  final String type;
  final String url;
  final String? airDate;
  final String? dimension;
  final String? episode;

  Result({
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
}
