import 'package:koombea_pictures/error/exception.dart';
import 'package:koombea_pictures/features/posts/data/datasources/local_datasource.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:koombea_pictures/features/posts/domain/repositories/abstract_post_repository.dart';

class PostRepository implements AbstractPostRepository {
  PostRepository(this._remoteDataSource, this._localDataSource);
  final AbstractRemoteDataSource _remoteDataSource;
  final AbstractLocalDataSource _localDataSource;
  @override
  Future<Either<Failure, List<User>>> getPosts() async {
    try {
      final localInfo = await _localDataSource.getAll();
      if (localInfo.isNotEmpty) {
        return Right(localInfo);
      }
      final remoteInfo = await _remoteDataSource.getUsers();
      _localDataSource.saveAll(remoteInfo);
      return Right(remoteInfo);
    } on NetworkException {
      return const Left(NetworkFailure(msg: "Couldn't retrieve data please check your internet connection"));
    }
  }

  @override
  Future<Either<Failure, void>> flushOldPosts() async {
    try {
      return Right(await _localDataSource.deleteAll());
    } on LocalStorageExecption {
      return const Left(LocalStorageFailure());
    }
  }
}
