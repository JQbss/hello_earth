// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_networking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNetworking _$UserNetworkingFromJson(Map<String, dynamic> json) =>
    UserNetworking(
      email: json['email'] as String?,
      familyId: json['familyId'] as String?,
      uid: json['uid'] as String?,
      userName: json['userName'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
    );

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.child: 'child',
  Role.parent: 'parent',
};
