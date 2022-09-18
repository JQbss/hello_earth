import 'package:hello_earth/ui/models/questionnaire_model.dart';

class PlayerModel {
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;
  final String? uid;

  PlayerModel({
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });
}
