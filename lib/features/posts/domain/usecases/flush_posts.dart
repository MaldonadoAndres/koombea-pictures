import 'package:dartz/dartz.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:koombea_pictures/features/posts/domain/repositories/abstract_post_repository.dart';

class FlushPosts {
  final AbstractPostRepository _postRepository;

  FlushPosts(this._postRepository);

  Future<Either<Failure, void>> call() async {
    return await _postRepository.flushOldPosts();
  }
}
