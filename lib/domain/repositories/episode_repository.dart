part of config.repositories;

abstract class EpisodeRepository {
  Future<Info> getInfoEpisode({int page = 1});
  Future<List<Result>> getAllEpisode({int page = 1});
  Future<List<Result>> getEpisodeByFilter({String filter, String query});
  Future<Result> getEpisodeById(String episodeId);
}
