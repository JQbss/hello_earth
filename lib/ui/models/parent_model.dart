import 'package:hello_earth/networking/models/mission_questionnaire.dart';

class ParentModel {
  final List<String>? completedQuestionnaire;
  final String uid;
  final Map<String, MissionQuestionnaire?>? missionQuestionnaire;

  ParentModel({
    required this.completedQuestionnaire,
    required this.uid,
    required this.missionQuestionnaire,
  });
}
