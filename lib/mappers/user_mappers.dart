import 'package:hello_earth/networking/model/user.dart';
import 'package:hello_earth/ui/models/user_model.dart';
import 'package:hello_earth/mappers/role_mappers.dart';

extension UserMapper on User {
  UserModel mapToUserModel() {
    return UserModel(
      email: email,
      uid: uid,
      userName: userName,
      role: role?.mapToRoleModel(),
    );
  }
}
