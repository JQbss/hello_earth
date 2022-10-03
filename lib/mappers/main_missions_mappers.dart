import 'package:hello_earth/mappers/mappers.dart';
import 'package:hello_earth/networking/models/main_missions.dart';
import 'package:hello_earth/ui/models/main_missions_model.dart';

extension MainMissionsMapper on MainMissions {
  MainMissionsModel? mapToMainMissionsModel() {
    return MainMissionsModel(
      levels: levels?.mapToLevelModels(),
    );
  }
}
