import 'package:hello_earth/networking/models/mission_questionnaire.dart';
import 'package:hello_earth/networking/requests/mission_questionnaire_request.dart';
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

extension MissionQuestionnairesMapper on Map<String, MissionQuestionnaire?>? {
  Map<String, MissionQuestionnaireModel?>? mapToMissionQuestionnaireModels() {
    return this?.map(
      (key, value) => MapEntry(
        key,
        value?.mapToMissionQuestionnaireModel(),
      ),
    );
  }
}

extension MissionQuestionnaireModelMapper on MissionQuestionnaireModel {
  MissionQuestionnaireRequest mapToMissionQuestionnaireRequest() {
    return MissionQuestionnaireRequest(
      isCompleted: isCompleted,
      missionId: missionId,
      missionName: missionName,
      missionRating: missionRating,
      questionnaireDescription: questionnaireDescription,
    );
  }
}

extension MissionQuestionnairesModelMapper on Map<String, MissionQuestionnaireModel?>? {
  Map<String, MissionQuestionnaireRequest?> mapToMissionQuestionnaireRequest() {
    return this?.map(
          (key, value) => MapEntry(
            key,
            value?.mapToMissionQuestionnaireRequest(),
          ),
        ) ??
        {};
  }
}
