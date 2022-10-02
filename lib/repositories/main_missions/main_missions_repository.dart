import 'package:hello_earth/networking/models/base_response.dart';
import 'package:hello_earth/networking/models/main_missions.dart';

abstract class MainMissionsRepository {
  Future<BaseResponse<MainMissions>> getMainMissions();
}
