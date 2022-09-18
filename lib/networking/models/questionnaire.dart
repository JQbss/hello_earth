import 'package:hello_earth/commons/from_json_factory.dart';
import 'package:hello_earth/networking/models/contraindication.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questionnaire.g.dart';

@JsonSerializable(
  createToJson: false,
  explicitToJson: true,
)
class Questionnaire {
  static const FromJsonFactory<Questionnaire> fromJsonFactory = _$QuestionnaireFromJson;
  final List<Contraindication?>? contraindications;

  Questionnaire({
    required this.contraindications,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => _$QuestionnaireFromJson(json);
}