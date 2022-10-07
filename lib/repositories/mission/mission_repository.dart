import 'package:hello_earth/networking/requests/current_mission_request.dart';

abstract class MissionRepository {
  Future<void> startMission({
    required String familyUid,
    required CurrentMissionRequest missionRequest,
  });

  Future<void> removeCurrentMission({
    required String familyUid,
  });
}
