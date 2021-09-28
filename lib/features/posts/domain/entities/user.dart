import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'post.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  @JsonKey(name: 'profile_pic')
  final String profilePicUrl;
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
