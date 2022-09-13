import 'package:hello_earth/mappers/questionnaire_mappers.dart';
import 'package:hello_earth/networking/models/child.dart';
import 'package:hello_earth/ui/models/child_model.dart';

extension ChildMapper on Child {
  ChildModel mapToChildModel() {
    return ChildModel(
      familyId: familyId,
      isQuestionnaireCompleted: isQuestionnaireCompleted,
      uid: uid,
      questionnaire: questionnaire?.mapToQuestionnaireMode(),
    );
  }
}
