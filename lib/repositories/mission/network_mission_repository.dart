import 'package:firebase_database/firebase_database.dart';
import 'package:hello_earth/networking/endpoints.dart';
import 'package:hello_earth/repositories/mission/mission_repository.dart';

class NetworkMissionRepository implements MissionRepository {
  final DatabaseReference reference;

  const NetworkMissionRepository({
    required this.reference,
  });

  @override
  Future<void> startMission({required String familyUid, required String missionUid}) async {
    await reference
        .child('${Endpoints.families.families}/${familyUid}/${Endpoints.families.player}/${Endpoints.missions.currentMission}')
        .set(missionUid);
  }
}
