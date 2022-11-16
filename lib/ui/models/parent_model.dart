import 'package:hello_earth/ui/models/mission_questionnaire_model.dart';

class ParentModel {
  final List<String>? completedQuestionnaire;
  final String uid;
  final Map<String, MissionQuestionnaireModel?>? missionQuestionnaires;

  ParentModel({
    required this.completedQuestionnaire,
    required this.uid,
    required this.missionQuestionnaires,
  });
}
