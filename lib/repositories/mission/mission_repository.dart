import 'package:hello_earth/networking/requests/completed_mission_questionnaires_request.dart';
import 'package:hello_earth/networking/requests/completed_missions_request.dart';
import 'package:hello_earth/networking/requests/current_level_request.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
import 'package:hello_earth/networking/requests/mission_questionnaires_request.dart';

abstract class MissionRepository {
  Future<void> startMission({
    required String familyUid,
    required CurrentMissionRequest missionRequest,
  });

  Future<void> updateMission({
    required String familyUid,
    required CurrentMissionRequest missionRequest,
  });

  Future<void> removeCurrentMission({
    required String familyUid,
  });

  Future<void> updateCompletedMissions({
    required String familyUid,
    required CompletedMissionsRequest completedMissionsRequest,
  });

  Future<void> updateLevel({
    required String familyUid,
    required CurrentLevelRequest currentLevelRequest,
  });

  Future<void> startQuestionnaires({
    required String familyUid,
    required MissionQuestionnairesRequest missionQuestionnaires,
  });

  Future<void> updateQuestionnaires({
    required String familyUid,
    required MissionQuestionnairesRequest missionQuestionnaires,
  });

  Future<void> updateCompletedQuestionnaires({
    required String familyUid,
    required CompletedMissionQuestionnairesRequest completedMissionQuestionnairesRequest,
  });
}
