import 'package:get/get.dart';
import 'package:koombea_pictures/api/api.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'features/posts/data/repositories/post_repository.dart';
import 'features/posts/domain/repositories/abstract_post_repository.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';
import 'features/posts/domain/usecases/get_users_and_posts.dart';

abstract class Injector {
  static void init() {
    Get.lazyPut<Api>(() => Api());
    Get.lazyPut<AbstractRemoteDataSource>(() => RemoteDataSource(Get.find()));
    Get.lazyPut<AbstractPostRepository>(() => PostRepository(Get.find()));
    Get.lazyPut<GetUsersAndPosts>(() => GetUsersAndPosts(Get.find()));
    Get.lazyPut<PostsBloc>(() => PostsBloc(Get.find()));
  }
}
