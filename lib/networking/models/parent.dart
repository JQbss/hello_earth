import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/mission_questionnaire.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Parent {
  static const FromJsonFactory<Parent> fromJsonFactory = _$ParentFromJson;
  final List<String>? completedQuestionnaire;
  final String uid;
  final Map<String, MissionQuestionnaire?>? missionQuestionnaire;

  Parent({
    required this.completedQuestionnaire,
    required this.uid,
    required this.missionQuestionnaire,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}
