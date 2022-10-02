import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/mappers/missions_mappers.dart';
import 'package:hello_earth/networking/models/level.dart';
import 'package:hello_earth/ui/models/level_model.dart';

extension LevelMapper on Level {
  LevelModel mapToLevelModel() {
    return LevelModel(
      missions: missions?.mapToMissionsModels(),
    );
  }
}

extension LevelListMapper on List<Level?>? {
  List<LevelModel> mapToLevelModels() {
    return this
            ?.map(
              (level) => level?.mapToLevelModel(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}
