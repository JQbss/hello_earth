// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionQuestionnaire _$MissionQuestionnaireFromJson(
        Map<String, dynamic> json) =>
    MissionQuestionnaire(
      isCompleted: json['isCompleted'] as bool?,
      missionId: json['missionId'] as String?,
      missionName: json['missionName'] as String?,
      missionRating: (json['missionRating'] as num?)?.toDouble(),
      questionnaireDescription: json['questionnaireDescription'] as String?,
    );
