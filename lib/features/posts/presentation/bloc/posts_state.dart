part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsLoaded extends PostsState {
  final List<User> users;

  const PostsLoaded(this.users);
  @override
  List<Object> get props => [users];
}

class PostsLoading extends PostsState {}

class PostsError extends PostsState {}
