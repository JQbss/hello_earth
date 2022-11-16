import 'package:json_annotation/json_annotation.dart';

part 'completed_mission_questionnaires_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CompletedMissionQuestionnairesRequest {
  final List<String> completedQuestionnaire;

  const CompletedMissionQuestionnairesRequest({
    required this.completedQuestionnaire,
  });

  Map<String, dynamic> toJson() => _$CompletedMissionQuestionnairesRequestToJson(this);
}
