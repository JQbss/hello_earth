import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Parent {
  static const FromJsonFactory<Parent> fromJsonFactory = _$ParentFromJson;
  final String uid;

  Parent({
    required this.uid,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}
