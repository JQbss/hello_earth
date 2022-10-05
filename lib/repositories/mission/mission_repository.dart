abstract class MissionRepository {
  Future<void> startMission({
    required String familyUid,
    required String missionUid,
  });
}
