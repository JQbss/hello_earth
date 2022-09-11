import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/child.dart';
import 'package:hello_earth/networking/models/parent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'family.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Family {
  static const FromJsonFactory<Family> fromJsonFactory = _$FamilyFromJson;
  final Child child;
  final Parent parent;

  const Family({
    required this.child,
    required this.parent,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}
