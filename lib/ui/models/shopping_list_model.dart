import 'package:hello_earth/ui/models/ingredient_model.dart';

class ShoppingListModel {
  final List<IngredientModel?>? ingredients;
  final bool? isParentVisible;
  final String? missionName;

  const ShoppingListModel({
    this.ingredients,
    this.isParentVisible,
    this.missionName,
  });
}
