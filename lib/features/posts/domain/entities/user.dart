import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'post.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  @JsonKey(name: 'profile_pic')
  final String profilePicUrl;
  @HiveField(4)
  final List<Post> posts;

  const User(this.uid, this.name, this.email, this.profilePicUrl, this.posts);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<String> get props => [uid];
}

@JsonSerializable()
class UserReponse {
  final List<User> data;
  UserReponse(this.data);
  factory UserReponse.fromJson(Map<String, dynamic> json) => _$UserReponseFromJson(json);
}
