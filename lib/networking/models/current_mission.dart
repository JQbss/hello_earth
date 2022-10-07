import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_mission.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class CurrentMission {
  static const FromJsonFactory<CurrentMission> fromJsonFactory = _$CurrentMissionFromJson;
  final int? currentStep;
  final String? missionUid;

  const CurrentMission({
    this.currentStep,
    this.missionUid,
  });

  factory CurrentMission.fromJson(Map<String, dynamic> json) => _$CurrentMissionFromJson(json);
}
