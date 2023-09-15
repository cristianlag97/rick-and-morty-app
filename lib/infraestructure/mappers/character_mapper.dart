part of infraestructure.mappers;

class CharacterMapper {
  static Character jsonToEntity(Map<String, dynamic> json) => Character(
        info: InfoMapper.infojsonToEntity(json['info']),
        results: ResultMapper.resultjsonToEntity(json['result']),
      );
}
