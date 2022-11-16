import 'package:hello_earth/networking/requests/mission_questionnaire_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_questionnaires_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class MissionQuestionnairesRequest {
  final Map<String, MissionQuestionnaireRequest?> missionQuestionnaires;

  const MissionQuestionnairesRequest({
    required this.missionQuestionnaires,
  });

  Map<String, dynamic> toJson() => _$MissionQuestionnairesRequestToJson(this);
}
