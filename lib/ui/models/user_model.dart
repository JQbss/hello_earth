import 'package:hello_earth/ui/models/role_model.dart';

class UserModel {
  final String? email;
  final String? uid;
  final String? userName;
  final RoleModel? role;

  const UserModel({
    required this.email,
    required this.uid,
    required this.userName,
    required this.role,
  });
}
