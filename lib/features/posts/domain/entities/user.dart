import 'package:freezed_annotation/freezed_annotation.dart';

import 'post.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String uid;
  final String name;
  final String email;
  @JsonKey(name: 'profile_pic')
  final String profilPicUrl;
  final List<Post> posts;

  User(this.uid, this.name, this.email, this.profilPicUrl, this.posts);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
@JsonSerializable()
class UserReponse {
  final List<User> data;
  UserReponse(this.data);
 factory UserReponse.fromJson(Map<String, dynamic> json) => _$UserReponseFromJson(json);
}
