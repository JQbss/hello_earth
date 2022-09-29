import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/mission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Level {
  static const FromJsonFactory<Level> fromJsonFactory = _$LevelFromJson;
  final List<Mission?>? missions;

  const Level({
    this.missions,
  });

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}
