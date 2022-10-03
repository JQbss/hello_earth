import 'package:hello_earth/ui/models/contraindication_model.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';
import 'package:hello_earth/ui/models/step_model.dart';
import 'package:hello_earth/ui/models/task_type_model.dart';

class MissionModel {
  final List<ContraindicationModel?>? contraindications;
  final List<IngredientModel?>? ingredients;
  final String? longDescription;
  final String? shortDescription;
  final List<StepModel?>? steps;
  final TaskTypeModel? taskType;
  final String? title;
  final String? uid;

  const MissionModel({
    this.contraindications,
    this.ingredients,
    this.longDescription,
    this.shortDescription,
    this.steps,
    this.taskType,
    this.title,
    this.uid,
  });
}
