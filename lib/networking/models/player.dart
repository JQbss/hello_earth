import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/current_mission.dart';
import 'package:hello_earth/networking/models/questionnaire.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Player {
  static const FromJsonFactory<Player> fromJsonFactory = _$PlayerFromJson;
  final int? currentLevel;
  final CurrentMission? currentMission;
  final List<String>? completedMissions;
  final List<String>? completedMissionShoppingLists;
  final bool? isQuestionnaireCompleted;
  final Questionnaire? questionnaire;
  final String? uid;

  Player({
    required this.currentLevel,
    required this.currentMission,
    required this.completedMissions,
    required this.completedMissionShoppingLists,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
