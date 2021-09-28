import 'package:koombea_pictures/error/exception.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:koombea_pictures/features/posts/domain/repositories/abstract_post_repository.dart';

class PostRepository implements AbstractPostRepository {
  PostRepository(this._remoteDataSource);
  final AbstractRemoteDataSource _remoteDataSource;
  @override
  Future<Either<Failure, List<User>>> getPosts() async {
    try {
      return Right(await _remoteDataSource.getUsers());
    } on NetworkException {
      return const Left(NetworkFailure(msg: 'Network Error'));
    }
  }
}
