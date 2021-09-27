import 'package:dio/dio.dart';
import 'package:koombea_pictures/api/endpoints.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class Api {
  factory Api() {
    final _dio = Dio();
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 150,
      ),
    );
    _dio.options = BaseOptions(
      receiveTimeout: 20000,
      connectTimeout: 20000,
    );
    return _Api(_dio);
  }

  @GET(kGetPosts)
  Future<UserReponse> getUsersPosts();
}
