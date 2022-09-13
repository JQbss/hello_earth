import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_networking.g.dart';

@JsonSerializable(
  createToJson: false,
)
class UserNetworking {
  static const FromJsonFactory<UserNetworking> fromJsonFactory = _$UserNetworkingFromJson;
  final String? email;
  final String? familyId;
  final String? uid;
  final String? userName;
  final Role? role;

  const UserNetworking({
    required this.email,
    required this.familyId,
    required this.uid,
    required this.userName,
    required this.role,
  });

  factory UserNetworking.fromJson(Map<String, dynamic> json) => _$UserNetworkingFromJson(json);
}