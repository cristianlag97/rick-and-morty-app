part of domain.datasource;

abstract class EpisodesDatasource {
  Future<Info> getInfoEpisode({int page = 1});
  Future<List<Result>> getAllEpisodes({int page = 1});
  Future<List<Result>> getEpisodeByFilter({String filter, String query});
  Future<Result> getEpisodeById(String episodeId);
}
