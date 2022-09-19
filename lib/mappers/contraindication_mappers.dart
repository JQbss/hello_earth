import 'package:hello_earth/networking/models/contraindication.dart';
import 'package:hello_earth/networking/requests/contraindication_request.dart';
import 'package:hello_earth/ui/models/contraindication_model.dart';

extension ContraindicationMappers on Contraindication {
  ContraindicationModel mapToContraindicationModel() {
    return ContraindicationModel.values[index];
  }
}

extension ContraindicationListMapper on List<Contraindication> {
  List<ContraindicationModel> mapToContraindicationModels() {
    return map(
      (contraindication) => contraindication.mapToContraindicationModel(),
    ).toList();
  }
}

extension ContraindicationModelMappers on ContraindicationModel {
  Contraindication mapToContraindication() {
    return Contraindication.values[index];
  }
}

extension ContraindicationModelListMapper on List<ContraindicationModel> {
  List<Contraindication> mapToContraindications() {
    return map(
      (contraindication) => contraindication.mapToContraindication(),
    ).toList();
  }
}

extension ContraindicationRequestMappers on Contraindication {
  ContraindicationRequest mapToContraindicationRequest() {
    return ContraindicationRequest.values[index];
  }
}

extension ContraindicationRequestListMapper on List<Contraindication> {
  List<ContraindicationRequest> mapToContraindicationRequests() {
    return map(
      (contraindication) => contraindication.mapToContraindicationRequest(),
    ).toList();
  }
}
