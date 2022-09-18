// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      isQuestionnaireCompleted: json['isQuestionnaireCompleted'] as bool?,
      questionnaire: json['questionnaire'] == null
          ? null
          : Questionnaire.fromJson(
              json['questionnaire'] as Map<String, dynamic>),
      uid: json['uid'] as String?,
    );
