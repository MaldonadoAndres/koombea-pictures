import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';

class UserInfo extends StatelessWidget {
  final User user;
  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 32,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset('assets/images/profile_placeholder.png'),
                    imageUrl: user.profilePicUrl,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  user.email,
                  minFontSize: 8,
                  maxFontSize: 12,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
