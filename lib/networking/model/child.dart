import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/model/questionnaire.dart';
import 'package:hello_earth/networking/model/role.dart';
import 'package:hello_earth/networking/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Child extends User {
  static const FromJsonFactory<Child> fromJsonFactory = _$ChildFromJson;
  final String? familyId;
  final bool? isQuestionnaireCompleted;
  final Role role;
  final Questionnaire? questionnaire;

  Child({
    required super.email,
    required this.familyId,
    required this.isQuestionnaireCompleted,
    required super.uid,
    required super.userName,
    required this.questionnaire,
    required this.role,
  }) : super(
          role: role,
        );

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}
