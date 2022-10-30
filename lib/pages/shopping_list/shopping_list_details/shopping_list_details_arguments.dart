import 'package:hello_earth/ui/models/ingredient_model.dart';

class ShoppingListDetailsArguments {
  final List<IngredientModel?>? ingredients;
  final bool? isParentVisible;
  final String? missionName;
  final String? uid;

  const ShoppingListDetailsArguments({
    this.ingredients,
    this.isParentVisible,
    this.missionName,
    this.uid,
  });
}
