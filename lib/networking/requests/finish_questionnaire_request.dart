import 'package:hello_earth/networking/requests/questionnaire_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'finish_questionnaire_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class FinishQuestionnaireRequest {
  final bool isQuestionnaireCompleted;
  final QuestionnaireRequest questionnaire;

  const FinishQuestionnaireRequest({
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
  });

  Map<String, dynamic> toJson() => _$FinishQuestionnaireRequestToJson(this);
}
