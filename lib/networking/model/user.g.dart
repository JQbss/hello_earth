// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      userName: json['userName'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
    );

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.child: 'child',
  Role.parent: 'parent',
};
