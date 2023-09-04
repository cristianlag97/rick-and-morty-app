part of config.repositories;

abstract class EpisodeRepository {
  Future<List<Result>> getAllEpisode({int page = 1});
  Future<Info> getInfoEpisode({int page = 1});
  Future<Result> getEpisodeById(String episodeId);
  Future<List<Result>> getEpisodeByFilter({String filter, String query});
}
