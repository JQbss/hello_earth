import 'package:hello_earth/networking/models/mission_questionnaire.dart';
import 'package:hello_earth/ui/models/mission_questionnaire_model.dart';

extension MissionQuestionnaireMapper on MissionQuestionnaire {
  MissionQuestionnaireModel mapToMissionQuestionnaireModel() {
    return MissionQuestionnaireModel(
      isCompleted: isCompleted,
      missionId: missionId,
      missionName: missionName,
      missionRating: missionRating,
      questionnaireDescription: questionnaireDescription,
    );
  }
}
