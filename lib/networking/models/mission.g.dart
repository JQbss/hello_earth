// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
      contraindications: (json['contraindications'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$ContraindicationEnumMap, e))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StepNetworking.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskType: $enumDecodeNullable(_$TaskTypeEnumMap, json['taskType']),
      title: json['title'] as String?,
      uid: json['uid'] as String?,
    );

const _$ContraindicationEnumMap = {
  Contraindication.dishwasher: 'dishwasher',
  Contraindication.milk: 'milk',
  Contraindication.outside: 'outside',
  Contraindication.sesame: 'sesame',
};

const _$TaskTypeEnumMap = {
  TaskType.cooking: 'cooking',
  TaskType.undefined: 'undefined',
};
