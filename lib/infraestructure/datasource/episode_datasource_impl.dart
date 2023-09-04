part of infraestructure.datasource;

class EpisodeDatasourceImpl extends EpisodesDatasource {
  @override
  Future<List<Result>> getAllEpisodes({int page = 1}) async {
    try {
      final response = await dio.get('/episode/', queryParameters: {
        'page': page,
      });
      final responseModel = ModelCharacters.fromJson(response.data);
      final results = responseModel.results
          .map((result) => ResultMapper.resultjsonToEntity(result))
          .toList();
      return results;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Info> getInfoEpisode({int page = 1}) async {
    try {
      final response = await dio.get('/episode/', queryParameters: {
        'page': page,
      });
      final responseModel = ModelCharacters.fromJson(response.data);
      final info = InfoMapper.infojsonToEntity(responseModel.info);

      return info;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Result>> getEpisodeByFilter({
    String filter = '',
    String query = '',
  }) async {
    try {
      final response = await dio.get('/episode/', queryParameters: {
        filter.toLowerCase(): query,
      });
      final responseModel = ModelCharacters.fromJson(response.data);
      final results = responseModel.results
          .map((result) => ResultMapper.resultjsonToEntity(result))
          .toList();
      return results;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Result> getEpisodeById(String episodeId) async {
    try {
      final response = await dio.get('/episode/$episodeId');
      final responseModel = ModelResult.fromJson(response.data);
      final result = ResultMapper.resultjsonToEntity(responseModel);

      return result;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
