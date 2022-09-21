import 'package:flutter/cupertino.dart';
import 'package:hello_earth/generated/l10n.dart';

class ContraindicationUtils {
  const ContraindicationUtils._();
  
  List<String> getListOfNames(BuildContext context) {
    return [
      S.of(context).contraindicationDishwasher,
      S.of(context).contraindicationMilk,
      S.of(context).contraindicationOutside,
      S.of(context).contraindicationSesame,
    ];
  }
}