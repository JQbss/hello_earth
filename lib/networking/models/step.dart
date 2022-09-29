import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Step {
  static const FromJsonFactory<Step> fromJsonFactory = _$StepFromJson;
  final String? name;

  const Step({
    this.name,
  });

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}
