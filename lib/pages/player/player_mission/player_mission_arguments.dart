import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/player_model.dart';

class PlayerMissionArguments {
  final MissionModel? mission;
  final PlayerModel? playerModel;

  const PlayerMissionArguments({
    required this.mission,
    required this.playerModel,
  });
}
