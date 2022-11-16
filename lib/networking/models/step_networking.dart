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
  final String? video;
  final String? image;

  const StepNetworking({
    this.name,
    this.image,
    this.video,
  });

  factory StepNetworking.fromJson(Map<String, dynamic> json) => _$StepNetworkingFromJson(json);
}
