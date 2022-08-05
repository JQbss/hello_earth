import 'package:hello_earth/ui/models/questionnaire_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';

class ChildModel extends UserModel {
  final String? familyId;
  final bool? isQuestionnaireCompleted;
  final QuestionnaireModel? questionnaire;

  ChildModel({
    required super.email,
    required this.familyId,
    required this.isQuestionnaireCompleted,
    required super.uid,
    required super.userName,
    required this.questionnaire,
    required super.role,
  });
}