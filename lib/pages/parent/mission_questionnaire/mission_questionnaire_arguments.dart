import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/parent_model.dart';

class MissionQuestionnaireArguments {
  final ParentModel? parent;
  final MissionModel? mission;

  const MissionQuestionnaireArguments({
    required this.parent,
    required this.mission,
  });
}
