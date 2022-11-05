import 'package:flutter_test/flutter_test.dart';
import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/main_missions.dart';
import 'package:hello_earth/repositories/main_missions/network_main_missions_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'main_missions_repository_test.mocks.dart';

class MainMissionsRepositoryTest extends Mock implements NetworkMainMissionsRepository {}

@GenerateMocks([MainMissionsRepositoryTest])
Future<void> main() async {
  late final MainMissionsRepositoryTest mainMissionsRepository;
  setUpAll(() {
    mainMissionsRepository = MockMainMissionsRepositoryTest();
  });
  group('Main missions Repository tests', () {
    final BaseResponse<MainMissions> mainMissions = BaseResponse.fromJson({});
    test('Get all main missions', () async {
      when(mainMissionsRepository.getMainMissions()).thenAnswer((_) async {
        return mainMissions;
      });

      final result = await mainMissionsRepository.getMainMissions();
      expect(result, mainMissions);
      expect(result.data, isA<MainMissions>());
    });
  });
}
