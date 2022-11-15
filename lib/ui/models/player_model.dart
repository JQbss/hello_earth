import 'package:hello_earth/ui/models/current_mission_model.dart';
import 'package:hello_earth/ui/models/questionnaire_model.dart';

class PlayerModel {
  final int? currentLevel;
  final CurrentMissionModel? currentMission;
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;
  final String? uid;

  PlayerModel({
    required this.currentLevel,
    required this.currentMission,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });
}
