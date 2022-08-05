import 'package:hello_earth/networking/model/contraindication.dart';
import 'package:hello_earth/ui/models/contraindication_model.dart';

extension ContraindicationMappers on Contraindication {
  ContraindicationModel mapToContraindicationModel() {
    return ContraindicationModel.values[index];
  }
}

extension ContraindicationListMapper on List<Contraindication> {
  List<ContraindicationModel> mapTopContraindicationModels() {
    return map(
      (contraindication) => contraindication.mapToContraindicationModel(),
    ).toList();
  }
}
