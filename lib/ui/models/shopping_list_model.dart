import 'package:hello_earth/ui/models/ingredient_model.dart';

class ShoppingListModel {
  List<IngredientModel?>? ingredients;
  bool? isParentVisible;
  final String? missionName;

  ShoppingListModel({
    this.ingredients,
    this.isParentVisible,
    this.missionName,
  });
}
