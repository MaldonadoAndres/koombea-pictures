import 'package:flutter/material.dart';
import 'package:koombea_pictures/features/posts/domain/entities/post.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/presentation/widgets/plus_ultra_image_box.dart';
import 'package:koombea_pictures/features/posts/presentation/widgets/two_image_box.dart';
import 'package:koombea_pictures/utils/date_utils.dart';

import 'one_image_box.dart';
import 'user_info.dart';

class PostsList extends StatelessWidget {
  final List<User> users;

  const PostsList({Key? key, required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            UserInfo(user: users[index]),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users[index].posts.length,
              shrinkWrap: true,
              itemBuilder: (context, index1) {
                return Column(
                  children: [
                    Text(getOrdinalDate(users[index].posts[index1].date)),
                    getPreviewWidget(
                      users[index].posts[index1],
                    ),
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }
}

Widget getPreviewWidget(Post post) {
  switch (post.pics.length) {
    case 1:
      return OneImageBox(picUrl: post.pics.first);
    case 2:
      return TwoImageBox(picsUrl: post.pics);
    default:
      return PlusUltraImageBox(picsUrl: post.pics);
  }
}
