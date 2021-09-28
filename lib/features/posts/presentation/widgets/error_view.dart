import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:koombea_pictures/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorView extends StatelessWidget {
  final String msg;
  const ErrorView({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
        ),
        AutoSizeText(
          msg,
          maxLines: 2,
          minFontSize: 20,
          maxFontSize: 25,
          textAlign: TextAlign.center,
        ),
        IconButton(onPressed: () => context.read<PostsBloc>().add(PostsStarted()), icon: const Icon(Icons.refresh))
      ],
    );
  }
}
