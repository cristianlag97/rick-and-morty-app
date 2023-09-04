part of infraestructure.mappers;

class InfoMapper {
  static Info infojsonToEntity(ModelInfo info) => Info(
        count: info.count,
        pages: info.pages,
        next: info.next,
        prev: info.prev,
      );
}
