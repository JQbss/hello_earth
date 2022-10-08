import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/networking/requests/current_mission_request.dart';
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
}