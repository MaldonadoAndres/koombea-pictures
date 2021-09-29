import 'package:flutter_test/flutter_test.dart';
import 'package:koombea_pictures/api/api.dart';
import 'package:koombea_pictures/error/exception.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_datasources_test.mocks.dart';

@GenerateMocks([Api])
void main() {
  late AbstractRemoteDataSource _remoteDataSource;
  late MockApi _mockApi;
  setUp(() {
    _mockApi = MockApi();
    _remoteDataSource = RemoteDataSource(_mockApi);
  });
  void setUpMockApiSuccess() {
    when(_mockApi.getUsersPosts()).thenAnswer((_) async => UserReponse([]));
  }

  void setUpMockApiFailure() {
    when(_mockApi.getUsersPosts()).thenThrow(NetworkException());
  }

  group('get posts and user information', () {
    test('should return a list of users with posts', () async {
      setUpMockApiSuccess();
      final result = await _remoteDataSource.getUsers();
      expect(result, isA<List<User>>());
    });
  });
  test('should throw a [NetworkException] if api call is unsuccessful', () async {
    // arrange
    setUpMockApiFailure();
    // act
    final call = _mockApi.getUsersPosts;
    // assert
    expect(() => call(), throwsA(isA<NetworkException>()));
  });
  test(
    'should execute the getUsers() function of the Api class',
    () async {
      // arrange
      setUpMockApiSuccess();
      // act
      _remoteDataSource.getUsers();
      // assert
      verify(_mockApi.getUsersPosts());
    },
  );
  test('should return an [UserReponse] object if api call is successful', () async {
    // arrange
    setUpMockApiSuccess();
    // act
    final result = await _mockApi.getUsersPosts();
    // assert
    expect(result, isA<UserReponse>());
  });
}
