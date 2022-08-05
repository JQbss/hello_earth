import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/model/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  createToJson: false,
)
class User {
  static const FromJsonFactory<User> fromJsonFactory = _$UserFromJson;
  final String? email;
  final String? uid;
  final String? userName;
  final Role? role;

  const User({
    required this.email,
    required this.uid,
    required this.userName,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}