import 'package:json_annotation/json_annotation.dart';

part 'player_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class PlayerRequest {
  final String uid;

  const PlayerRequest({
    required this.uid,
  });

  Map<String, dynamic> toJson() => _$PlayerRequestToJson(this);
}