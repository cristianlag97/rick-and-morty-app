part of infraestructure.datasource;

class CharactersDatasourceImpl extends CharactersDatarource {
  @override
  Future<List<Result>> getAllCharacter({int page = 1}) async {
    final data = await GlobalDatasourceImpl().methodXd<List<Result>>(
      page: page,
      url: '/character/',
      queryType: 'all',
    );
    return data;
    // try {
    // final response = await dio.get('/character/', queryParameters: {
    //   'page': page,
    // });
    // final responseModel = ModelCharacters.fromJson(response.data);
    // final results = responseModel.results
    //     .map((result) => ResultMapper.resultjsonToEntity(result))
    //     .toList();
    // return results;
    // } on DioException catch (e) {
    //   if (e.response!.statusCode == 404) {
    //     throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
    //   }
    //   throw Exception();
    // } catch (e) {
    //   throw Exception();
    // }
  }

  @override
  Future<Info> getInfoCharacter({int page = 1}) async {
    final data = await GlobalDatasourceImpl().methodXd<Info>(
      page: 1,
      url: '/character/',
    );
    return data;
    // try {
    //   final response = await dio.get('/character/', queryParameters: {
    //     'page': page,
    //   });
    //   final responseModel = ModelCharacters.fromJson(response.data);
    //   final info = InfoMapper.infojsonToEntity(responseModel.info);

    //   return info;
    // } on DioException catch (e) {
    //   if (e.response!.statusCode == 404) {
    //     throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
    //   }
    //   throw Exception();
    // } catch (e) {
    //   throw Exception();
    // }
  }

  @override
  Future<List<Result>> getCharacterByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalDatasourceImpl().methodXd<List<Result>>(
      url: '/character/',
      filter: filter,
      query: query,
      queryType: 'filter',
    );
    return data;
    // try {
    //   final response = await dio.get('/character/', queryParameters: {
    //     filter.toLowerCase(): query,
    //   });
    //   final responseModel = ModelCharacters.fromJson(response.data);
    //   final results = responseModel.results
    //       .map((result) => ResultMapper.resultjsonToEntity(result))
    //       .toList();
    //   return results;
    // } on DioException catch (e) {
    //   if (e.response!.statusCode == 404) {
    //     throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
    //   }
    //   throw Exception();
    // } catch (e) {
    //   throw Exception();
    // }
  }

  @override
  Future<Result> getCharacterById(String characterId) async {
    final data = await GlobalDatasourceImpl().methodXd<Result>(
      id: characterId,
      url: '/character/',
    );
    return data;
    // try {
    //   final response = await dio.get('/character/$characterId');
    //   final responseModel = ModelResult.fromJson(response.data);
    //   final result = ResultMapper.resultjsonToEntity(responseModel);

    //   return result;
    // } on DioException catch (e) {
    //   if (e.response!.statusCode == 404) {
    //     throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
    //   }
    //   throw Exception();
    // } catch (e) {
    //   throw Exception();
    // }
  }

  @override
  Future<List<Result>> getCharacterBySearch(String filter) async {
    // final data = await GlobalDatasourceImpl().methodXd<List<Result>>(
    //     url: '/character/', filter: 'name', query: filter, queryType: 'search');
    // return data;
    try {
      final response = await dio.get('/character/', queryParameters: {
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
