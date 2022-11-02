import 'package:hello_earth/mock/achievements_mock/achievement_mock.dart';
import 'package:hello_earth/ui/models/achievement_model.dart';

extension AchievementMapper on AchievementMock {
  AchievementModel mapToAchievementModel() {
    return AchievementModel(
      currentAmountOfMileStones: currentAmountOfMileStones,
      description: description,
      icon: icon,
      mileStones: mileStones,
    );
  }
}

extension AchievementListMapper on List<AchievementMock> {
  List<AchievementModel> mapToAchievementsModels() {
    return map(
      (achievement) => achievement.mapToAchievementModel(),
    ).toList();
  }
}
