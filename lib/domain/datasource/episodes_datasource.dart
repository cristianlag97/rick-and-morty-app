part of domain.datasource;

abstract class EpisodesDatasource {
  Future<List<Result>> getAllEpisodes({int page = 1});
  Future<Info> getInfoEpisode({int page = 1});
  Future<Result> getEpisodeById(String episodeId);
  Future<List<Result>> getEpisodeByFilter({String filter, String query});
}
