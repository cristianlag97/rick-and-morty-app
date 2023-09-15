part of infraestructure.mappers;

class ResultMapper {
  static Result resultjsonToEntity(ModelResult result) => Result(
        airDate: result.airDate ?? '',
        characters: List<String>.from(result.characters?.map((x) => x) ?? []),
        created: result.created,
        dimension: result.dimension ?? '',
        episode: result.episode ?? '',
        episodes: List<String>.from(result.episodes?.map((x) => x) ?? []),
        gender: result.gender,
        id: result.id,
        image: result.image,
        location: LocationMapper.locationjsonToEntity(result.location),
        name: result.name,
        origin: LocationMapper.locationjsonToEntity(result.origin),
        residents: List<String>.from(result.residents?.map((x) => x) ?? []),
        species: result.species,
        status: result.status,
        type: result.type,
        url: result.url,
      );
}
