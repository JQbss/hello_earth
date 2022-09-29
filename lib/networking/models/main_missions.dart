import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/level.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_missions.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class MainMissions {
  static const FromJsonFactory<MainMissions> fromJsonFactory = _$MainMissionsFromJson;
  final List<Level?>? levels;

  const MainMissions({
    this.levels,
  });

  factory MainMissions.fromJson(Map<String, dynamic> json) => _$MainMissionsFromJson(json);
}
