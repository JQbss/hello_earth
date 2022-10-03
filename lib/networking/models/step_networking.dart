import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step_networking.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class StepNetworking {
  static const FromJsonFactory<StepNetworking> fromJsonFactory = _$StepNetworkingFromJson;
  final String? name;

  const StepNetworking({
    this.name,
  });

  factory StepNetworking.fromJson(Map<String, dynamic> json) => _$StepNetworkingFromJson(json);
}
