part of infraestructure.mappers;

class ResultMapper {
  static Result resultjsonToEntity(ModelResult result) => Result(
        id: result.id,
        name: result.name,
        status: result.status,
        species: result.species,
        type: result.type,
        gender: result.gender,
        origin: LocationMapper.locationjsonToEntity(result.origin),
        location: LocationMapper.locationjsonToEntity(result.location),
        image: result.image,
        episodes: List<String>.from(result.episodes?.map((x) => x) ?? []),
        characters: List<String>.from(result.characters?.map((x) => x) ?? []),
        residents: List<String>.from(result.residents?.map((x) => x) ?? []),
        url: result.url,
        created: result.created,
        airDate: result.airDate ?? '',
        episode: result.episode ?? '',
        dimension: result.dimension ?? '',
      );
}
