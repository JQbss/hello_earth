import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/models/mission.dart';
import 'package:hello_earth/ui/models/mission_model.dart';

extension MissionMapper on Mission {
  MissionModel mapToMissionModel() {
    return MissionModel(
      contraindications: contraindications?.mapToContraindicationModels(),
      icon: icon,
      image: image,
      ingredients: ingredients?.mapToIngredientsModel(),
      longDescription: longDescription,
      shortDescription: shortDescription,
      steps: steps?.mapToStepsModels(),
      taskType: taskType?.mapToTaskTypeModel(),
      title: title,
      uid: uid,
    );
  }
}

extension LevelListMapper on Map<String, Mission?>? {
  Map<String, MissionModel> mapToMissionsModels() {
    return this?.map(
          (key, mission) => MapEntry(
            key,
            mission?.mapToMissionModel() ?? MissionModel(),
          ),
        ) ??
        {};
  }
}
