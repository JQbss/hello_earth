// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      email: json['email'] as String?,
      familyId: json['familyId'] as String?,
      isQuestionnaireCompleted: json['isQuestionnaireCompleted'] as bool?,
      uid: json['uid'] as String?,
      userName: json['userName'] as String?,
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.child: 'child',
  Role.parent: 'parent',
};
