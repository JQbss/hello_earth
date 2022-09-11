import 'package:hello_earth/ui/models/role_model.dart';

class UserModel {
  final String? email;
  final String? familyId;
  final String? uid;
  final String? userName;
  final RoleModel? role;

  const UserModel({
    required this.email,
    required this.familyId,
    required this.uid,
    required this.userName,
    required this.role,
  });
}
