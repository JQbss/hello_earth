import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/networking/models/ingredient.dart';
import 'package:hello_earth/ui/models/ingredient_model.dart';

extension IngredientMapper on Ingredient {
  IngredientModel mapToIngredientModel() {
    return IngredientModel(
      name: name,
      quantity: quantity,
    );
  }
}

extension IngredientListMapper on List<Ingredient?>? {
  List<IngredientModel> mapToIngredientsModel() {
    return this
            ?.map(
              (ingredient) => ingredient?.mapToIngredientModel(),
            )
            .toList()
            .filterNotNull() ??
        [];
  }
}
