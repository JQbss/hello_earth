import 'package:hello_earth/extensions/extensions.dart';
import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/models/mission.dart';
import 'package:hello_earth/ui/models/mission_model.dart';

extension MissionMapper on Mission {
  MissionModel mapToMissionModel() {
    return MissionModel(
      contraindications: contraindications?.mapToContraindicationModels(),
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

extension LevelListMapper on List<Mission?>? {
  List<MissionModel> mapToMissionsModels() {
    return this
            ?.map(
              (mission) => mission?.mapToMissionModel(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}
