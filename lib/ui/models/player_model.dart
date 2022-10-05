import 'package:hello_earth/ui/models/questionnaire_model.dart';

class PlayerModel {
  final String? currentMission;
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;
  final String? uid;

  PlayerModel({
    required this.currentMission,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });
}
