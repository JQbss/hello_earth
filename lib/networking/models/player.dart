import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/questionnaire.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Player {
  static const FromJsonFactory<Player> fromJsonFactory = _$PlayerFromJson;
  final String? currentMission;
  final bool? isQuestionnaireCompleted;
  final Questionnaire? questionnaire;
  final String? uid;

  Player({
    required this.currentMission,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
