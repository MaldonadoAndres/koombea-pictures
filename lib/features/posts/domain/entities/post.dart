import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class Post extends Equatable {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final List<String> pics;

  const Post(this.id, this.date, this.pics);
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<num> get props => [id];
}
