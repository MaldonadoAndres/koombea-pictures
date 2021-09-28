import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OneImageBox extends StatelessWidget {
  final String picUrl;
  final bool isBigPicture;

  const OneImageBox({Key? key, required this.picUrl, this.isBigPicture = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => showPicturePreview(context, picUrl),
        child: Container(
          color: const Color(0xFFF9F6EE),
          child: CachedNetworkImage(
            placeholder: (_, __) => const SizedBox(
              height: 10,
              width: 10,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
            imageUrl: picUrl,
            height: isBigPicture ? 400 : 200,
            width: isBigPicture ? 400 : 200,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

showPicturePreview(BuildContext context, String picUrl) {
  final alert = BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: AlertDialog(
      contentPadding: const EdgeInsets.all(5),
      content: GestureDetector(
        onVerticalDragDown: (_) => Navigator.pop(context),
        child: CachedNetworkImage(
          placeholder: (_, __) => const SizedBox(
            height: 10,
            width: 10,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          imageUrl: picUrl,
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => alert,
  );
}
