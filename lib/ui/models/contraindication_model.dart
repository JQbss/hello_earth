import 'package:flutter/material.dart';
import 'package:hello_earth/generated/l10n.dart';

enum ContraindicationModel {
  dishwasher,
  milk,
  outside,
  sesame;

  String getDescription(BuildContext context) {
    switch (this) {
      case ContraindicationModel.dishwasher:
        return S.of(context).contraindicationDishwasher;
      case ContraindicationModel.milk:
        return S.of(context).contraindicationMilk;
      case ContraindicationModel.outside:
        return S.of(context).contraindicationOutside;
      case ContraindicationModel.sesame:
        return S.of(context).contraindicationSesame;
    }
  }
}
