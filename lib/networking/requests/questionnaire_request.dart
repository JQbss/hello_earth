import 'package:hello_earth/networking/requests/contraindication_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questionnaire_request.g.dart';

@JsonSerializable(
  createFactory: false,
)
class QuestionnaireRequest {
  final List<ContraindicationRequest?>? contraindications;

  const QuestionnaireRequest({
    required this.contraindications,
  });

  Map<String, dynamic> toJson() => _$QuestionnaireRequestToJson(this);
}
