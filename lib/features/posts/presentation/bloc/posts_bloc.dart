import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/domain/usecases/flush_posts.dart';
import 'package:koombea_pictures/features/posts/domain/usecases/get_users_and_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetUsersAndPosts _getUsersAndPosts;
  final FlushPosts _flushPosts;
  PostsBloc(this._getUsersAndPosts, this._flushPosts) : super(PostsLoading()) {
    on<PostsStarted>(_onPostsStarted);
    on<PostsRefreshed>(_onPostsRefreshed);
    add(PostsStarted());
  }

  void _onPostsStarted(PostsEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    final failureOrUsers = await _getUsersAndPosts();
    emit(
      failureOrUsers.fold(
        (l) {
          return PostsError(l.msg);
        },
        (r) => PostsLoaded(r),
      ),
    );
  }

  void _onPostsRefreshed(PostsEvent event, Emitter<PostsState> emit) async {
    final failureOrFlushed = await _flushPosts();
    if (failureOrFlushed.isRight()) {
      add(PostsStarted());
    } else {
      emit(const PostsError('No se puedo eliminar la informacón en cache'));
    }
  }
}
