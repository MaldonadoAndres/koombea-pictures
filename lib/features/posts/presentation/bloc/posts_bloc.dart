import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/domain/usecases/get_users_and_posts.dart';
import 'package:logger/logger.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetUsersAndPosts _getUsersAndPosts;
  PostsBloc(this._getUsersAndPosts) : super(PostsLoading()) {
    on<PostsStarted>(_onPostsStarted);
    on<PostsRefreshed>(_onPostsStarted);
    add(PostsStarted());
  }

  void _onPostsStarted(PostsEvent event, Emitter<PostsState> emit) async {
    Logger().d('Retrieving Posts');
    final failureOrUsers = await _getUsersAndPosts();
    emit(
      failureOrUsers.fold(
        (l) {
          Logger().e(l);
          return PostsError();
        },
        (r) => PostsLoaded(r),
      ),
    );
  }
}
