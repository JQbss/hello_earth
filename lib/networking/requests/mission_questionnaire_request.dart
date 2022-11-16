import 'package:json_annotation/json_annotation.dart';

part 'mission_questionnaire_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class MissionQuestionnaireRequest {
  final bool? isCompleted;
  final String? missionName;
  final String? missionId;
  final String? questionnaireDescription;
  final int? missionRating;

  const MissionQuestionnaireRequest({
    this.isCompleted,
    required this.missionName,
    required this.missionId,
    this.questionnaireDescription,
    this.missionRating,
  });

  Map<String, dynamic> toJson() => _$MissionQuestionnaireRequestToJson(this);
}
