// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'familyId': instance.familyId,
      'role': _$RoleRequestEnumMap[instance.role]!,
      'userName': instance.userName,
    };

const _$RoleRequestEnumMap = {
  RoleRequest.admin: 'admin',
  RoleRequest.child: 'child',
  RoleRequest.parent: 'parent',
};
