import 'package:dartz/dartz.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';

abstract class AbstractPostRepository {
  Future<Either<Failure, List<User>>> getPosts();
  Future<Either<Failure, void>> flushOldPosts();
}
