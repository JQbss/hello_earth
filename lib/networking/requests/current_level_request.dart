import 'package:json_annotation/json_annotation.dart';

part 'current_level_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class CurrentLevelRequest {
  final int currentLevel;

  const CurrentLevelRequest({
    required this.currentLevel,
  });

  Map<String, dynamic> toJson() => _$CurrentLevelRequestToJson(this);
}
