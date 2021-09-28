part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class PostsStarted extends PostsEvent {}

class PostsRefreshed extends PostsEvent {}
