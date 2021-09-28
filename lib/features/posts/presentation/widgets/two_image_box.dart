import 'package:flutter/material.dart';

import 'one_image_box.dart';

class TwoImageBox extends StatelessWidget {
  final List<String> picsUrl;

  const TwoImageBox({Key? key, required this.picsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: OneImageBox(
          picUrl: picsUrl[0],
          isBigPicture: false,
        )),
        Flexible(
          child: OneImageBox(
            picUrl: picsUrl[1],
            isBigPicture: false,
          ),
        ),
      ],
    );
  }
}
