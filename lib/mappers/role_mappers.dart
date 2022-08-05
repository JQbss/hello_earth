import 'package:hello_earth/networking/model/role.dart';
import 'package:hello_earth/ui/models/role_model.dart';

extension RoleMapper on Role {
  RoleModel mapToRoleModel() {
    return RoleModel.values[index];
  }
}

extension RoleListMapper on List<Role> {
  List<RoleModel> mapToRoleModels() {
    return map(
      (role) => role.mapToRoleModel(),
    ).toList();
  }
}
