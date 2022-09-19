// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$QuestionnaireRequestToJson(
        QuestionnaireRequest instance) =>
    <String, dynamic>{
      'contraindications': instance.contraindications
          ?.map((e) => _$ContraindicationRequestEnumMap[e])
          .toList(),
    };

const _$ContraindicationRequestEnumMap = {
  ContraindicationRequest.dishwasher: 'dishwasher',
  ContraindicationRequest.milk: 'milk',
  ContraindicationRequest.outside: 'outside',
  ContraindicationRequest.sesame: 'sesame',
};
