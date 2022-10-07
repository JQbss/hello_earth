import 'package:json_annotation/json_annotation.dart';

part 'current_mission_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CurrentMissionRequest{
  final int currentStep;
  final String missionUid;

  const CurrentMissionRequest({
    required this.currentStep,
    required this.missionUid,
  });

  Map<String, dynamic> toJson() => _$CurrentMissionRequestToJson(this);
}
