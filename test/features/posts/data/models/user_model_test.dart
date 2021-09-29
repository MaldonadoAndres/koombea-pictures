import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:koombea_pictures/features/posts/domain/entities/post.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';

import '../../../../fixtures/reader.dart';

void main() {
  const tUser = User('e406bae8-1fd4-4e33-81d3-2fd053a40493', 'Midoriya Izuku', 'allmigth@uaschool.com', 'www.test.com', <Post>[]);
  group('fromJson User', () {
    test(
      'should return a valid User model from the response',
      () async {
        // arrange
        final jsonMap = jsonDecode(fixture('user.json'));
        // act
        final result = User.fromJson(jsonMap);
        // assert
        expect(result, tUser);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tUser.toJson();
        // assert
        final expectedMap = {"uid": "e406bae8-1fd4-4e33-81d3-2fd053a40493", "name": "Midoriya Izuku", "email": "allmigth@uaschool.com", "profile_pic": "www.test.com", "posts": []};
        expect(result, expectedMap);
      },
    );
  });
}
