import 'package:hello_earth/mappers/current_mission_mappers.dart';
import 'package:hello_earth/mappers/questionnaire_mappers.dart';
import 'package:hello_earth/networking/models/player.dart';
import 'package:hello_earth/ui/models/player_model.dart';

extension PlayerMapper on Player {
  PlayerModel mapToPlayerModel() {
    return PlayerModel(
      currentLevel: currentLevel,
      currentMission: currentMission?.mapToCurrentMissionModel(),
      completedMissions: completedMissions,
      completedMissionShoppingLists: completedMissionShoppingLists,
      isQuestionnaireCompleted: isQuestionnaireCompleted,
      uid: uid,
      questionnaire: questionnaire?.mapToQuestionnaireMode(),
    );
  }
}
