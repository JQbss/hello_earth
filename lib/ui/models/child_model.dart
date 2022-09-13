import 'package:hello_earth/ui/models/questionnaire_model.dart';

class ChildModel {
  final String? familyId;
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;
  final String uid;

  ChildModel({
    required this.familyId,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.uid,
  });
}
