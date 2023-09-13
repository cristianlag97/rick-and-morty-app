import 'package:dio/dio.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';
import '../infraestructure.dart';

class GlobalDatasourceImpl {
  Future<T> methodXd<T>({
    int? page,
    String url = '/character/',
    String? filter,
    String? query,
    String? id,
    String? queryType,
  }) async {
    try {
      if (T == List<Result>) {
        return await methodXd2(
          page: page,
          url: url,
          queryType: queryType,
          filter: filter,
          query: query,
        ) as T;
      } else if (T == Info) {
        final response = await dio.get(url, queryParameters: {
          'page': page,
        });
        final responseModel = ModelCharacters.fromJson(response.data);
        final info = InfoMapper.infojsonToEntity(responseModel.info);
        return info as T;
      } else if (T == Result) {
        final response = await dio.get('$url$id');
        final responseModel = ModelResult.fromJson(response.data);
        final result = ResultMapper.resultjsonToEntity(responseModel);

        return result as T;
      } else {
        throw ResultnotFound('we do not use this data');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        throw ResultnotFound(e.response?.data['message'] ?? 'unhandled error');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<Result>> methodXd2({
    String? queryType,
    int? page,
    String? url,
    String? filter,
    String? query,
  }) async {
    final response = await dio.get(url!, queryParameters: {
      queryType == 'all' ? 'page' : '': page,
      queryType == 'filter' ? filter!.toLowerCase() : '': query,
      queryType == 'search' ? 'name' : '':
          queryType == 'search' ? filter : null,
    });
    print('=====> ${response.realUri}');
    final responseModel = ModelCharacters.fromJson(response.data);
    final results = responseModel.results
        .map((result) => ResultMapper.resultjsonToEntity(result))
        .toList();
    return results;
  }
}
