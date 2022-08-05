import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/model/role.dart';
import 'package:hello_earth/networking/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Parent extends User {
  static const FromJsonFactory<Parent> fromJsonFactory = _$ParentFromJson;
  final Role role;

  Parent({
    required super.email,
    required super.uid,
    required super.userName,
    required this.role,
  }) : super(
          role: role,
        );

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}
