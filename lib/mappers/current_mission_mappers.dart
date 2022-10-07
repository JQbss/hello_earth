import 'package:hello_earth/networking/models/current_mission.dart';
import 'package:hello_earth/ui/models/current_mission_model.dart';

extension CurrentMissionMappers on CurrentMission {
  CurrentMissionModel mapToCurrentMissionModel() {
    return CurrentMissionModel(
      currentStep: currentStep,
      missionUid: missionUid,
    );
  }
}
