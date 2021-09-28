import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:koombea_pictures/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:koombea_pictures/features/posts/presentation/widgets/error_view.dart';
import 'package:koombea_pictures/features/posts/presentation/widgets/posts_lists.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Get.find<PostsBloc>(),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoaded) {
                return LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  onRefresh: () async => context.read<PostsBloc>().add(PostsRefreshed()),
                  child: PostsList(users: state.users),
                );
              }
              if (state is PostsError) {
                return ErrorView(msg: state.msg);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
