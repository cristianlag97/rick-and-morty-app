part of imfraestructure.repository;

class EpisodeRepositoryImpl extends EpisodeRepository {
  final EpisodesDatasource episodeDatarource;

  EpisodeRepositoryImpl(this.episodeDatarource);

  @override
  Future<List<Result>> getAllEpisode({int page = 1}) {
    return episodeDatarource.getAllEpisodes(page: page);
  }

  @override
  Future<Info> getInfoEpisode({int page = 1}) {
    return episodeDatarource.getInfoEpisode(page: page);
  }

  @override
  Future<List<Result>> getEpisodeByFilter({
    String filter = '',
    String query = '',
  }) {
    return episodeDatarource.getEpisodeByFilter(filter: filter, query: query);
  }

  @override
  Future<Result> getEpisodeById(String episodeId) {
    return episodeDatarource.getEpisodeById(episodeId);
  }
}
