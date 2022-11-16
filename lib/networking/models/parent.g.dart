// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      completedQuestionnaire: (json['completedQuestionnaire'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      uid: json['uid'] as String,
      missionQuestionnaires:
          (json['missionQuestionnaires'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : MissionQuestionnaire.fromJson(e as Map<String, dynamic>)),
      ),
    );
