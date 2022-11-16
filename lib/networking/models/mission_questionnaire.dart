import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_questionnaire.g.dart';


@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class MissionQuestionnaire {
  static const FromJsonFactory<MissionQuestionnaire> fromJsonFactory = _$MissionQuestionnaireFromJson;
  final bool? isCompleted;
  final String? missionName;
  final String? missionId;
  final String? questionnaireDescription;
  final double? missionRating;

  const MissionQuestionnaire({
    this.isCompleted,
    this.missionId,
    this.missionName,
    this.missionRating,
    this.questionnaireDescription,
  });

  factory MissionQuestionnaire.fromJson(Map<String, dynamic> json) => _$MissionQuestionnaireFromJson(json);
}