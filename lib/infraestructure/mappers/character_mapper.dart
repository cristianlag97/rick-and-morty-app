part of infraestructure.mappers;

class CharacterMapper {
  static Character jsonToEntity(Map<String, dynamic> json) => Character(
        results: ResultMapper.resultjsonToEntity(json['result']),
        info: InfoMapper.infojsonToEntity(json['info']),
      );
}
