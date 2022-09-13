// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      familyId: json['familyId'] as String?,
      isQuestionnaireCompleted: json['isQuestionnaireCompleted'] as bool?,
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
      role: $enumDecode(_$RoleEnumMap, json['role']),
      uid: json['uid'] as String,
    );

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.child: 'child',
  Role.parent: 'parent',
};
