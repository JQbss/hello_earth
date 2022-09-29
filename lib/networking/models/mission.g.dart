// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
      contraindications: (json['contraindications'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$ContraindicationEnumMap, e))
          .toList(),
      longDescription: json['longDescription'] as String?,
      shortDescription: json['shortDescription'] as String?,
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
