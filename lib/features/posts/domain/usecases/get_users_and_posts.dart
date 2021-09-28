import 'package:dartz/dartz.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/domain/repositories/abstract_post_repository.dart';

class GetUsersAndPosts {
  final AbstractPostRepository _postRepository;

  GetUsersAndPosts(this._postRepository);

  Future<Either<Failure, List<User>>> call() async {
    return await _postRepository.getPosts();
  }
}
