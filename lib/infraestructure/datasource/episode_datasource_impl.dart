part of infraestructure.datasource;

class EpisodeDatasourceImpl extends EpisodesDatasource {
  @override
  Future<List<Result>> getAllEpisodes({int page = 1}) async {
    final data = await GlobalDatasourceImpl().consumer<List<Result>>(
      page: page,
      queryType: 'all',
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<Info> getInfoEpisode({int page = 1}) async {
    final data = await GlobalDatasourceImpl().consumer<Info>(
      page: page,
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<List<Result>> getEpisodeByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalDatasourceImpl().consumer<List<Result>>(
      filter: filter,
      query: query,
      queryType: 'filter',
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<Result> getEpisodeById(String episodeId) async {
    final data = await GlobalDatasourceImpl().consumer<Result>(
      id: episodeId,
      url: '/episode/',
    );
    return data;
  }
}
