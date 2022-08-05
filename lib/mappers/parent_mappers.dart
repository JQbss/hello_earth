import 'package:hello_earth/mappers/role_mappers.dart';
import 'package:hello_earth/networking/model/parent.dart';
import 'package:hello_earth/ui/models/parent_model.dart';

extension ParentMappers on Parent {
  ParentModel mapToParentModel() {
    return ParentModel(
      email: email,
      uid: uid,
      userName: userName,
      role: role.mapToRoleModel(),
    );
  }
}
