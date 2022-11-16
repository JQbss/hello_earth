import 'package:hello_earth/ui/models/current_mission_model.dart';
import 'package:hello_earth/ui/models/questionnaire_model.dart';

class PlayerModel {
  final int? currentLevel;
  CurrentMissionModel? currentMission;
  final List<String>? completedMissions;
  final List<String>? completedMissionShoppingLists;
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;
  final String? uid;

  PlayerModel({
    required this.currentLevel,
    required this.currentMission,
    required this.completedMissions,
    required this.completedMissionShoppingLists,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });
}
