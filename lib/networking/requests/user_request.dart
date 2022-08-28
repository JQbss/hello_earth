import 'package:hello_earth/networking/requests/role_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class UserRequest {
  final String email;
  final String familyId;
  final RoleRequest role;
  final String userName;

  const UserRequest({
    required this.email,
    required this.familyId,
    required this.role,
    required this.userName,
  });

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
