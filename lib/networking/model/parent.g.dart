// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      userName: json['userName'] as String?,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.child: 'child',
  Role.parent: 'parent',
};
