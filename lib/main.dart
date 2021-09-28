import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/presentation/pages/posts_page.dart';

import 'features/posts/domain/entities/post.dart';
import 'injector.dart';

Future<void> main() async {
  Injector.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PostAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostsPage(),
    );
  }
}
