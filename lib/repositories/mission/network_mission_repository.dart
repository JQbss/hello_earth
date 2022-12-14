import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/requests/completed_mission_questionnaires_request.dart';
import 'package:hello_earth/networking/requests/completed_missions_request.dart';
import 'package:hello_earth/networking/requests/current_level_request.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
import 'package:hello_earth/networking/requests/mission_questionnaires_request.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';

class NetworkMissionRepository implements MissionRepository {
  final DatabaseReference reference;

  const NetworkMissionRepository({
    required this.reference,
  });

  @override
  Future<void> removeCurrentMission({
    required String familyUid,
  }) async {
    await reference
        .child(
            '${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}/${Endpoints.missions.currentMission}')
        .remove();
  }

  @override
  Future<void> startMission({
    required String familyUid,
    required CurrentMissionRequest missionRequest,
  }) async {
    await reference
        .child(
            '${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}/${Endpoints.missions.currentMission}')
        .set(missionRequest.toJson());
  }

  @override
  Future<void> updateMission({
    required String familyUid,
    required CurrentMissionRequest missionRequest,
  }) async {
    await reference
        .child(
            '${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}/${Endpoints.missions.currentMission}')
        .update(missionRequest.toJson());
  }

  @override
  Future<void> startQuestionnaires({
    required String familyUid,
    required MissionQuestionnairesRequest missionQuestionnaires,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.parent}')
        .update(missionQuestionnaires.toJson());
  }

  @override
  Future<void> updateQuestionnaires({
    required String familyUid,
    required MissionQuestionnairesRequest missionQuestionnaires,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.parent}')
        .update(missionQuestionnaires.toJson());
  }

  @override
  Future<void> updateCompletedMissions({
    required String familyUid,
    required CompletedMissionsRequest completedMissionsRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}')
        .update(completedMissionsRequest.toJson());
  }

  @override
  Future<void> updateLevel({
    required String familyUid,
    required CurrentLevelRequest currentLevelRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}')
        .update(currentLevelRequest.toJson());
  }

  @override
  Future<void> updateCompletedQuestionnaires({
    required String familyUid,
    required CompletedMissionQuestionnairesRequest completedMissionQuestionnairesRequest,
  }) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.parent}')
        .update(completedMissionQuestionnairesRequest.toJson());
  }
}
