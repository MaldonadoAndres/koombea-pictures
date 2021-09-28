import 'package:get/get.dart';
import 'package:koombea_pictures/api/api.dart';
import 'package:koombea_pictures/features/posts/data/datasources/local_datasource.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'package:koombea_pictures/features/posts/domain/usecases/flush_posts.dart';
import 'features/posts/data/repositories/post_repository.dart';
import 'features/posts/domain/repositories/abstract_post_repository.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';
import 'features/posts/domain/usecases/get_users_and_posts.dart';

abstract class Injector {
  static void init() {
    Get.lazyPut<Api>(() => Api());
    Get.lazyPut<AbstractRemoteDataSource>(() => RemoteDataSource(Get.find()));
    Get.lazyPut<AbstractLocalDataSource>(() => LocalDataSource());
    Get.lazyPut<AbstractPostRepository>(() => PostRepository(Get.find(), Get.find()));
    Get.lazyPut<GetUsersAndPosts>(() => GetUsersAndPosts(Get.find()));
    Get.lazyPut<FlushPosts>(() => FlushPosts(Get.find()));
    Get.lazyPut<PostsBloc>(() => PostsBloc(Get.find(), Get.find()));
  }
}
