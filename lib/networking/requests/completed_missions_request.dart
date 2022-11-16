import 'package:json_annotation/json_annotation.dart';

part 'completed_missions_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CompletedMissionsRequest {
  final List<String> completedMissions;

  const CompletedMissionsRequest({
    required this.completedMissions,
  });

  Map<String, dynamic> toJson() => _$CompletedMissionsRequestToJson(this);
}
