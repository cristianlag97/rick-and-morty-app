part of infraestructure.mappers;

class InfoMapper {
  static Info infojsonToEntity(ModelInfo info) => Info(
        count: info.count,
        next: info.next,
        pages: info.pages,
        prev: info.prev,
      );
}
