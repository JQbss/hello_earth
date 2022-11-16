import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/mappers/contraindication_mappers.dart';
import 'package:hello_earth/networking/models/questionnaire.dart';
import 'package:hello_earth/ui/models/questionnaire_model.dart';

extension QuestionnaireMappers on Questionnaire {
  QuestionnaireModel mapToQuestionnaireMode() {
    return QuestionnaireModel(
      contraindications: contraindications?.filterNotNull().mapToContraindicationModels(),
    );
  }
}
