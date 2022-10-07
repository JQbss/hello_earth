import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/contraindication.dart';
import 'package:hello_earth/networking/models/ingredient.dart';
import 'package:hello_earth/networking/models/step_networking.dart';
import 'package:hello_earth/networking/models/task_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Mission {
  static const FromJsonFactory<Mission> fromJsonFactory = _$MissionFromJson;
  final List<Contraindication?>? contraindications;
  final String? icon;
  final String? image;
  final List<Ingredient?>? ingredients;
  final String? longDescription;
  final String? shortDescription;
  final List<StepNetworking?>? steps;
  final TaskType? taskType;
  final String? title;
  final String? uid;

  const Mission({
    this.contraindications,
    this.icon,
    this.image,
    this.ingredients,
    this.longDescription,
    this.shortDescription,
    this.steps,
    this.taskType,
    this.title,
    this.uid,
  });

  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);
}
