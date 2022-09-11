import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/questionnaire.dart';
import 'package:hello_earth/networking/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable(
  createToJson: false,
)
class Child {
  static const FromJsonFactory<Child> fromJsonFactory = _$ChildFromJson;
  final String? familyId;
  final bool? isQuestionnaireCompleted;
  final Questionnaire? questionnaire;
  final Role role;
  final String uid;

  Child({
    required this.familyId,
    required this.isQuestionnaireCompleted,
    required this.questionnaire,
    required this.role,
    required this.uid,
  });

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}
