import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/networking/models/step_networking.dart';
import 'package:hello_earth/ui/models/step_model.dart';

extension StepMapper on StepNetworking {
  StepModel mapToStepModel() {
    return StepModel(
      name: name,
      image: image,
      video: video,
    );
  }
}

extension StepListMapper on List<StepNetworking?>? {
  List<StepModel> mapToStepsModels() {
    return this
            ?.map(
              (step) => step?.mapToStepModel(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}
