// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) =>
    Questionnaire(
      contraindications: (json['contraindications'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$ContraindicationEnumMap, e))
          .toList(),
    );

const _$ContraindicationEnumMap = {
  Contraindication.dishwasher: 'dishwasher',
  Contraindication.milk: 'milk',
  Contraindication.outside: 'outside',
  Contraindication.sesame: 'sesame',
};
