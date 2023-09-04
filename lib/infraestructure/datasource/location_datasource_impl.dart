part of infraestructure.datasource;

class LocationDatasourceImpl extends LocationsDatarource {
  @override
  Future<List<Result>> getAllLocations({int page = 1}) async {
    try {
      final response = await dio.get('/location/', queryParameters: {
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
  Future<Info> getInfoLocation({int page = 1}) async {
    try {
      final response = await dio.get('/location/', queryParameters: {
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
  Future<List<Result>> getLocationByFilter({
    String filter = '',
    String query = '',
  }) async {
    try {
      final response = await dio.get('/location/', queryParameters: {
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
  Future<Result> getLocationById(String locationId) async {
    try {
      final response = await dio.get('/location/$locationId');
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

  @override
  Future<List<Result>> getLocationBySearch(String filter) async {
    try {
      final response = await dio.get('/location/', queryParameters: {
        'name': filter,
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
}
