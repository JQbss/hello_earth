// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      currentLevel: json['currentLevel'] as int?,
      currentMission: json['currentMission'] == null
          ? null
          : CurrentMission.fromJson(
              json['currentMission'] as Map<String, dynamic>),
      completedMissions: (json['completedMissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      completedMissionShoppingLists:
          (json['completedMissionShoppingLists'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      isQuestionnaireCompleted: json['isQuestionnaireCompleted'] as bool?,
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
      uid: json['uid'] as String?,
    );
