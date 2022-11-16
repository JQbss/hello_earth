import 'package:hello_earth/mappers/role_mappers.dart';
import 'package:hello_earth/networking/models/user_networking.dart';
import 'package:hello_earth/ui/models/user_model.dart';

extension UserMapper on UserNetworking {
  UserModel mapToUserModel() {
    return UserModel(
      email: email,
      familyId: familyId,
      uid: uid,
      userName: userName,
      role: role?.mapToRoleModel(),
    );
  }
}
