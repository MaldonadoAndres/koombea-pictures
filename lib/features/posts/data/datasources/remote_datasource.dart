import 'package:koombea_pictures/api/api.dart';
import 'package:koombea_pictures/error/exception.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:logger/logger.dart';


abstract class AbstractRemoteDataSource {
  Future<List<User>> getUsers();
}

class RemoteDataSource implements AbstractRemoteDataSource {
  final Api _api;
  final _logger = Logger();

  RemoteDataSource(this._api);

  @override
  Future<List<User>> getUsers()async {
    try{
      final response = await _api.getUsersPosts();
      return response.data;
    }catch(e){
    _logger.e(e);
    throw NetworkException();
    }
  }
}
