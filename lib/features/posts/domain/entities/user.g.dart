// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['uid'] as String,
      json['name'] as String,
      json['email'] as String,
      json['profile_pic'] as String,
      (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profile_pic': instance.profilePicUrl,
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };

UserReponse _$UserReponseFromJson(Map<String, dynamic> json) => UserReponse(
      (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserReponseToJson(UserReponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
