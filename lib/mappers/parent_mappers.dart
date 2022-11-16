import 'package:hello_earth/networking/models/parent.dart';
import 'package:hello_earth/ui/models/parent_model.dart';

extension ParentMappers on Parent {
  ParentModel mapToParentModel() {
    return ParentModel(
      completedQuestionnaire: completedQuestionnaire,
      uid: uid,
    );
  }
}
