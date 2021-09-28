import 'package:flutter/material.dart';

import 'one_image_box.dart';

class PlusUltraImageBox extends StatelessWidget {
  final List<String> picsUrl;
  const PlusUltraImageBox({Key? key, required this.picsUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String bigPic = picsUrl.removeAt(0);
    return Column(
      children: [
        OneImageBox(picUrl: bigPic),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: picsUrl.length,
            itemBuilder: (context, index) {
              return OneImageBox(
                picUrl: picsUrl[index],
                isBigPicture: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
