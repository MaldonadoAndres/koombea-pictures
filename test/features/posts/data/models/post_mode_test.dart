import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:koombea_pictures/features/posts/domain/entities/post.dart';

import '../../../../fixtures/reader.dart';

void main() {
  const tPost = Post(50531, 'Tue Mar 08 2022 06:56:06 GMT-0500', <String>[]);
  group('fromJson Post', () {
    test(
      'should return a valid Post model from the response',
      () async {
        // arrange
        final jsonMap = jsonDecode(fixture('post.json'));
        // act
        final result = Post.fromJson(jsonMap);
        // assert
        expect(result, tPost);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tPost.toJson();
        // assert
        final expectedMap = {"id": 50531, "date": "Tue Mar 08 2022 06:56:06 GMT-0500", "pics": []};
        expect(result, expectedMap);
      },
    );
  });
}
