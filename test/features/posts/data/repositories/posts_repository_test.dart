import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:koombea_pictures/error/exception.dart';
import 'package:koombea_pictures/error/failure.dart';
import 'package:koombea_pictures/features/posts/data/datasources/local_datasource.dart';
import 'package:koombea_pictures/features/posts/data/datasources/remote_datasource.dart';
import 'package:koombea_pictures/features/posts/data/repositories/post_repository.dart';
import 'package:koombea_pictures/features/posts/domain/entities/post.dart';
import 'package:koombea_pictures/features/posts/domain/entities/user.dart';
import 'package:koombea_pictures/features/posts/domain/repositories/abstract_post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  late AbstractPostRepository _postRepository;
  late RemoteDataSource _remoteDataSource;
  late LocalDataSource _localDataSource;
  setUp(() {
    _remoteDataSource = MockRemoteDataSource();
    _localDataSource = MockLocalDataSource();
    _postRepository = PostRepository(_remoteDataSource, _localDataSource);
  });
  group('get users and theirs posts', () {
    final tUsers = <User>[const User('e406bae8-1fd4-4e33-81d3-2fd053a40493', 'Midoriya Izuku', 'allmigth@uaschool.com', 'www.test.com', <Post>[])];

    test(
      'should return remote data when the call to remote data source is successful and theres not cached data',
      () async {
        // arrange
        when(_localDataSource.getAll()).thenAnswer((_) async => []);
        when(_remoteDataSource.getUsers()).thenAnswer((_) async => tUsers);
        // act
        final result = await _postRepository.getPosts();
        // assert
        verify(_remoteDataSource.getUsers());
        expect(result, equals(Right(tUsers)));
      },
    );
    test(
      'should cache the data locally when the call to remote data source is successful and theres not cached data',
      () async {
        // arrange
        when(_localDataSource.getAll()).thenAnswer((_) async => []);
        when(_remoteDataSource.getUsers()).thenAnswer((_) async => tUsers);
        // act
        await _postRepository.getPosts();
        // assert
        verify(_remoteDataSource.getUsers());
        verify(_localDataSource.saveAll(tUsers));
      },
    );
    test(
      'should return local data when there is cached data',
      () async {
        // arrange
        when(_localDataSource.getAll()).thenAnswer((_) async => tUsers);
        // act
        final result = await _postRepository.getPosts();
        // assert
        verify(_localDataSource.getAll());
        verifyZeroInteractions(_remoteDataSource);
        expect(result, equals(Right(tUsers)));
      },
    );
    test(
      'should return [NetworkFailure] when the call to remote data source is unsuccessful',
      () async {
        // arrange
        when(_localDataSource.getAll()).thenAnswer((_) async => []);
        when(_remoteDataSource.getUsers()).thenThrow(NetworkException());
        // act
        final result = await _postRepository.getPosts();
        // assert
        verify(_remoteDataSource.getUsers());
        expect(result, equals(const Left(NetworkFailure())));
      },
    );
  });
}
